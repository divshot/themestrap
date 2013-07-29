module.exports = (grunt) ->
  grunt.initConfig
    less:
      compile:
        options:
          compress: false
          paths: ['bootstrap/less/*', 'lib/*']
        files:
          'dist/bootstrap.css': ['lib/bootstrap.less', 'lib/themestrap.less']
    watch:
      less:
        files: ['lib/*.less']
        tasks: ['less:compile']
        options:
          livereload: true
      cssmin:
        files: ['dist/*.css', 'dist/!*.min.css']
        tasks: ['cssmin:minify']
    cssmin:
      minify:
        expand: true
        cwd: 'dist'
        src: ['*.css', '!*.min.css']
        dest: 'dist'
        ext: '.min.css'
    copy:
      bootstrap:
        files: [
          { expand: true, cwd: 'bootstrap/less', src: ['bootstrap.less'], dest: 'lib/' }
        ]
    replace:
      bootstrap_src:
        src: ['lib/bootstrap.less']
        overwrite: true
        replacements: [{
          from: '@import "'
          to: '@import "bootstrap/less/'
        }]
      bootstrap_variables:
        src: ['lib/bootstrap.less']
        overwrite: true
        replacements: [{
          from: '@import "bootstrap/less/variables.less"'
          to: '@import "variables.less"'
        }]

  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-text-replace')

  grunt.registerTask('default', ['copy', 'replace', 'less', 'cssmin'])