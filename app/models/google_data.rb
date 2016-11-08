class GoogleData < ActiveRecord::Base
  validates :impressions, numericality: true, presence: true
  validates :account, presence: true
  validates :clicks, numericality: true, presence: true
  validates :cost, numericality: true, presence: true
  validates :conversions, numericality: true, presence: true
  validates :average_position, numericality: true
  validates :average_position, numericality: true
  validates :search_impression_share, numericality: true
  validates :campaign, presence: true
  validates :ad_group, presence: true
  validates :keyword, presence: true

  ACCOUNT_COLLECTION = []

  GoogleData.all.each do |data|
    ACCOUNT_COLLECTION << data.account
  end
  ACCOUNT_COLLECTION.uniq!
end
