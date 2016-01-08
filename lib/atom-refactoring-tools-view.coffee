module.exports =
class AtomRefactoringToolsView
  constructor: (serializedState) ->
    # Create root element
    element = document.createElement('div')
    element.classList.add('atom-refactoring-tools')

    @getElement = ->
      element

    # Tear down any state and detach
    @destroy = ->
      element.remove()

  # Returns an object that can be retrieved when package is activated
  serialize: ->
