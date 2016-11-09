module DataHelper
  def get_account_data(account)
    if account
      @input = account[:selected_account], params[:campaign], params[:ad_group], params[:table]
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
  end
  
  def get_filtered_data(filter_data)
    if filter_data.empty?
      @account_collection.each do |account|
        if account != 'all'
          @totals << totals(GoogleData.where(account: account))
        end
      end
    elsif @input[3]
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
    else
      filter_data.each do |filter|
        @filter_output << totals(filter)
      end
    end
  end

end
