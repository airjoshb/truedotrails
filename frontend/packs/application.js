/* eslint no-console:0 */

import { Application } from "stimulus"
import Rails from "rails-ujs"
import Turbolinks from "turbolinks"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))

Rails.start()
Turbolinks.start()

import "../stylesheets/application.css"
