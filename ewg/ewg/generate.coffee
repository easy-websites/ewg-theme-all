gulp         = require 'gulp'

gulp.task 'generate', gulp.series(
  gulp.parallel(
    'basic-copy:generate'
    'compile-sass:generate'
    'compile-coffee:generate'
    'services-bower:generate'
  ),
  'basic-combine:generate',
  gulp.parallel(
    'minimize-css:generate'
    'minimize-html:generate'
    'minimize-js:generate'
  ),
  'compile-haml:generate',
  gulp.parallel(
    'services-sitemap:generate'
    'services-analytics:generate'
  )
)
