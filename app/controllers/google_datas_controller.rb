class GoogleDatasController < ApplicationController
  include DataHelper
  def index
    @account_collection = GoogleData::ACCOUNT_COLLECTION
    @google_data = GoogleData.all
    @filter = []
    @keyword = false
    @campaign = false
    @device = false
    @adgroup = false
    @q = params[:q]
    @input = params[:account], params[:campaign], params[:ad_group], params[:table]
    @filter_output = []
    @totals = []
    respond_to do |format|
      format.html
      format.xls
    end

    if @keyword == false && @campaign == false
      get_account_data(params[:account])
    end
    get_filtered_data(@filter)
  end

  def totals(data)
    totals = {}
    impressions = 0
    clicks = 0
    cost = 0
    conversions = 0
    totals[:account] = data.first.account
    totals[:keyword] = data.first.keyword
    totals[:campaign] = data.first.campaign
    totals[:device] = data.first.device
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
