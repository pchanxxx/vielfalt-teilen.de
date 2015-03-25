//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-datetimepicker.min

$(document).ready(function() {
  var now = new Date();
  now.setMinutes(0);

  $('.datetimepicker.startanytime').datetimepicker({
    format: 'dd.MM.yyyy hh:mm',
    maskInput: true,
    language: 'de-DE',
    pickSeconds: false,
    startDate: -Infinity,
  });

  $('.datetimepicker').datetimepicker({
    format: 'dd.MM.yyyy hh:mm',
    maskInput: true,
    language: 'de-DE',
    pickSeconds: false,
    startDate: now,
  });
});