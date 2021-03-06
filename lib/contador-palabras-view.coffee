module.exports =
class ContadorPalabrasView
  constructor: (serializedState) ->
    @element = document.createElement('div')
    @element.classList.add('contador-palabras')
    message = document.createElement('div')
    message.textContent = "The ContadorPalabras package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
    
  setCount: (count) ->
    displayText = "There are #{count} words."
    @element.children[0].textContent = displayText
    
