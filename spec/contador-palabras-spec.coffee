ContadorPalabras = require '../lib/contador-palabras'

describe "ContadorPalabras", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('contador-palabras')

  describe "when the contador-palabras:Activar event is triggered", ->
    it "hides and shows the modal panel", ->

      expect(workspaceElement.querySelector('.contador-palabras')).not.toExist()


      atom.commands.dispatch workspaceElement, 'contador-palabras:Activar'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.contador-palabras')).toExist()

        contadorPalabrasElement = workspaceElement.querySelector('.contador-palabras')
        expect(contadorPalabrasElement).toExist()

        contadorPalabrasPanel = atom.workspace.panelForItem(contadorPalabrasElement)
        expect(contadorPalabrasPanel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'contador-palabras:Activar'
        expect(contadorPalabrasPanel.isVisible()).toBe false

    it "hides and shows the view", ->

      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.contador-palabras')).not.toExist()

      atom.commands.dispatch workspaceElement, 'contador-palabras:Activar'

      waitsForPromise ->
        activationPromise

      runs ->

        contadorPalabrasElement = workspaceElement.querySelector('.contador-palabras')
        expect(contadorPalabrasElement).toBeVisible()
        atom.commands.dispatch workspaceElement, 'contador-palabras:Activar'
        expect(contadorPalabrasElement).not.toBeVisible()
