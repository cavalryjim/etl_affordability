# == Schema Information
#
# Table name: transforms
#
#  id               :integer          not null, primary key
#  source_file_name :string
#  output_file_name :string
#  ip_address       :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Transform < ActiveRecord::Base
  
  def self.import_source(file)
    Employee.destroy_all
    Dependent.destroy_all
    Coverage.destroy_all
    source = Transform.open_spreadsheet(file)
    return "Not a spreadsheet" unless source
    #output = Roo::Excelx.new("./etl_output.xlsx")
    
    header = source.row(1)
    row_count = 0
    (2..source.last_row).each do |i|
    #(2..500).each do |i| # JDavis: for testing
      row = source.row(i)
      #next unless spreadsheet.row(i)[0].present?
      #next unless (source.row(i)[0] == "EMPLOYEE_IDENTIFIER") || (source.row(i)[0] == "DEPENDENT")
      if (row[0] == "EMPLOYEE_IDENTIFIER")
        employee = Employee.create(ssn: row[1], emp_id: row[2], first_name: row[3], middle_name: row[4], last_name: row[5], dob: row[7] )
      end
      
      if (row[0] == "OFFERED_COVERAGE") && employee.present?
        employee.coverages.create(plan_name: row[6], outcome: 'waived'  ) unless (employee.coverage_names.include? row[6])
      end
      
      if (row[0] == "SELECTED_COVERAGE") && employee.present?
        coverage = employee.coverages.where(plan_name: row[6]).first_or_initialize
        coverage.outcome = 'selected'
        coverage.enrollment_date = row[9]
        coverage.disenrollment_date = row[10]
        coverage.save
      end
      
      if (row[0] == "DEPENDENT") && employee.present?
        employee.dependents.create(ssn: row[4], first_name: row[5], middle_name: row[6], last_name: row[7], dob: row[10] )
      end
      
      # if spreadsheet.row(i)[0].present? &&
      #   next unless spreadsheet.row(i)[0].is_a? Numeric
      #   row_type = 'unit'
      # elsif spreadsheet.row(i)[1].present?
      #   row_type = 'tenant'
      # else
      #   row_type = nil
      # end
      
      #row_count += 1
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
