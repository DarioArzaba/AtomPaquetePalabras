module.exports =
class ContadorPalabrasView
  constructor: (serializedState) ->
    @element = document.createElement('div')
    @element.classList.add('contador-palabras')
    message = document.createElement('div')
    message.textContent = "The ContadorPalabras package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  serialize: ->

  destroy: ->
    @element.remove()

  getElement: ->
    @element
    
  setCount: (count) ->
    displayText = "There are #{count} words."
    @element.children[0].textContent = displayText
    
