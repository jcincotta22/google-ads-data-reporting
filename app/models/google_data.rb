class GoogleData < ActiveRecord::Base
  extend Enumerable

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

  ACCOUNT_COLLECTION = ['all']
  KEYWORD_COLLECTION = []
  CAMPAIGN_COLLECTION = []
  DEVICE_COLLECTION = []
  AD_GROUP_COLLECTION = []

  GoogleData.all.each do |data|
    ACCOUNT_COLLECTION << data.account
    KEYWORD_COLLECTION << data.keyword
    CAMPAIGN_COLLECTION << data.campaign
    DEVICE_COLLECTION << data.device
    AD_GROUP_COLLECTION << data.ad_group
  end
  ACCOUNT_COLLECTION.uniq!
  KEYWORD_COLLECTION.uniq!
  CAMPAIGN_COLLECTION.uniq!
  DEVICE_COLLECTION.uniq!
  AD_GROUP_COLLECTION.uniq!

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |data|
        csv << data.attributes.values_at(*column_names)
      end
    end
  end

end
