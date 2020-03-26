import Flatpickr from 'stimulus-flatpickr'

import { German } from 'flatpickr/dist/l10n/de.js'

import 'flatpickr/dist/themes/dark.css'

export default class extends Flatpickr {
  initialize() {
    this.config = {
      locale: German
    }
  }
}