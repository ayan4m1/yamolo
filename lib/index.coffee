fs = require 'fs'
path = require 'path'
mongoose = require 'mongoose'

module.exports = (basePath) ->
  modules = []

  for file in fs.readdirSync basePath
    fileParts = file.match(/(.*)\.(coffee|js)$/)
    return unless fileParts?
    fullPath = path.join(basePath, fileParts[1])
    modules.push mongoose.model(fileParts[1], require(fullPath))

  modules
