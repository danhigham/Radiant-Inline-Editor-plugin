class EditController < ApplicationController
  layout nil

  def index
    @page = Page.find(params[:id])  

    @part_name = params[:part] != '' ? params[:part] : 'body'
    part = @page.parts.find_by_name(@part_name)
    
    @content = !part.nil? ? part.filter.filter(part.content) : 'Part undefined!'
  end
  
  def update
    @page = Page.find(params[:page_id])
    part_name = !params[:part].empty? ? params[:part] : 'body'
    part = @page.parts.find_by_name(part_name)

    if part.nil?
      @page.update_attributes!(:parts_attributes => [{:name => part_name, :content => params[:content] }])
    else
      @page.update_attributes!(:parts_attributes => [{:name => part_name, :content => params[:content], :id => part.id}])
    end    
    @page.save
    
    Radiant::Cache.clear

    render :text => 1
  end
  
  def browse_assets
    @assets = Asset.search(params[:search], params[:filter], params[:page])
    
    respond_to do |format|
      format.html { render :layout => 'browse' }
      format.text { render :partial => 'assets_table', :layout => false }
    end
  end
  
  def upload
    @asset = Asset.new(:asset => params[:upload]) 
    @asset.save

    #render :text => asset.asset.url
  end
  
end
