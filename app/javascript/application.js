// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import Rails from "@rails/ujs";
Rails.start();

// Disable Turbo Drive globally (if you suspect Turbo interference)
document.addEventListener('turbo:load', function() {
    Turbo.session.drive = false;
  });