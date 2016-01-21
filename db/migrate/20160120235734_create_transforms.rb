class CreateTransforms < ActiveRecord::Migration
  def change
    create_table :transforms do |t|
      t.string         :source_file_name
      t.string         :output_file_name
      t.string         :ip_address
      
      t.timestamps null: false
    end
  end
end
