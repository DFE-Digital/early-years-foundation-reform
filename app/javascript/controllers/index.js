import { Application } from '@hotwired/stimulus'
import Reveal from '@stimulus-components/reveal'

const application = Application.start()

application.register('reveal', Reveal)

if (process.env.NODE_ENV === 'development') {
	application.debug = true
} else {
	application.debug = false
}
window.Stimulus = application
export { application }
