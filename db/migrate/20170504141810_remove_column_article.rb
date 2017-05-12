class RemoveColumnArticle < ActiveRecord::Migration[5.0]
  def change

  	remove_column :articles, :content

  end
end
