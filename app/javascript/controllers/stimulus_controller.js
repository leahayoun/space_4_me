import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["status", "ftm", "mtf"]

  connect() {
    this.toggleTreatmentBlocks()
  }

  toggle() {
    this.toggleTreatmentBlocks()
  }

  toggleTreatmentBlocks() {
    const birthSex = this.data.get("birthSex")
    const gender = this.data.get("gender")
    const status = this.statusTarget.value

    // Cacher les deux blocs par défaut
    this.ftmTarget.style.display = "none"
    this.mtfTarget.style.display = "none"

    // Afficher le bloc approprié selon le statut et le sexe/genre
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
