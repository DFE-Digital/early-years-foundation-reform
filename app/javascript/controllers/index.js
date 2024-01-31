import { Application } from '@hotwired/stimulus'
import CharacterCounter from 'stimulus-character-counter'

const application = Application.start()
application.register('character-counter', CharacterCounter)