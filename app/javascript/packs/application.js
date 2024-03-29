// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// THIS IS MAKING jQuery AVAILABLE EVEN INSIDE Views FOLDER
global.$ = require("jquery")

require("jquery") // Don't really need to require this...
require("jquery-ui")

$(function(){
    // Plain jquery
    $('#fadeMe').fadeOut(5000);

    // jquery-ui
    const availableCities = ['Baltimore', 'New York', 'Chicago'];
    $('#cityField').autocomplete( { source: availableCities } );
    $('#calendarField').datepicker( { dateFormat: 'yy-mm-dd' } );
})