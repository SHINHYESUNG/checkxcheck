class CreateSkins < ActiveRecord::Migration
  def change
    create_table :skins do |t|

      t.timestamps
    end
  end
end
