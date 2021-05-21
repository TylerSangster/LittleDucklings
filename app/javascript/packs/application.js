require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

var $ = require('jquery');
window.jQuery = $;
window.$ = $;
require("bootstrap");
require('@fortawesome/fontawesome-free');
require("slick-carousel");
require("packs/init_slick");

import "@fortawesome/fontawesome-free/js/all";
import "slick-carousel/slick/slick.scss";
import "slick-carousel/slick/slick-theme.scss";
import "../stylesheets/application";



document.addEventListener("turbolinks:load", function() {
  $('.scroller').slick()
})

