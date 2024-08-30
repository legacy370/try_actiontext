class CreateFlexTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :flex_templates do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
