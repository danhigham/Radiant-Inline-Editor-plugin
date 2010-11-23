# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class InlineEditorExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/inline_editor"
  
  define_routes do |map|
    #map.connect 'edit/upload', :controller => 'editor', :action => 'upload'   
    map.connect 'edit/browse', :controller => 'edit', :action => 'browse_assets'   
    #map.connect 'edit/add', :controller => 'editor', :action => 'add_page'   
    #map.connect 'edit/commit', :controller => 'editor', :action => 'commit_details'   
    #map.connect 'edit/commit/:id', :controller => 'editor', :action => 'commit_details'   
    #map.connect 'edit/detail/:id', :controller => 'editor', :action => 'edit_page'   
    map.connect 'edit/:id', :controller => 'edit', :action => 'index'
    map.connect 'edit/:action/:id', :controller => 'edit'
  end
  
  
  # extension_config do |config|
  #   config.gem 'some-awesome-gem
  #   config.after_initialize do
  #     run_something
  #   end
  # end

  # See your config/routes.rb file in this extension to define custom routes
  
  def activate
    # tab 'Content' do
    #   add_item "Inline Editor", "/admin/inline_editor", :after => "Pages"
    # end
    
    Page.send :include, InlineEditor
  end
end
