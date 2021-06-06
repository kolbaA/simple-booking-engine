module Api
  module Locations
    class Index < Grape::API
      format :json

      resource :locations do
        desc 'Returns list of locations'
        get do
          Location.all
        end

        mount Api::Locations::Rooms
      end
    end
  end
end
