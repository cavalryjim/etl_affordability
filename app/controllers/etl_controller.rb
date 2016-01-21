class EtlController < ApplicationController
  
  # get /upload_source
  def upload_source
    
  end
  
  def present_xls
    
  end
  
  # post /import_source
  def import_source
    
    if params[:file].present?
      notice = Transform.import_source(params[:file])
    else
      notice = "No file was selected."
    end
    
    redirect_to present_xls_path, notice: notice
  end
  
end
