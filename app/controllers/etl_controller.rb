class EtlController < ApplicationController
  
  # get /upload_source
  def upload_source
    
  end
  
  def result
    
  end
  
  def output
    @employees = Employee.all
    respond_to do |format|
      format.xls
    end
  end
  
  # post /import_source
  def import_source
    
    if params[:file].present?
      notice = Transform.import_source(params[:file])
    else
      notice = "No file was selected."
    end
    
    redirect_to result_path, notice: notice
  end
  
end
