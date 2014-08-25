class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
  end
  add_column :recipes, :search_query, :string
end
