class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :dateCreated
      t.string :date
      t.string :title
      t.string :videoId
      t.string :team

      t.timestamps
    end
  end
end
