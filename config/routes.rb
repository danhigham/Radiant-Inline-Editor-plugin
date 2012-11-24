ActionController::Routing::Routes.draw do |map|
  map.connect 'edit/upload', :controller => 'edit', :action => 'upload'   
  map.connect 'edit/browse', :controller => 'edit', :action => 'browse_assets'   
  map.connect 'edit/:id', :controller => 'edit', :action => 'index'
  map.connect 'edit/:action/:id', :controller => 'edit'
end