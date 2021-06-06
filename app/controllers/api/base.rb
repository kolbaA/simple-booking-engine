module Api
  class Base < Grape::API
    mount Api::Locations::Index
    mount Api::Bookings::Index
  end
end
