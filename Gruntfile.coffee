module.exports = (grunt) ->
  grunt.initConfig
    bowerDirectory: require('bower').config.directory
    less:
      compile:
        options:
          compress: false
          paths: ['less', 'tmp', '<%= bowerDirectory %>/bootstrap/less']
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
        cwd: 'dist/css'
        src: ['*.css', '!*.min.css']
        dest: 'dist/css'
        ext: '.min.css'
    connect:
      serve:
        options:
          port: grunt.option('port') || '8000'
          hostname: grunt.option('host') || 'localhost'
    copy:
      bootstrap:
        files: [
          { expand: true, cwd: '<%= bowerDirectory %>/bootstrap/less', src: ['bootstrap.less'], dest: 'tmp/' },
          { expand: true, cwd: '<%= bowerDirectory %>/bootstrap/fonts', src: ['*'], dest: 'dist/fonts' }
        ]
    clean: ['tmp']

  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-text-replace')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-connect')

  grunt.registerTask('default', ['copy', 'less', 'cssmin', 'clean'])
  grunt.registerTask('serve', ['connect', 'watch'])
