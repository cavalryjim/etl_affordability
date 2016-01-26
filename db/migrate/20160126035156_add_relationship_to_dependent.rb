class AddRelationshipToDependent < ActiveRecord::Migration
  def change
    add_column :dependents, :relationship, :string
  end
end
