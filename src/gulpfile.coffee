gulp = require 'gulp'
jade = require 'gulp-jade'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
flatten = require 'gulp-flatten'
nodemon = require 'gulp-nodemon'
rename = require 'gulp-rename'
{stream} = require 'wiredep'
{log} = require 'gulp-util'

src = './src/{,*/}*.'
dest = './build/'

gulp.task 'templates', ->
    gulp.src src + 'jade'
        .pipe jade()
            .on 'error', log
        .pipe gulp.dest dest
    return

gulp.task 'scripts', ->
    gulp.src src + 'coffee'
        .pipe coffee 
            map: true
            bare: true
        .on 'error', log
        .pipe flatten()
        .pipe gulp.dest './build/lib/'
    return

gulp.task 'nw', ->
    gulp.src src + 'nw'
        .pipe rename 'package.json'
        .pipe gulp.dest dest

gulp.task 'styles', ->
    gulp.src src + 'styl'
        .pipe stylus()
        .pipe gulp.dest dest
    return

gulp.task 'index', ->
    gulp.src './src/index.jade'
        .pipe stream()
        .pipe jade()
            .on 'error', log
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

gulp.task 'build', ['templates', 'styles', 'scripts', 'index', 'nw', 'server']
gulp.task 'default', ['build', 'watch']