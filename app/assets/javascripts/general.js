jQuery(function() {
  $("a[rel~=popover]").popover();
  $("a[rel~=tooltip]").tooltip();
  $("[data-toggle=popover]").popover();
  $("[data-toggle=tooltip]").tooltip();
});


