import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="star-form"
export default class extends Controller {
  connect() {
    console.log("hellofromStar")
  }
  submit() {
    console.log("hola")
    this.element.submit();
  }
}
