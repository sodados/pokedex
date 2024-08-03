class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.string :genus, null: false
      t.integer :type_id, null: false
      t.text :flavor_text

      t.timestamps
    end
  end
end
