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

    bump:
      options:
        files: [
          'bower.json'
          'package.json'
        ]
        commitFiles: ['.']
        pushTo: 'origin'

    copy:
      lib:
        files:
          'stylesheets/content/_highlight-js.scss': 'node_modules/highlight.js/styles/solarized_light.css'
          'stylesheets/_reset.scss': 'bower_components/meyer-reset/stylesheets/_meyer-reset.scss'

      'new-theme':
        nonull: yes
        files: [
          { expand: yes, cwd: 'images/themes/default/', src: ['*.png'], dest: "images/themes/#{theme}/" }
          { src: 'stylesheets/themes/_default.scss', dest: "stylesheets/themes/_#{theme}.scss" }
        ]
      'save-theme':
        nonull: yes
        files: [
          { expand: yes, cwd: 'images/', src: ['*.png'], dest: "images/themes/#{theme}/" }
          { src: 'stylesheets/_theme.scss', dest: "stylesheets/themes/_#{theme}.scss" }
        ]
      'switch-theme':
        nonull: yes
        files: [
          { expand: yes, cwd: "images/themes/#{theme}/", src: ['*.png'], dest: 'images/' }
          { src: "stylesheets/themes/_#{theme}.scss", dest: 'stylesheets/_theme.scss' }
        ]

    sass:
      stylesheets:
        files:
          'stylesheets/main.css': 'stylesheets/main.scss'

    watch:
      stylesheets:
        files: 'stylesheets/**/*.scss'
        tasks: ['sass', 'newer:autoprefixer']
      theme:
        files: ['stylesheets/_theme.scss', 'images/*.png']
        tasks: ['copy:save-theme']

  grunt.loadNpmTasks plugin for plugin in matchdep.filterDev 'grunt-*'

  grunt.registerTask 'default',
    "Main development task. Remember to provide the '--theme' option for a custom theme.",
    ['copy:lib', 'sass', 'autoprefixer', 'watch']
  
  grunt.registerTask 'new-theme-notes', 'Internal log task.', ->
    grunt.log.ok """
      #{theme} is now ready to be customized! Run the default task first. Then:
      1. Change the variables in _theme.scss. It will automatically be saved.
      2. Adjust the colors of the images in images/. It will automatically be
         saved. Please use the comments in _theme.scss as a guide. Using Sketch
         is suggested.
    """

  grunt.registerTask 'new-theme',
    "Create a new theme for images and colors. Use the '--theme' option."
    ['copy:new-theme', 'new-theme-notes']

  grunt.registerTask 'switch-theme',
    "Switch to the images and colors of an existing theme. Use the '--theme' option."
    ['copy:switch-theme', 'sass', 'autoprefixer']
