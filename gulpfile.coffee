# Base gulp dependencies
gulp         = require 'gulp'
source       = require 'vinyl-source-stream'
buffer       = require 'vinyl-buffer'
gutil        = require 'gulp-util'
rename       = require 'gulp-rename'
browserSync  = require 'browser-sync'

# Dependencies for compiling coffeescript
uglify       = require 'gulp-uglify'
sourcemaps   = require 'gulp-sourcemaps'
browserify   = require 'browserify'
watchify     = require 'watchify'
coffeelint   = require 'gulp-coffeelint'

# Dependencies for compiling sass
sassLint     = require 'gulp-sass-lint'
sass         = require 'gulp-sass'
autoprefixer = require 'gulp-autoprefixer'

# Sources and entry points for compilation
sources =
  sass: 'app/assets/sass/**/*.s+(a|c)ss'
  coffee: 'app/assets/coffee/**/*.coffee'
  views: 'app/views/**/*.{mustache,md,php}'
  php: 'app/**/*.php'
entries =
  sass: 'app/assets/sass/main.sass'
  coffee: 'app/assets/coffee/main.coffee'

###*
 * The default task. Lints and compiles sass and coffeescript
###
gulp.task 'default', ['lint', 'compile']

###*
 * Linting tasks
###
gulp.task 'lint', ['lint:sass', 'lint:coffee']

gulp.task 'lint:sass', () ->
  gulp.src sources.sass
    .pipe sassLint()
    .pipe sassLint.format()
    .pipe sassLint.failOnError()

gulp.task 'lint:coffee', () ->
  gulp.src sources.coffee
    .pipe coffeelint()
    .pipe coffeelint.reporter()
    .pipe coffeelint.reporter('fail')

###*
 * Compilation tasks
###
gulp.task 'compile', ['compile:sass', 'compile:coffee']

gulp.task 'compile:sass', () ->
  gulp.src entries.sass
    .pipe sass().on('error', sass.logError)
    .pipe autoprefixer(
      browsers: ['last 3 versions']
      cascade: false
    )
    .pipe rename('main.css')
    .pipe gulp.dest('public/css/')

gulp.task 'compile:coffee', () ->
  # Set up the browserify instance
  bundler = browserify(
    transform: ['coffeeify']
    debug: true
  )
  bundler.add entries.coffee

  # Compile the source
  bundler.bundle()
    .on 'error', gutil.log
    .pipe source('main.js')
    .pipe buffer()
    .pipe sourcemaps.init(loadMaps: true)
    .pipe uglify()
    .pipe rename('main.min.js')
    .pipe sourcemaps.write('./')
    .pipe gulp.dest('public/js/')

gulp.task 'serve', () ->
  browserSync.init(
    proxy: 'hangman.dev'
  )

  gulp.watch 'public/css/**/*'
    .on 'change', browserSync.reload
  gulp.watch 'public/js/**/*'
    .on 'change', browserSync.reload
  gulp.watch sources.views
    .on 'change', browserSync.reload
  gulp.watch sources.php
    .on 'change', browserSync.reload
  gulp.watch sources.coffee, ['compile:coffee']
  gulp.watch sources.sass, ['compile:sass']
