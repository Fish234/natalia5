class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :username
      t.string :content
      t.integer :likes
      t.integer :retweets

      t.timestamps
    end
  end
end
