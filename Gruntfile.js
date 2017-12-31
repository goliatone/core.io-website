module.exports = function(grunt) {

  // load all grunt tasks as found in package.json
  require('load-grunt-tasks')(grunt);

  // use CLI entered page name for mustache-render, default index
  var page_name = grunt.option('name') || 'index';

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
      files: ['Gruntfile.js', '<%= path.js_dev %>/**/*.js', '<%= path.tests /**/*.js']
    },

    // watch changes on css and js and if no errors, reload page
    watch: {
      options: {
        livereload: true,
        livereloadOnError: false
      },

      css: { files: '<%= path.sass %>/**/*.sass', tasks: ['sass', 'postcss'] },

      js: { files: '<%= path.js_dev %>/*.js', tasks: ['jshint'] },

      html: {files: '<%= path.dev %>/html/**/*.mustache', tasks: ['render'] }
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
          '<%= path.css %>/main.css': '<%= path.css %>/main.css',
          '<%= path.css %>/login.css': '<%= path.css %>/login.css'
        }
      }
    },

    // render working html sheets
    mustache_render: {
      options: {
        // partials directory
        directory: '<%= path.partials %>',
        // common data
        data: "<%= path.data %>/page.json",
      },
      // task render final page
      render: {
        files: [
          {
            '<%= path.prod %>/index.html': '<%= path.templates %>/features.mustache',
            '<%= path.prod %>/modules.html': '<%= path.templates %>/modules.mustache',
            '<%= path.prod %>/documentation.html': '<%= path.templates %>/documentation.mustache',
            '<%= path.prod %>/quickstart.html': '<%= path.templates %>/quickstart.mustache',
            '<%= path.prod %>/styleguide.html': '<%= path.templates %>/styleguide.mustache',
            '<%= path.prod %>/examples.html': '<%= path.templates %>/examples.mustache',
            '<%= path.prod %>/documentation.swig': '<%= path.templates %>/documentation-swig.mustache',
          }
        ]
      },
    },

    prettify: {

      files: {
        '<%= path.prod %>/pretty/index.html': '<%= path.prod %>/index.mustache',
        '<%= path.prod %>/modules.html': '<%= path.prod %>/modules.mustache',
        '<%= path.prod %>/pretty/documentation-1.html': '<%= path.prod %>/documentation-1.mustache',
        '<%= path.prod %>/documentation-2.html': '<%= path.prod %>/documentation-2.mustache',
        '<%= path.prod %>/quickstart.html': '<%= path.prod %>/quickstart.mustache',
        '<%= path.prod %>/styleguide.html': '<%= path.prod %>/styleguide.mustache'
      }
    },


    // HELPERS

    copy: {
      // for dev
      js: {
        files: [
          {expand: true, flatten: true, src: ['<%= path.js_dev %>/*.js'], dest: '<%= path.js_prod %>', filter: 'isFile'}
        ]
      }
    },

    clean: {
      default: [
        '<%= path.js_prod %>/*.js',
        '!<%= path.js_prod %>/*.min.js',
        '<%= path.css %>/*'
      ],
      js: [
        '<%= path.js_prod %>/*.js',
        '!<%= path.js_prod %>/*.min.js',
      ]
    }

  });


  grunt.registerTask('default', ['clean:default', 'sass', 'jshint', 'copy:js']);
  grunt.registerTask('dist', ['clean:default', 'sass', 'postcss', 'cssmin', 'jshint', 'copy:js', 'uglify', 'clean:js', 'render']);
  grunt.registerTask('render', ['mustache_render:render', 'prettify']);
  grunt.registerTask('img', ['imagemin', 'grunticon', 'copy', 'sprite', 'clean:img']);
};
