gulp = require 'gulp'
rename = require 'gulp-rename'
jade = require 'gulp-jade'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
flatten = require 'gulp-flatten'
{stream} = require 'wiredep'
{log} = require 'gulp-util'

express = require 'express'
serverport = 5000

# Globbing
# We use e.g.
# {,*/}*.js
# to match only one level down for performance reasons 
# Except for templates
src = './src/{,*/}*.'

dest = './assets/'
locs = {} # jade-gulp requirement

# configure but don't run server
server = express()
`server.use(express.static('./'))`

gulp.task 'index', ->
    gulp.src src+'jade'
        .pipe flatten()
        .pipe jade locals: locs
        .pipe stream() # wire dependencies
            .on 'error', log
        .pipe gulp.dest './'
    return

gulp.task 'templates', ->
    gulp.src './src/views/tpls/*.jade'
        .pipe jade locals: locs
        .pipe gulp.dest dest
    return

gulp.task 'scripts', ->
    gulp.src src+'coffee'
        .pipe coffee map: true
            .on 'error', log
        .pipe gulp.dest dest
    return

gulp.task 'styles', ->
    gulp.src src+'styl'
        .pipe stylus()
        .pipe gulp.dest dest
    return

gulp.task 'serve', ->
    server.listen serverport
    return

gulp.task 'watch', ->
    gulp.watch './src/**/*', ['build']
    return

gulp.task 'build', ['index', 'templates', 'styles', 'scripts']
gulp.task 'default', ['build', 'watch']