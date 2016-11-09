class GoogleDatasController < ApplicationController
  def index
    @account_collection = GoogleData::ACCOUNT_COLLECTION
    @filter = []
    @keyword = false
    if params[:account]
      @input = params[:account][:selected_account], params[:campaign], params[:ad_group], params[:table]
      @input[0].each do |account|
        if params[:device]
          @filter = []
          @filter << GoogleData.where(device: params[:device][:selected_device], account: account)
        else
          @filter << GoogleData.where(account: account)
        end
      end
      @filter << GoogleData.where(campaign: @input[1])
      @filter << GoogleData.where(ad_group: @input[2])
      @filter.delete([])
    end

    @filter_output = []
    @totals = []
    if @filter.empty?
      @account_collection.each do |account|
        if account != 'all'
          @totals << totals(GoogleData.where(account: account))
        end
      end
    elsif @input[3]
      if @input[3] == 'keyword'
        @keyword = true
        @input[0].each do |account|
          @filter << GoogleData.where(account: account)
        end
        @filter.each do |filter|
          filter.each do |data|
            @filter_output << totals([data])
          end
        end
        @filter_output.sort_by!{|k| k[:account]}
      else
        @input[0].each do |account|
          @filter << GoogleData.where(account: account)
        end
        @filter.first.each do |filter|
          @filter_output << totals(filter)
        end
      end
    else
      @filter.each do |filter|
        @filter_output << totals(filter)
      end
    end
  end

  def totals(data)
    totals = {}
    impressions = 0
    clicks = 0
    cost = 0
    conversions = 0
    totals[:account] = data.first.account
    totals[:keyword] = data.first.keyword
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
