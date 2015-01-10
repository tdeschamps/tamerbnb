$(function() {
  $('body').on('click', '.delete-picture', function() {
    $(this).parent("fieldset").fadeOut(500);
  })

  $('body').on('change', '.upload', function() {
    $(this).parents('form').submit();
  });
});
var function da_Maps() {
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(<%=raw @hash.to_json %>);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });

}
