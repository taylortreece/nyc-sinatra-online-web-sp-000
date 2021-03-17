class CreateJoinTableFigureTitles < ActiveRecord::Migration
  def change
    create_join_table :figures, :titles, table_name: :figure_titles
  end
end
