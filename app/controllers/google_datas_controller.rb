class GoogleDatasController < ApplicationController
  def index
    @account_collection = GoogleData::ACCOUNT_COLLECTION
    @search = GoogleData.where(account: params[:account])
    @mobile = GoogleData.where(device: 'mobile')

    @ibm_impressions = get_category_by_account(GoogleData.where(account: 'IBM'), 'impressions')
    @apple_impressions = get_category_by_account(GoogleData.where(account: 'apple'), 'impressions')
    @paint_impressions = get_category_by_account(GoogleData.where(account: 'paint-night'), 'impressions')
    @google_impressions = get_category_by_account(GoogleData.where(account: 'google'), 'impressions')

    @date_colleaction = []
    @search.each do |data|
      @date_collect << data.date
    end
  end

  def impressions_totals(account_data)
    total_impressions = 0
    account_data.each do |data|
      total_impressions += data.impressions
    end
    total_impressions
  end

  def clicks_totals(account_data)
    total_clicks = 0
    account_data.each do |data|
      total_clicks += data.clicks
    end
    total_clicks
  end

  def cost_totals(account_data)
    total_cost = 0
    account_data.each do |data|
      total_cost += data.cost
    end
    total_cost
  end

  def conversions_totals(account_data)
    total_conversions = 0
    account_data.each do |data|
      total_conversions += data.conversions
    end
    total_conversions
  end

  def get_category_by_account(account, category)
    if category == 'impressions'
      return impressions_totals(account)
    elsif category == 'clicks'
      return clicks_totals(account)
    elsif category == 'cost'
      return cost_totals(account)
    else
      return conversions_totals(account)
    end
  end

end
