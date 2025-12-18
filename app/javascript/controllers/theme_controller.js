// app/javascript/controllers/theme_controller.js
// Contrôleur Stimulus pour le mode sombre / clair

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"]

  // Appelé automatiquement quand le contrôleur se connecte à la page
  connect() {
    // Charger le thème sauvegardé (ou "light" par défaut)
    const savedTheme = localStorage.getItem("theme") || "light"
    this.applyTheme(savedTheme)
  }

  // Appelé quand on clique sur le bouton "Mode sombre"
  toggle() {
    // Si le thème actuel est "dark", passer à "light", sinon passer à "dark"
    const currentTheme = document.documentElement.getAttribute("data-theme")
    const newTheme = currentTheme === "dark" ? "light" : "dark"

    this.applyTheme(newTheme)

    // Sauvegarder le choix dans le navigateur
    localStorage.setItem("theme", newTheme)
  }

  // Appliquer le thème à la page
  applyTheme(theme) {
    // Ajouter l'attribut data-theme="dark" ou data-theme="light" sur <html>
    document.documentElement.setAttribute("data-theme", theme)

    // Changer l'icône si elle existe
    if (this.hasIconTarget) {
      if (theme === "dark") {
        // Mode sombre actif -> afficher icône soleil (pour revenir au clair)
        this.iconTarget.classList.remove("fa-moon")
        this.iconTarget.classList.add("fa-sun")
      } else {
        // Mode clair actif -> afficher icône lune (pour passer au sombre)
        this.iconTarget.classList.remove("fa-sun")
        this.iconTarget.classList.add("fa-moon")
      }
    }
  }
}
