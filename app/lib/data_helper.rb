module DataHelper
  def get_account_data(account_data)
    if account_data
      account_data[:selected_account].each do |account|
        if params[:device]
          @filter = []
          @filter << GoogleData.where(device: params[:device][:selected_device], account: account)
        else
          @filter << GoogleData.where(account: account)
        end
      end
      @filter << GoogleData.where(ad_group: @input[2])
      @filter.delete([])
    end
  end

  def get_campaign_data(params_campaign)
    if params_campaign
      @campaign = true
      @filter = []
      params[:account][:selected_account].each do |account|
        @filter << GoogleData.where(account: account)
      end
      keyword_objs = []
      @filter.each do |filter|
        GoogleData::CAMPAIGN_COLLECTION.each do |campaign|
          keyword_objs << filter.select{ |data|  data.campaign == campaign }
        end
      end
      binding.pry
      keyword_objs.delete([])
      keyword_objs.each do |data|
        @filter_output << totals(data)
        @filter_output.uniq!
      end
    end
  end

  def get_filtered_data(filter_data)
    binding.pry
    if @input[3]
      if @input[3] == 'keyword'
        @keyword = true
        @input[0].each do |account|
          filter_data << GoogleData.where(account: account)
        end
        keyword_objs = []
        filter_data.each do |filter|
          GoogleData::KEYWORD_COLLECTION.each do |keywords|
            keyword_objs << filter.select{ |data|  data.keyword == keywords }
          end
        end
        keyword_objs.delete([])
        keyword_objs.each do |data|
          @filter_output << totals(data)
          @filter_output.uniq!
        end
      else
        @input[0].each do |account|
          filter_data << GoogleData.where(account: account)
        end
        filter_data.first.each do |filter|
          @filter_output << totals(filter)
        end
      end
    elsif params[:campaign]
      get_campaign_data(params[:campaign])
    else
      filter_data.each do |filter|
        @filter_output << totals(filter)
      end
    end
  end

end
