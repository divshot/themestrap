module.exports = (grunt) ->
  grunt.initConfig
    bowerDirectory: require('bower').config.directory
    recess:
      dist:
        options:
          compile: true
          includePath: ['less', 'tmp', '<%= bowerDirectory %>/bootstrap/less']
        files:
          'dist/css/bootstrap.css': ['less/theme.less']
    watch:
      less:
        files: ['less/*.less']
        tasks: ['copy', 'recess', 'clean']
        options:
          livereload: true
      cssmin:
        files: ['dist/css/bootstrap.css']
        tasks: ['cssmin:minify']
      assemble:
        files: ['pages/*.html', 'pages/examples/*', 'README.md']
        tasks: ['assemble']
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
    assemble:
      pages:
        options:
          data: './bower.json',
          flatten: true,
          assets: 'dist'
        files:
          'index.html': ['pages/index.html'],
          'examples/': ['pages/examples/*.html']
    copy:
      bootstrap:
        files: [
          { expand: true, cwd: '<%= bowerDirectory %>/bootstrap/less', src: ['bootstrap.less'], dest: 'tmp/' },
          { expand: true, cwd: '<%= bowerDirectory %>/bootstrap/fonts', src: ['*'], dest: 'dist/fonts' }
        ]
    clean: ['tmp']

  grunt.loadNpmTasks('grunt-recess')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-text-replace')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('assemble')

  grunt.registerTask('default', ['copy', 'recess', 'cssmin', 'assemble', 'clean'])
  grunt.registerTask('serve', ['connect', 'watch'])
