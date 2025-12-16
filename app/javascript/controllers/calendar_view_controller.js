// app/javascript/controllers/calendar_view_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["monthBtn", "weekBtn", "monthView", "weekView"]

  connect() {
    this.showMonth()
  }

  showMonth() {
    this.monthBtnTarget.classList.add("active")
    this.weekBtnTarget.classList.remove("active")

    this.monthViewTarget.style.display = "block"
    this.weekViewTarget.style.display = "none"
  }

  showWeek() {
    this.weekBtnTarget.classList.add("active")
    this.monthBtnTarget.classList.remove("active")

    this.weekViewTarget.style.display = "block"
    this.monthViewTarget.style.display = "none"
  }
}
