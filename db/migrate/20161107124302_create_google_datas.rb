class CreateGoogleDatas < ActiveRecord::Migration[5.0]
  def change
    create_table :google_datas do |t|
      t.string :campaign, null: false
      t.string :ad_group, null: false
      t.string :keyword, null: false
      t.string :match_type
      t.string :device
      t.string :click_type
      t.string :date
      t.string :week
      t.string :month
      t.integer :impressions, null: false, default: 0
      t.integer :clicks, null: false, default: 0
      t.integer :cost, null: false, default: 0
      t.integer :conversions, null: false, default: 0
      t.integer :average_position
      t.integer :search_impression_share
      t.timestamps
    end
  end
end
