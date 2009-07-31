class CreateCharacteristics < ActiveRecord::Migration
  def self.up
    create_table :characteristics do |t|
      t.string :name
      t.string :category
      t.float :cocaine
      t.float :ecstacy
      t.float :hallucinogens
      t.float :amphetamines
      t.float :cannabis
      t.float :ketamine
      t.float :amyl_nitrate
      t.float :any_class_a
      t.float :any_stimulant_drug
      t.float :any_drug

      t.timestamps
    end
  end

  def self.down
    drop_table :characteristics
  end
end
