//= require active_admin/base
//= require activeadmin_addons/all


$(function() {
  $('.datepicker').on('focus', function() {
    $(this).datepicker('option', 'dateFormat', 'dd.mm.yy');
  });
});