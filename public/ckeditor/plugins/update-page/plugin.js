
﻿
(function()
{var updatePageCmd={modes:{wysiwyg:1,source:1},exec:function(editor)
{$('#messagebox').show();$.ajax({type:"POST",url:'/edit/update/'+$('#page_id').val(),data:({page_id:$('#page_id').val(),part:$('#part').val(),content:CKEDITOR.instances.editor.getData(),authenticity_token:document.forms[0].authenticity_token.value}),success:function(response){if(response.match(/1/))
window.location.reload();else
alert('Save failed!');}});}};var pluginName='update-page';CKEDITOR.plugins.add(pluginName,{init:function(editor)
{var command=editor.addCommand(pluginName,updatePageCmd);command.modes={wysiwyg:!!(editor.element.$.form)};editor.ui.addButton('Update',{icon:this.path+'update-page.png',label:editor.lang.save,command:pluginName});}});})();