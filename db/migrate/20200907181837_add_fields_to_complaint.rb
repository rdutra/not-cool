class AddFieldsToComplaint < ActiveRecord::Migration[5.2]
  def change
    add_column :complaints, :date, :datetime
    add_column :complaints, :location, :string
    add_column :complaints, :offender, :string
    add_column :complaints, :nature, :string
  end
end
