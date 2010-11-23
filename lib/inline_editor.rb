

module InlineEditor
  include Radiant::Taggable
  
  desc "Renders an edit marker on a page"

  desc "Creates a link to launch TinyMCE editor for a peice of content"
  tag "editor" do |tag|

    page = tag.locals.page
    user = UserActionObserver.current_user
    
    if !user.nil?
      %{        
        <div class="editor-link">
          <a href="/edit/#{page.id}?part=#{tag.attr['part']}" rel="edit">#{tag.expand}</a>
        </div>
      }
    end
  end
  
  desc "Adds in all necessary js libs and css for inline-editing"
  tag "editor_libs" do |tag|

    page = tag.locals.page
    user = UserActionObserver.current_user
    
    if !user.nil?
      %{
        <script type="text/javascript" src="/javascripts/jquery-1.4.3.min.js"></script>
        <script src="/ckeditor/ckeditor.js" type="text/javascript"></script>     
        <script type="text/javascript" src="/ckeditor/adapters/jquery/adapter.js"></script>
        <script src="/javascripts/jquery.colorbox-min.js" type="text/javascript"></script>
        <script src="/javascripts/init_editor.js" type="text/javascript"></script>

        <link href="/stylesheets/colorbox.css" media="screen" rel="stylesheet" type="text/css" /> 
        <link href="/stylesheets/inline_editor.css" media="screen" rel="stylesheet" type="text/css" /> 
      }
    end          
  end
  
  
end