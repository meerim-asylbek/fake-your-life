import { Controller } from "@hotwired/stimulus"
import Glide from '@glidejs/glide'

new Glide('.glide').mount()

// Connects to data-controller="glide"
export default class extends Controller {
  connect() {
    new Glide('.glide').mount()
  }
}
