class AddOfferDateToCoverage < ActiveRecord::Migration
  def change
    add_column :coverages, :offer_date, :date
  end
end
