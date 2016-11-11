console = require 'console'
colors  = require 'colors'
gulp    = require 'gulp'
ws      = require 'easy-website-generator'
stage   = require('ewg-config').stage

ws.setGulpRefference gulp

console.log ' -----------------------------------'.green
console.log " | starting Easy-Website-Generator (#{stage.current().red})".green
console.log ' -----------------------------------'.green

require('require-dir')("./ewg/basic", recurse: true)
require('require-dir')("./ewg/compile", recurse: true)
require('require-dir')("./ewg/minimize", recurse: true)
require('require-dir')("./ewg/services", recurse: true)

# have to be last, gulp 4 depends on order
require('require-dir')("./ewg/ewg", recurse: true)

gulp.task('default', gulp.series('serve'))
