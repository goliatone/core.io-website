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

      css: { files: '<%= path.sass %>/**/*.sass', tasks: ['sass'] },

      js: { files: '<%= path.js_dev %>/*.js', tasks: ['jshint'] },

      html: {files: '<%= path.dev %>/html/**/*.mustache', tasks: ['render'] }
    },


    // PRODUCTION

    // minify js
    uglify: {
      all: {
        files: {
          '<%= path.js_prod %>/main.min.js': '<%= path.js_dev %>/main.js',
          '<%= path.js_prod %>/login.min.js': '<%= path.js_dev %>/login.js'
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
            '<%= path.prod %>/features.html': '<%= path.templates %>/features.mustache',
            '<%= path.prod %>/modules.html': '<%= path.templates %>/modules.mustache',
            '<%= path.prod %>/documentation.html': '<%= path.templates %>/documentation.mustache',
            '<%= path.prod %>/documentation-alt-nav.html': '<%= path.templates %>/documentation-alt_nav.mustache',
            '<%= path.prod %>/quickstart.html': '<%= path.templates %>/quickstart.mustache',
            '<%= path.prod %>/styleguide.html': '<%= path.templates %>/styleguide.mustache'
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


    // IMAGES * do-once tasks
    // optimize all images and save in tmp
    imagemin: {                          
      all: {                         
        files: [{ expand: true, cwd: '<%= path.img_dev %>/', src: ['**/*.{png,jpg,gif,svg}'], dest: '<%= path.temp %>/img'}]
      }
    },

    // create svg and png uri stylesheets
    grunticon: {
      options: {
        compressPNG: true,
        colors: {
          // add any color svg should display in, for instance
          white: "#fff",
          gray: "#808a9e",
          lightGray: "#d8d9dd",
          pink: "#fc3257",
          turq: "#2bd5cb"
        },
        enhanceSVG: true // allow for embedding (doesn't work on local)
      },
      icons: {
        options: {
          datasvgcss: 'icons.svg.css',
          datapngcss: 'icons.png.css',
          //urlpngcss: 'icons.fallback.css',
          dynamicColorOnly: true 
        },
        files: [{
          expand: true,
          cwd: '<%= path.temp %>/img/icons',
          src: ['**/*.svg', '**/*.png'],
          dest: '<%= path.icons_prod %>'
        }], 
      },
      logo: {
        options: {
          cssprefix: '.logo-',
          datasvgcss: 'logo.svg.css',
          datapngcss: 'logo.png.css',
         // urlpngcss: 'logo.fallback.css'
        },
        files: [{
          expand: true,
          cwd: '<%= path.temp %>/img/logo',
          src: ['**/*.svg', '**/*.png'],
          dest: '<%= path.logo_prod %>'
        }]
      }
    },

    // create spritesheet for png fallbacks
    sprite: {
      icons: {
        src: '<%= path.icons_prod %>/**/*.png',
        dest: '<%= path.icons_prod %>/icons-spritesheet.png',
        destCss: '<%= path.icons_prod %>/icons.sprites.css',
        cssOpts: {
          cssSelector: function(item) { return '.icon-' + item.name; }
        }
      },
      logo: {
        src: '<%= path.logo_prod %>/**/*.png',
        dest: '<%= path.logo_prod %>/logo-spritesheet.png',
        destCss: '<%= path.logo_prod %>/logo.sprites.css',
        cssOpts: {
          cssSelector: function(item) { return '.logo-' + item.name; }
        }
      }
    },

    
    copy: {
      // copy files to final destination folder
      grunticon: {
        files: [
          {expand: true, flatten: true, src: '<%= path.logo_prod %>/grunticon.loader.js', dest: '<%= path.plugins %>', filter: 'isFile' }
        ]
      },
      images: {
        files: [
          {expand: true, flatten: true, src: ['<%= path.temp %>/img/images/**'], dest: '<%= path.image_prod %>', filter: 'isFile'}
        ]
      },
      // for dev
      js: {
        files: [
          {expand: true, flatten: true, src: ['<%= path.js_dev %>/*.js'], dest: '<%= path.js_prod %>', filter: 'isFile'}
        ]
      }
    }, 


    // HELPERS

    clean: {
      default: [
        '<%= path.js_prod %>/*.js',
        '!<%= path.js_prod %>/*.min.js',
        '<%= path.css %>/*'
      ],
      js: [
        '<%= path.js_prod %>/*.js',
        '!<%= path.js_prod %>/*.min.js',
      ],
      img: [
        '<%= path.img_prod %>/*/grunticon.loader.js',
        '<%= path.img_prod %>/*/png',
        '<%= path.img_prod %>/*/preview.html',
        '<%= path.img_prod %>/*/*.fallback.css',
        '<%= path.temp %>/*'
      ],
      svg: [
        '<%= path.js_prod %>/*/grunticon.loader.js',
        '<%= path.img_prod %>/*/*.svg.css',
      ]
    },

  });


  grunt.registerTask('default', ['clean:default', 'sass', 'jshint', 'copy:js']);
  grunt.registerTask('dist', ['clean:default', 'sass', 'cssmin', 'jshint', 'copy:js', 'uglify', 'clean:js', 'render']);
  grunt.registerTask('render', ['mustache_render:render', 'prettify']);
  grunt.registerTask('img', ['imagemin', 'grunticon', 'copy', 'sprite', 'clean:img']);
  grunt.registerTask('nosvg', ['clean:svg']);
};