assert = require "assert"
target = require "../003"

describe "Problem 3", ->
  it "should have answer 6857", ->
    assert.equal(target[target.length - 1], 6857)
