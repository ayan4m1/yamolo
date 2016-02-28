mongoose = require 'mongoose'
loader = require '../lib/index'

describe 'the module loader', ->

  it 'should be a function', ->
    expect(loader).toBeDefined()
    loader('.')
    #expect(loader).toHaveBeenCalled()

  it 'should load all source files', ->
    schemas = loader(__dirname + '/example')
    expect(schemas).toBeDefined()
    expect(schemas).not.toBeNull()
    expect(schemas.length).toBe(2)
    expect(mongoose.model('module-one')).toBeDefined()
