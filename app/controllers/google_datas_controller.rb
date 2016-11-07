class GoogleDatasController < ApplicationController
  def index
    @account_collection = GoogleData::ACCOUNT_COLLECTION
    @search = GoogleData.where(account: params[:account])
  end

  def show
    @search = search
  end

  private
end
