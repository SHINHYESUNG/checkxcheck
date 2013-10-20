class CreateItempacks < ActiveRecord::Migration
  def change
    create_table :itempacks do |t|

      t.timestamps
    end
  end
end
