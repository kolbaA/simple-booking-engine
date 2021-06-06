module Api
  class Base < Grape::API
    mount Api::Locations::Index
  end
end
