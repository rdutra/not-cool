class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
