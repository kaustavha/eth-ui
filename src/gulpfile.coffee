gulp = require 'gulp'
jade = require 'gulp-jade'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
flatten = require 'gulp-flatten'
nodemon = require 'gulp-nodemon'
{stream} = require 'wiredep'
{log} = require 'gulp-util'

src = './src/{,*/}*.'
dest = './build/'
locs = {} # jade-gulp requirement

gulp.task 'index', ->
    gulp.src './src/index.jade'
        .pipe jade()
            .on 'error', log
            .pipe gulp.dest dest
    return

gulp.task 'wire', ->
    gulp.src './build/index.html'
        .pipe stream()
        .pipe gulp.dest dest
    return

gulp.task 'templates', ->
    gulp.src src + 'jade'
        .pipe jade()
        .pipe gulp.dest dest
    return

gulp.task 'scripts', ->
    gulp.src src + 'coffee'
        .pipe coffee map: true
            .on 'error', log
        .pipe gulp.dest './lib/'
    return

gulp.task 'styles', ->
    gulp.src src + 'styl'
        .pipe stylus()
        .pipe gulp.dest dest
    return

gulp.task 'server', ->
    console.log 'Starting express server on localhost 3000'
    nodemon {script: 'server.js', watch: 'build'}
        .on 'restart', log 'restarted server'
    return

gulp.task 'watch', ->
    gulp.watch src + '*', ['build']
    return

gulp.task 'build', ['index', 'templates', 'styles', 'scripts', 'wire', 'server']
gulp.task 'default', ['build', 'watch']