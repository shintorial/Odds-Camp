import { Application } from "@hotwired/stimulus"

const application = Application.start()
application.debug = false

// บรรทัดนี้สำคัญเพื่อให้ window.Stimulus ทำงาน
window.Stimulus = application

export { application }
