import Flatpickr from 'stimulus-flatpickr'

import { German } from 'flatpickr/dist/l10n/de.js'

import 'flatpickr/dist/themes/dark.css'

export default class extends Flatpickr {
  initialize() {
    this.config = {
      locale: German
    }
  }
  // all flatpickr hooks are available as callbacks in your Stimulus controller
  change(selectedDates, dateStr, instance) {
    console.log('the callback returns the selected dates', selectedDates)
    console.log('but returns it also as a string', dateStr)
    console.log('and the flatpickr instance', instance)
  }
}