AtomRefactoringToolsView = require './atom-refactoring-tools-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomRefactoringTools =
  atomRefactoringToolsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomRefactoringToolsView = new AtomRefactoringToolsView(state.atomRefactoringToolsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomRefactoringToolsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace',
      'atom-refactoring-tools:toggle': => @toggle(),
      'atom-refactoring-tools:extract-method': => @extractMethod(),
      'core:cancel': => @modalPanel.hide()
      'core:confirm': =>
        @modalPanel.hide()
        if editor = atom.workspace.getActiveTextEditor()
          methodName = @atomRefactoringToolsView.getElement().querySelector('atom-text-editor[mini]').getModel().getText()
          editor.cutSelectedText()
          methodBody = atom.clipboard.read()
          extractedMethod = """
            def #{methodName}
              #{methodBody}
            end
          """
          atom.clipboard.write extractedMethod

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomRefactoringToolsView.destroy()

  serialize: ->
    atomRefactoringToolsViewState: @atomRefactoringToolsView.serialize()

  extractMethod: ->
    console.log 'atom-refactoring-tools:extract-method'

    if atom.workspace.getActiveTextEditor()
      # TODO: This implementation needs to be completely rewritten.
      @modalPanel.hide()
      element = @atomRefactoringToolsView.getElement()
      element.innerHTML = """
        <label>Name for the new method:</label>
        <atom-text-editor mini />
      """
      @modalPanel = atom.workspace.addModalPanel(item: @atomRefactoringToolsView.getElement(), visible: false)
      @modalPanel.show()
      element.querySelector('atom-text-editor').focus()

  toggle: ->
    console.log 'AtomRefactoringTools was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
