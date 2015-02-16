# Naive set implementation that only supports primitive values.
class PrimitiveSet
  elements: {}

  constructor: (@items) ->
    @add(item) for item in @items

  size: ->
    @values().length

  add: (value) ->
    # Append a new element with the given value and return the set.
    @elements[value] = value unless value in @elements
    @elements

  clear: ->
    # Remove all elements from the set.
    @elements = {}

  delete: (value) ->
    # Remove the element associated to value and return the value that
    # has(value) would have previously returned.
    delete @elements[value]

  has: (value) ->
    # Return a boolean asserting whether an element is present with the
    # given value in the set or not.
    value in @elements

  values: ->
    # Return an array that contains the values for each element in the set
    Object.keys(@elements)

module.exports = PrimitiveSet
