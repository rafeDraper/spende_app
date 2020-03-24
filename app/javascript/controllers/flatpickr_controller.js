import Flatpickr from 'stimulus-flatpickr'

import { German } from 'flatpickr/dist/l10n/de.js'

export default class extends Flatpickr {
  initialize() {
    this.config = {
      locale: German
    }
  }
}