import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    console.log("✅ Dropdown controller loaded")
  }

  toggle(event) {
    event.stopPropagation()
    console.log("🔁 toggle clicked")
    this.menuTarget.classList.toggle("hidden")
  }

  hide(event) {
    if (!this.element.contains(event.target)) {
      console.log("👋 hide triggered")
      this.menuTarget.classList.add("hidden")
    }
  }
}
