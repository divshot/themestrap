module.exports = (grunt) ->
  grunt.initConfig
    less:
      compile:
        options:
          compress: false
          paths: ['less', 'tmp', 'bower_components/bootstrap/less']
        files:
          'dist/css/bootstrap.css': ['less/theme.less']
    watch:
      less:
        files: ['less/*.less']
        tasks: ['copy', 'less:compile', 'clean']
        options:
          livereload: true
      cssmin:
        files: ['dist/css/bootstrap.css']
        tasks: ['cssmin:minify']
    cssmin:
      minify:
        expand: true
        cwd: 'dist'
        src: ['*.css', '!*.min.css']
        dest: 'dist/css'
        ext: '.min.css'
    copy:
      bootstrap:
        files: [
          { expand: true, cwd: 'bower_components/bootstrap/less', src: ['bootstrap.less'], dest: 'tmp/' }
        ]
    clean: ['tmp']

  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-text-replace')
  grunt.loadNpmTasks('grunt-contrib-clean')

  grunt.registerTask('default', ['copy', 'less', 'cssmin', 'clean'])