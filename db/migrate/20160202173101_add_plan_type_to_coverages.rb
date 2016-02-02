class AddPlanTypeToCoverages < ActiveRecord::Migration
  def change
    add_column :coverages, :plan_type, :string
  end
end
