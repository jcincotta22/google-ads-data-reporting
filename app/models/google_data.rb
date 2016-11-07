class GoogleData < ActiveRecord::Base
  validates :impressions, numericality: true, presence: true
  validates :clicks, numericality: true, presence: true
  validates :cost, numericality: true, presence: true
  validates :conversions, numericality: true, presence: true
  validates :average_position, numericality: true
  validates :average_position, format: { with: /[+]?[0-5]{1}(\.\d)/ }, allow_blank: true
  validates :search_impression_share, numericality: true
  validates :campaign, presence: true
  validates :ad_group, presence: true
  validates :keyword, presence: true 
end
