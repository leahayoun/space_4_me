// app/javascript/controllers/calendar_view_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["monthBtn", "weekBtn", "monthView", "weekView"]

  connect() {
    // initialize with the month
    this.showMonth()
  }

  showMonth() {
    // switch by btn
    this.monthBtnTarget.classList.add('active')
    this.weekBtnTarget.classList.remove('active')

    //  switxh view
    if (this.hasMonthViewTarget) {
      this.monthViewTarget.style.display = 'block'
    }
    if (this.hasWeekViewTarget) {
      this.weekViewTarget.style.display = 'none'
    }

    // 可以在这里触发AJAX加载月视图数据
  }

  showWeek() {
    // 切换按钮状态
    this.weekBtnTarget.classList.add('active')
    this.monthBtnTarget.classList.remove('active')

    // 切换视图显示
    if (this.hasMonthViewTarget) {
      this.monthViewTarget.style.display = 'none'
    }
    if (this.hasWeekViewTarget) {
      this.weekViewTarget.style.display = 'block'
    }

    // 可以在这里触发AJAX加载周视图数据
  }
}
