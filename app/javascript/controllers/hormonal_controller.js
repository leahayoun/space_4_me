import { Controller } from "@hotwired/stimulus"

connect() {
  console.log("Hormonal controller CONNECTED")
  console.log("birthSex:", this.birthSexValue, "gender:", this.genderValue)

  this.toggleTreatmentBlocks()
}

export default class extends Controller {
  static targets = ["status", "ftm", "mtf"]
  static values = {
    birthSex: String,
    gender: String
  }

  connect() {
    this.toggleTreatmentBlocks()
  }

  toggle() {
    this.toggleTreatmentBlocks()
  }

  toggleTreatmentBlocks() {
    const birthSex = this.birthSexValue
    const gender = this.genderValue
    const status = this.statusTarget.value

    console.log("Status:", status)

    this.ftmTarget.style.display = "none"
    this.mtfTarget.style.display = "none"

    if (status === "Oui, j'ai déjà commencé" || status === "Non, mais je compte commencer") {
      if (birthSex === "XX") {
        this.ftmTarget.style.display = "block"
      } else if (birthSex === "XY") {
        this.mtfTarget.style.display = "block"
      } else {
        if (gender === "Homme") this.ftmTarget.style.display = "block"
        if (gender === "Femme") this.mtfTarget.style.display = "block"
      }
    }
  }
}

