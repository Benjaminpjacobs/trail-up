class Events::SearchController < ApplicationController
  include Location

  def index
    @events = Event.send(filter_params.to_sym, search_params) if filter_params
  end

  private

    def search_params
      {
        location: get_location,
        radius: get_radius,
        query: params[:event_search],
        end_date: (params[:end_date].nil? || params[:end_date].empty?) ? params[:event_search] : params[:end_date],
      }
    end
    
    def filter_params
      if params[:search_by].in?(%w(by_name by_date by_location by_trail))
        params[:search_by]
      end
    end
end
