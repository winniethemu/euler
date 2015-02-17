assert = require "assert"
a003 = require "../003"
a005 = require "../005"
a007 = require "../007"

describe "Problem 3", ->
  it "should have answer 6857", ->
    assert.equal(a003, 6857)

describe "Problem 5", ->
  it "should have answer 232792560", ->
    assert.equal(a005, 232792560)

describe "Problem 7", ->
  it "should have answer 104743", ->
    assert.equal(a007, 104743)
