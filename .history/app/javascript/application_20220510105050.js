// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "bootstrap"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false


$(".success-alert").fadeTo(2000, 500).slideUp(500, function () {
  $(".success-alert").slideUp(500)
})
