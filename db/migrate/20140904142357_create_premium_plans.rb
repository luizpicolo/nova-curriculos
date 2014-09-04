class CreatePremiumPlans < ActiveRecord::Migration
  def change
    create_table :premium_plans do |t|
      t.string :price
      t.string :description

      t.timestamps
    end
  end
end
