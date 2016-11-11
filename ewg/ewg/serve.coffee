browserSync = require('browser-sync').create()
ws          = require 'easy-website-generator'
gulp        = require 'gulp'

gulp.task 'browsersyncInit', gulp.series (done)->
  browserSync.init ws.config.server
  done()

gulp.task 'watchGenerator', =>
  gulp.watch 'src/**/*', gulp.series('generate', (done) =>
                                                    browserSync.reload()
                                                    done()
                                                  )


gulp.task(
  'serve', gulp.series('generate', gulp.parallel('browsersyncInit', 'watchGenerator'))
);
