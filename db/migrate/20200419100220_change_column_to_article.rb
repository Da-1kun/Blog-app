class ChangeColumnToArticle < ActiveRecord::Migration[5.2]
  def up
    change_column :articles, :description, :text
  end

  def down
    change_column :articles, :description, :string
  end
end
