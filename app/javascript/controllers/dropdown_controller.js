// app/javascript/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "trigger"]

  connect() {
    console.log("Dropdown controller connected");
  }

  toggle(event) {
    event.preventDefault();
    event.stopPropagation();
    this.menuTarget.classList.toggle('show');
  }

  hide(event) {
    if (!this.element.contains(event.target) && this.menuTarget.classList.contains('show')) {
      this.menuTarget.classList.remove('show');
    }
  }
}
