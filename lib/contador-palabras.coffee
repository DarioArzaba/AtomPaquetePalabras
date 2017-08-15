ContadorPalabrasView = require './contador-palabras-view'
{CompositeDisposable} = require 'atom'

module.exports = ContadorPalabras =
  contadorPalabrasView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @contadorPalabrasView = new ContadorPalabrasView(state.contadorPalabrasViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @contadorPalabrasView.getElement(), visible: false)
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'contador-palabras:Activar': => @Activar()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @contadorPalabrasView.destroy()

  serialize: ->
    contadorPalabrasViewState: @contadorPalabrasView.serialize()

  Activar: ->
    console.log 'MyWordCount was Activard!'
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      editor = atom.workspace.getActiveTextEditor()
      words = editor.getText().split(/\s+/).length
      @contadorPalabrasView.setCount(words)
      @modalPanel.show()
      
    