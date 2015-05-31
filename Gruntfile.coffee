matchdep = require 'matchdep'

module.exports = (grunt) ->

  theme = grunt.option 'theme'
  theme ?= 'default'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    autoprefixer:
      options:
        browsers: ['last 2 versions', 'ie >= 9']
        cascade: yes
        map: yes
      stylesheets:
        src: 'stylesheets/main.css'
        dest: 'stylesheets/main.css'

    copy:
      lib:
        files:
          'stylesheets/content/_highlight-js.scss': 'node_modules/highlight.js/styles/solarized_light.css'
          'stylesheets/_reset.scss': 'bower_components/meyer-reset/stylesheets/_meyer-reset.scss'

      'new-theme':
        nonull: yes
        files: [
          { expand: yes, cwd: 'images/themes/default/', src: ['*'], dest: "images/themes/#{theme}/" }
          { src: 'stylesheets/themes/_default.scss', dest: "stylesheets/themes/_#{theme}.scss" }
        ]
      'save-theme':
        nonull: yes
        files: [
          { src: 'stylesheets/_theme.scss', dest: "stylesheets/themes/_#{theme}.scss" }
        ]
      'switch-theme':
        nonull: yes
        files:
          'images/': "images/themes/#{theme}/*"
          'stylesheets/_theme.scss': "stylesheets/themes/_#{theme}.scss"

    sass:
      stylesheets:
        files:
          'stylesheets/main.css': 'stylesheets/main.scss'

    watch:
      stylesheets:
        files: 'stylesheets/**/*.scss'
        tasks: ['sass', 'newer:autoprefixer']
      theme:
        files: ['stylesheets/_theme.scss']
        tasks: ['copy:save-theme']

  grunt.loadNpmTasks plugin for plugin in matchdep.filterDev 'grunt-*'

  grunt.registerTask 'default', ['copy:lib', 'sass', 'autoprefixer', 'watch']
  
  grunt.registerTask 'new-theme', ['copy:new-theme']
  grunt.registerTask 'switch-theme', ['copy:switch-theme']
