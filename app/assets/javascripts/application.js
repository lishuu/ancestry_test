// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require turbolinks
//= require jquery.ztree.core-3.5
//= require bootstrap-sprockets
//= require fnReloadAjax
//= require toastr_rails
//= require nprogress

$(document).ajaxError(function(event,xhr,options,exc) {

    $('#error_explanation').removeClass("hidden").addClass("visible");
    
    var errors = JSON.parse(xhr.responseText);
    // console.log(errors)
    var er ="<ul>";
    for(var i = 0; i < errors.length; i++){
        var list = errors[i];
        er += "<li>"+list+"</li>"
    }
    er+="</ul>"
    $("#error_explanation").html(er);
       
});

$(document).ready(function() {

  toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-top-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "2000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  };

});


$(document).on('page:restore', function() { NProgress.remove(); });
$(document).on('page:fetch',   function() { NProgress.start(); });
$(document).on('page:change',  function() { NProgress.done(); });



// $(document).ajaxComplete( function(event, request) {
//   var flash = $.parseJSON(request.getResponseHeader('X-Flash-Messages'));
//   console.log(flash);
//   if (!flash) return;
//   console.log("开始显示 flash.notice ")
//   if (flash.notice) { toastr['success'](flash.notice); }
//   // if(flash.notice) { /* code to display the 'notice' flash */ $('.flash.notice').html(flash.notice); }
//   // if(flash.error) { /* code to display the 'error' flash */ alert(flash.error); }
//   //so forth
// });


