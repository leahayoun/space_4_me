// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

eagerLoadControllersFrom("controllers", application)

// 1. Controller pour le dropdown du header
import DropdownController from "./dropdown_controller"
application.register("dropdown", DropdownController)

// 2. Controller pour le FAB button
import FabController from "./fab_controller"
application.register("fab", FabController)

// 3. Controller pour la vue calendrier
import CalendarViewController from "./calendar_view_controller"
application.register("calendar-view", CalendarViewController)
