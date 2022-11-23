class RenameLikesColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column(:users, :postCounter, :post_counter)
  end
end
