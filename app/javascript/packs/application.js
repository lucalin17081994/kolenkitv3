// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "bootstrap";
import "../stylesheets/application";  // <- Add this line

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
});
window.jQuery = $;
window.$ = $;
// $(document).ready(function() {
//   var wm=$('#winkelmandje');
//   $(".add-to-cart").click(function(e) {


//     wm[0].innerHTML = ("<%= j (render partial: 'random') %>")
    


//   });
// });
$(function () {
  
  var checked=false;
  var text=$(".heleBestelling").html()
  $('#bestelling_isBezorgd').change(function () {  
    $($('label[for="bestelling_address"]')[0]).text("Naam"); 
    $(".heleBestelling").html(text);
    $("#zsm_checkbox")[0].style.display="none";
    if (this.checked ){
      $('#timefields_ophaal')[0].style.display="none";
      $('#timefields_bezorg')[0].style.display="block";
      $("#zsm_checkbox")[0].style.display="block";
      checked=true;
      $.get('/current_user', function(result){
        $($('#bestelling_address')[0]).val(result.address);
      });
      $($('label[for="bestelling_address"]')[0]).text("Adres");
      $(".heleBestelling").html(text+"<h3 class=\"card-body\">bezorg kosten: <div style=\"float:right;\">subtotaal: €2.00</div><hr></h3>");
      var bedrag=$("#totaalbedrag").text()
      $("#totaalbedrag").html(parseFloat(bedrag)+2);
    }
    if (!this.checked && checked){
      $("#zsm_checkbox")[0].style.display="none";
      $('#timefields_ophaal')[0].style.display="block";
      $('#timefields_bezorg')[0].style.display="none";
      checked=false;
      $.get('/current_user', function(result){
        $($('#bestelling_address')[0]).val(result.name);
      });
      
      var bedrag=$("#totaalbedrag").text()
      $("#totaalbedrag").html(parseFloat(bedrag)-2);
    }
    
    
  }).change(); //ensure visible state matches initially
});

// function myFunction() {
//   // Get the checkbox
//   var checkBox = document.getElementById("bestelling_time");
//   // Get the output text
//   var timefields = document.getElementById("timefields");

//   // If the checkbox is checked, display the output text
//   if (checkBox.checked == true){
//     timefields.display="block";
//   } else {
//     text.style.display = "none";
//   }
// }
$(function () {
  

  $("#bestelling_zsm_box").change(function () { 
    if (this.checked ){
      $('#timefields')[0].style.display="none";
    }else{
      $('#timefields')[0].style.display="block";
    }
  
  }).change(); //ensure visible state matches initially
});



$(function(){
  $("#printbutton").click(function (){
    window.print();
    window.print();
  })
})


