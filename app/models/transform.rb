class Transform < ActiveRecord::Base
  
  def self.import_source(file)
    spreadsheet = Transform.open_spreadsheet(file)
    return "Not a spreadsheet" unless spreadsheet
    
    header = spreadsheet.row(1)
    row_count = 0
    (2..spreadsheet.last_row).each do |i|
      next unless spreadsheet.row(i)[0].present?
      row_count += 1
      # if spreadsheet.row(i)[0].present? &&
      #   next unless spreadsheet.row(i)[0].is_a? Numeric
      #   row_type = 'unit'
      # elsif spreadsheet.row(i)[1].present?
      #   row_type = 'tenant'
      # else
      #   row_type = nil
      # end
      
    end
    
    return "Success! #{row_count.to_s} rows counted."
  end
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    #when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
      #else raise "Unknown file type: #{file.original_filename}"
    else false
    end
  end
  
end
