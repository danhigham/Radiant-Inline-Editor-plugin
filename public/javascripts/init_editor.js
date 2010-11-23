var inline_editor;

$(document).ready(function(){
  $("div#cboxCurrent")[0].style.visibility = "hidden";
  $("div#cboxNext")[0].style.visibility = "hidden";
  $("div#cboxPrevious")[0].style.visibility = "hidden";

  $("a[rel='edit']").colorbox({height:450, width:650, scrollbars:false, transition:"none"}, function (){
    var config = {
			toolbar : [
        ['Source','-','Update','NewPage','Preview','-','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        '/',
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image','Flash','Table','HorizontalRule','SpecialChar','PageBreak'],
        ['Styles','Format'],
        ['TextColor','BGColor'],
        ['Maximize', 'ShowBlocks','-']
      ],
      name : 'inline_editor',
      extraPlugins : 'update-page',
      filebrowserBrowseUrl : '/edit/browse',
      filebrowserUploadUrl : '/edit/upload'
		};

    if ( inline_editor )
      CKEDITOR.remove_by_name("editor");
    
    inline_editor = $('.ckeditor').ckeditor(config);

  });
});

function post_and_redirect (form){
  showWait();

  $.ajax({
    type: "POST",
    url: form[0].action,
    data: form.serialize(),
    dataType: "text",
    success: function(redirect){
      hideWait();

      $("#cboxWrapper").fadeOut();
      window.location = redirect;
    }
  });
}

function showWait(){
  $('#cboxLoadedContent').fadeTo('fast', 0.2, function(){
    $('#cboxLoadingGraphic').fadeIn();
  });
}

function hideWait(){
  $('#cboxLoadingGraphic').fadeOut();
    $('#cboxLoadedContent').fadeTo('fast', 1.0, function(){
  });
}
