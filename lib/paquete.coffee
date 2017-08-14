PaqueteView = require './paquete-view'
{CompositeDisposable} = require 'atom'

module.exports = Paquete =
  paqueteView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @paqueteView = new PaqueteView(state.paqueteViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @paqueteView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'paquete:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @paqueteView.destroy()

  serialize: ->
    paqueteViewState: @paqueteView.serialize()

  toggle: ->
    console.log 'Paquete was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
