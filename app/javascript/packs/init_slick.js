// bootstrap 4 breakpoints
const breakpoint = {
  // small screen / phone
  sm: 576,
  // medium screen / tablet
  md: 768,
  // large screen / desktop
  lg: 992,
  // extra large screen / wide desktop
  xl: 1200
};
console.log("custom init slick js file loaded")

document.addEventListener("turbolinks:load", function() {
  // // bootstrap 4 responsive multi column slick carousel
$('#slick_edu').slick({
  autoplay: true,
  autoplaySpeed: 4000,
  draggable: true,
  pauseOnHover: false,
  infinite: true,
  dots: false,
  arrows: true,
  speed: 1000,
  
  mobileFirst: true,
  
  slidesToShow: 1,
  slidesToScroll: 1,
  
  responsive: [{
      breakpoint: 576,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3
      }
    },
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 4,
        slidesToScroll: 4
      }
    }
  ]
});
})
