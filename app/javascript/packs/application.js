require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

var $ = require('jquery');
window.jQuery = $;
window.$ = $;

require('@fortawesome/fontawesome-pro');

require("bootstrap");
require("slick-carousel");
require("packs/init_slick");

import "@fortawesome/fontawesome-pro/js/all";
import "slick-carousel/slick/slick.scss";
import "slick-carousel/slick/slick-theme.scss";
import "../stylesheets/application";



document.addEventListener("turbolinks:load", function() {
  $('.scroller').slick()
})

