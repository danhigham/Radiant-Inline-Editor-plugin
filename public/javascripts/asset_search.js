$(document).ready(function() {
  $('#asset_search').bind('keyup', function() {
    
    var search = $('#asset_search').val();
    
    setTimeout(function() {
      if (search == $('#asset_search').val()){
        $.ajax({
         type: "POST",
         url: "/edit/browse",
         data: ({
                search: $('#asset_search').val(),
                authenticity_token: AUTH_TOKEN,
              }),
         dataType: "text",
         success: function(markup){
           $('#asset-data-view').html(markup);
         }
       });
     }
   }, 500);
  });
  
  $('td.asset-title').bind('click', function(sender) {
    
    var dialog = window.opener.CKEDITOR.dialog.getCurrent();
    var uploadControl = dialog.getContentElement('Upload', 'upload');
    uploadControl.reset();  

    var image_url = sender.currentTarget.attributes['url'].value;

    dialog.setValueOf('info', 'txtUrl', image_url);
    dialog.selectPage('info');

    window.close();
  });
  
});
