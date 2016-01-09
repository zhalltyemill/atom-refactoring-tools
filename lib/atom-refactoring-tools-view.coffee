module.exports =
class AtomRefactoringToolsView
  constructor: (serializedState) ->
    @getElement = ->
      element

    @reset = ->
      element.innerHTML = """
        <label>Name for the new method:</label>
        <atom-text-editor mini />
      """
      @

    element = document.createElement('div')
    element.classList.add('atom-refactoring-tools')
    @reset()

    # Tear down any state and detach
    @destroy = ->
      element.remove()

  # Returns an object that can be retrieved when package is activated
  serialize: ->
