module.exports = function(grunt) {

  // load all grunt tasks as found in package.json
  require('load-grunt-tasks')(grunt);

  grunt.initConfig({

    path: grunt.file.readJSON('settings/tree.json'),

    // DEVELOPMENT

    // compile sass
    sass: {
      all: {
        files: [{
          expand: 'true',
          cwd: '<%= path.sass %>',
          src: ['*.sass'],
          dest: '<%= path.css %>',
          ext: '.css'
        }]
      }
    },

    // add vendor prefixes
    postcss: {
      options: {
        map: false,
        processors: [
          require('autoprefixer')({browsers: 'last 3 versions'})
        ]
      },
      dist: {
        src: ['<%= path.css %>/*.css']
      }
    },

    // generate sass documentation
    sassdoc: {
      default: {
        src: '<%= path.sass %>',
      },
    },

    // lint js
    jshint: {
      files: ['Gruntfile.js', '<%= path.js_dev %>/**/*.js']
    },

    // watch changes on css and js and if no errors, reload page
    watch: {
      options: {
        livereload: true,
        livereloadOnError: false
      },

      css: { files: '<%= path.sass %>/**/*.sass', tasks: ['sass', 'postcss'] },

      js: { files: '<%= path.js_dev %>/*.js', tasks: ['jshint'] },

      html: {files: '<%= path.templates %>/**/*.swig', tasks: ['swig'] }
    },


    // PRODUCTION

    // minify js
    uglify: {
      all: {
        files: {
          '<%= path.js_prod %>/main.min.js': '<%= path.js_dev %>/main.js'
        }
      }
    },

    // minify css
    cssmin: {
      all: {
        files: {
          '<%= path.css %>/main.min.css': '<%= path.css %>/main.css',
        }
      }
    },

    swig: {
      options: {
        data: require('./src/html/data/metadata.json')
      },
      swig: {
        expand: true,
        cwd: '<%= path.html_templates %>',
        dest: '<%= path.prod %>/',
        src: ['*.swig'],
        ext: '.html'
      }
    },

    // render html prod src
    processhtml: {
      prod: {
        // files: {
        //   'dist/index.html': ['dist/index.html']
        // }
        expand: true,
        cwd: '<%= path.prod %>',
        dest: '<%= path.prod %>/',
        src: ['*.html'],
      }
    },

    // HELPERS

    copy: {
      js: {
        files: [
          {expand: true, flatten: true, src: ['<%= path.js_dev %>/*.js'], dest: '<%= path.js_prod %>', filter: 'isFile'}
        ]
      }
    },

    clean: {
      all: [
        '<%= path.js_prod %>/*.js',
        '<%= path.css %>/*'
      ],
      js: [
        '<%= path.js_prod %>/*.js',
        '!<%= path.js_prod %>/*.min.js'
      ],
      css: [
        '<%= path.css %>/*',
        '!<%= path.css %>/*.min.css'
      ]
    }

  });

  // generate devolopment files in dist:
  //  compile sass and add prefixes
  //  lint js and populate dist/js
  //  render html
  grunt.registerTask('build_dev', ['clean:all', 'sass', 'postcss', 'jshint', 'copy:js', 'swig']);
  // generate production files in dist:
  //  compile sass, add prefixes and minify css
  //  lint and minify js
  //  render html
  grunt.registerTask('build', ['clean:all', 'sass', 'postcss', 'cssmin', 'clean:css', 'jshint', 'copy:js', 'uglify', 'clean:js', 'swig', 'processhtml']);
};
