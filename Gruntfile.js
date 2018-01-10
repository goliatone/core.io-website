module.exports = function(grunt) {

  // load all grunt tasks as found in package.json
  require('load-grunt-tasks')(grunt);

  grunt.initConfig({

    path: grunt.file.readJSON('settings/tree.json'),

    // CSS ---------------------------------------------

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

    // minify css
    cssmin: {
      all: {
        files: {
          '<%= path.css %>/main.min.css': '<%= path.css %>/main.css',
        }
      }
    },

    // generate sass documentation
    sassdoc: {
      default: {
        src: '<%= path.sass %>',
      },
    },


    // JS ----------------------------------------------

    // lint js
    jshint: {
      files: ['Gruntfile.js', '<%= path.js_dev %>/**/*.js']
    },

    // minify js
    uglify: {
      all: {
        files: {
          '<%= path.js_prod %>/main.min.js': '<%= path.js_dev %>/main.js'
        }
      }
    },


    // HTML --------------------------------------------

    // render html
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

    // update html production links to minified css and js
    processhtml: {
      prod: {
        expand: true,
        cwd: '<%= path.prod %>',
        dest: '<%= path.prod %>/',
        src: ['*.html'],
      }
    },


    // HELPERS -----------------------------------------

    // watch changes on css, js and html
    // if no errors, reload page
    watch: {
      options: {
        livereload: true,
        livereloadOnError: false
      },

      css: { files: '<%= path.sass %>/**/*.sass', tasks: ['sass', 'postcss'] },

      js: { files: '<%= path.js_dev %>/*.js', tasks: ['jshint'] },

      html: {files: '<%= path.templates %>/**/*.swig', tasks: ['swig'] }
    },

    copy: {
      js: {
        files: [
          {
            expand: true,
            flatten: true,
            src: ['<%= path.js_dev %>/*.js'],
            dest: '<%= path.js_prod %>',
            filter: 'isFile'
          }
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
  //  update css and js links to minified versions
  grunt.registerTask('build', ['clean:all', 'sass', 'postcss', 'cssmin', 'clean:css', 'jshint', 'copy:js', 'uglify', 'clean:js', 'swig', 'processhtml']);
};
