class AddColumnAvatarProcessingToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :avatar_processing, :boolean, null: false, default: false
  end
end
