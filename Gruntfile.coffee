matchdep = require 'matchdep'

module.exports = (grunt) ->

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

    sass:
      stylesheets:
        files:
          'stylesheets/main.css': 'stylesheets/main.scss'

    watch:
      stylesheets:
        files: 'stylesheets/**/*.scss'
        tasks: ['newer:sass', 'newer:autoprefixer']

  grunt.loadNpmTasks plugin for plugin in matchdep.filterDev 'grunt-*'

  grunt.registerTask 'default', ['sass', 'autoprefixer', 'watch']
