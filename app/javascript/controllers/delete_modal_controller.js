// app/javascript/controllers/delete_modal_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay", "form", "eventName"]

  connect() {
    // Close modal with Escape key
    this.boundKeydown = this.handleKeydown.bind(this)
    document.addEventListener('keydown', this.boundKeydown)
  }

  disconnect() {
    document.removeEventListener('keydown', this.boundKeydown)
  }

  open(event) {
    event.preventDefault()
    const button = event.currentTarget
    const url = button.dataset.deleteUrl
    const title = button.dataset.appointmentTitle

    this.formTarget.action = url
    this.eventNameTarget.textContent = title
    this.overlayTarget.classList.add('active')
    document.body.style.overflow = 'hidden'
  }

  close() {
    this.overlayTarget.classList.remove('active')
    document.body.style.overflow = ''
  }

  closeOnOverlay(event) {
    if (event.target === this.overlayTarget) {
      this.close()
    }
  }

  handleKeydown(event) {
    if (event.key === 'Escape' && this.overlayTarget.classList.contains('active')) {
      this.close()
    }
  }
}
