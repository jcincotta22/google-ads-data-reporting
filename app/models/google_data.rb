class GoogleData < ActiveRecord::Base
  extend Enumerable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  scope :keyword_campaign_view, -> account, keyword, campaign { where(account: account, keyword: keyword, campaign: campaign) }
  scope :keyword_campaign_day_view, -> account, keyword, campaign, day { where(account: account, keyword: keyword, campaign: campaign, date: day)}
  scope :keyword_campaign_week_view, -> account, keyword, campaign, week { where(account: account, keyword: keyword, campaign: campaign, week: week)}
  scope :keyword_campaign_month_view, -> account, keyword, campaign, month { where(account: account, keyword: keyword, campaign: campaign, month: month)}
  scope :campaign_week, -> account, campaign, week { where(account: account, campaign: campaign, week: week) }
  scope :all_account_data, -> account { where(account: account)}

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
  WEEK_COLLECTION = []
  MONTH_COLLECTION = []
  DATE_COLLECTION = []

  GoogleData.all.each do |data|
    ACCOUNT_COLLECTION << data.account
    KEYWORD_COLLECTION << data.keyword
    CAMPAIGN_COLLECTION << data.campaign
    DEVICE_COLLECTION << data.device
    AD_GROUP_COLLECTION << data.ad_group
    WEEK_COLLECTION << data.week
    MONTH_COLLECTION << data.month
    DATE_COLLECTION << data.date
  end
  ACCOUNT_COLLECTION.uniq!
  KEYWORD_COLLECTION.uniq!
  CAMPAIGN_COLLECTION.uniq!
  DEVICE_COLLECTION.uniq!
  AD_GROUP_COLLECTION.uniq!
  MONTH_COLLECTION.uniq!
  WEEK_COLLECTION.uniq!
  DATE_COLLECTION.uniq!

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |data|
        csv << data.attributes.values_at(*column_names)
      end
    end
  end


end
