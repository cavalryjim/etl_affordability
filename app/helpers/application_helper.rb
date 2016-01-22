module ApplicationHelper
  
  def mo_da_yr(d)
    d.strftime("%m/%d/%Y") if d
  end
  
end
