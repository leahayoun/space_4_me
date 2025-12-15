// app/javascript/controllers/fab_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "button"]

  connect() {
    console.log("FAB控制器连接成功");
  }

  // switch menu visibility
  toggleMenu(event) {
    event.stopPropagation(); // prevent the click from bubbling up
    this.menuTarget.classList.toggle('show');
  }

  // click outside to close menu
  closeMenu(event) {
    // if the click is outside the FAB element, close the menu
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.remove('show');
    }
  }

  // stop propagation to prevent menu from closing when clicking inside
  preventClose(event) {
    event.stopPropagation();
  }
}
