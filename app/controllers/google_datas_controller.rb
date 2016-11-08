class GoogleDatasController < ApplicationController
  def index
    @account_collection = GoogleData::ACCOUNT_COLLECTION
    @search = GoogleData.where(account: params[:account])
    @mobile = GoogleData.where(device: 'mobile')
    @totals = []
    @totals << totals(GoogleData.where(account: 'IBM'))
    @totals << totals(GoogleData.where(account: 'paint-night'))
    @totals << totals(GoogleData.where(account: 'apple'))
    @totals << totals(GoogleData.where(account: 'google'))
  end

  def totals(data)
    totals = {}
    impressions = 0
    clicks = 0
    cost = 0
    conversions = 0
    totals[:account] = data.first.account
    data.each do |data|
      impressions += data.impressions
      clicks += data.clicks
      cost += data.cost
      conversions += data.conversions
    end
    totals[:clicks] = clicks
    totals[:cost] = cost
    totals[:conversions] = conversions
    totals[:impressions] = impressions
    totals[:ctr] = ((clicks.to_f / impressions.to_f) * 100).round(2)
    totals[:cpc] = (cost / clicks)
    totals[:conv_rate] = ((conversions.to_f / clicks.to_f) * 100).round(2)
    totals[:cpa] = (cost / conversions)
    return totals
  end

end
