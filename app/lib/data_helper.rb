module DataHelper
  def get_account_data(account_data)
    if account_data
      account_data[:selected_account].each do |account|
          @filter << GoogleData.where(account: account)
      end
      @filter << GoogleData.where(ad_group: @input[2])
      @filter.delete([])
    else
      @account_collection.each do |account|
        @filter << GoogleData.where(account: account)
      end
    end
  end

  def get_selected_device_data(params_device)
    if params_device
      @device = true
      @filter = []
      params[:account][:selected_account].each do |account|
        @filter << GoogleData.where(account: account)
      end
      keyword_objs = []
      @filter.each do |filter|
        params_device.each do |device|
          keyword_objs << filter.select{ |data|  data.device == device }
        end
      end
      keyword_objs.delete([])
      keyword_objs.each do |data|
        @filter_output << totals(data)
        @filter_output.uniq!
      end
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
      keyword_objs.delete([])
      keyword_objs.each do |data|
        @filter_output << totals(data)
        @filter_output.uniq!
      end
    end
  end

  def get_campaign_and_keyword_data(params_campaign, params_keyword)
    if params_campaign && params_keyword
      @campaign = true
      @keyword = true
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
      campaign_keywords = []
      keyword_objs.each do |filter|
        GoogleData::KEYWORD_COLLECTION.each do |keywords|
          campaign_keywords << filter.select{ |data|  data.keyword == keywords }
        end
      end
      campaign_keywords.delete([])
      campaign_keywords.each do |data|
        @filter_output << totals(data)
        @filter_output.uniq!
      end
    end
  end

  def get_filtered_data(filter_data)
    filter_data.delete([])
    if @input[3] && !params[:campaign]
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
        # ad_group goes heere
        @input[0].each do |account|
          filter_data << GoogleData.where(account: account)
        end
        filter_data.first.each do |filter|
          @filter_output << totals(filter)
        end
      end
    elsif params[:campaign] && !params[:table]
      get_campaign_data(params[:campaign])
    elsif params[:campaign] && params[:table] && !params[:device]
      get_campaign_and_keyword_data(params[:campaign], params[:table])
    elsif params[:device] && !params[:table]  && !params[:campaign]
      get_selected_device_data(params[:device][:selected_device])
    else
      filter_data.each do |filter|
        @filter_output << totals(filter)
      end
    end
  end

end
