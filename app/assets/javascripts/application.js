// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function($) {

    $(".clickableRow").click(function() {
        window.document.location = $(this).data("url");
    });

    $('.user-autocomplete').autocomplete({
        serviceUrl: '/users/autocomplete',
        onSelect: function (suggestion) {
            alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
        }
    });

    $('.wingsuit-autocomplete').autocomplete({
        serviceUrl: '/wingsuits/autocomplete',
        onSelect: function (suggestion) {
            $('#wingsuit-id').val(suggestion.data);
            $('#wingsuit-class').text(suggestion.ws_class);
        },
        categories: true
    });

    $('.datepicker').datepicker({
        format: 'dd.mm.yyyy',
        startDate: 0,
        language: 'ru',
        autoclose: true,
        todayHighlight: true
    });

});