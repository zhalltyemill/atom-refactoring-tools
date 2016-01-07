AtomRefactoringTools = require '../lib/atom-refactoring-tools'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomRefactoringTools", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('atom-refactoring-tools')

  describe "when the atom-refactoring-tools:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.atom-refactoring-tools')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'atom-refactoring-tools:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.atom-refactoring-tools')).toExist()

        atomRefactoringToolsElement = workspaceElement.querySelector('.atom-refactoring-tools')
        expect(atomRefactoringToolsElement).toExist()

        atomRefactoringToolsPanel = atom.workspace.panelForItem(atomRefactoringToolsElement)
        expect(atomRefactoringToolsPanel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'atom-refactoring-tools:toggle'
        expect(atomRefactoringToolsPanel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.atom-refactoring-tools')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'atom-refactoring-tools:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        atomRefactoringToolsElement = workspaceElement.querySelector('.atom-refactoring-tools')
        expect(atomRefactoringToolsElement).toBeVisible()
        atom.commands.dispatch workspaceElement, 'atom-refactoring-tools:toggle'
        expect(atomRefactoringToolsElement).not.toBeVisible()

  describe 'atom-refactoring-tools:extract-method', ->
    describe 'text is selected', ->
      beforeEach ->
        @selectedText = 'Here is some selected text!'
        workspace = atom.workspace
        waitsForPromise ->
          workspace.open()
        runs ->
          @editor = workspace.getActiveTextEditor()

          # TODO: we need to test with not all the text selected
          @editor.setText @selectedText
          @editor.selectAll()
          atom.commands.dispatch workspaceElement, 'atom-refactoring-tools:extract-method'
          waitsForPromise -> activationPromise

      it 'cuts the selection to the clipboard', ->
        expect(@editor.getText()).toBe ''
        expect(atom.clipboard.read()).toBe @selectedText

      it 'shows a modal panel', ->
        jasmine.attachToDOM(workspaceElement)
        extractModal = workspaceElement.querySelector('.atom-refactoring-tools')
        expect(extractModal).toBeVisible()
        expect(extractModal).toHaveText 'Name for the new method:'
