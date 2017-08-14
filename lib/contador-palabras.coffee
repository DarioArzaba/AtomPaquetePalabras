ContadorPalabrasView = require './contador-palabras-view'
{CompositeDisposable} = require 'atom'

module.exports = ContadorPalabras =
  contadorPalabrasView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @contadorPalabrasView = new ContadorPalabrasView(state.contadorPalabrasViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @contadorPalabrasView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'contador-palabras:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @contadorPalabrasView.destroy()

  serialize: ->
    contadorPalabrasViewState: @contadorPalabrasView.serialize()

  toggle: ->
    console.log 'ContadorPalabras was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
