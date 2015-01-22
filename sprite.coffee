extend = require 'node.extend'

class Sprite
  "use strict"

  _defaults:
    width: 64
    height: 64
    offset: 0
    imgPath: ''
    imgHeight: null
    frame: 30

  constructor: (@el, opts) ->
    @opts = extend {}, @_defaults, opts
    @el.style.background = "url(#{@opts.imgPath}) no-repeat 0 0"

    # 上下に同じ分offsetがある場合 +1
    @_offsetAll = (@opts.frame + 1) * @opts.offset

  update: (num) ->
    pos = -((@opts.imgHeight - @_offsetAll) / @opts.frame * num + (@opts.offset * num) + @opts.offset)
    @el.style.backgroundPosition = "0 #{pos}px"
    return this

if typeof define is 'function' and define.amd
  define -> Sprite
else if typeof module isnt 'undefined' and module.exports
  module.exports = Sprite
else
  global.Sprite or= Sprite
