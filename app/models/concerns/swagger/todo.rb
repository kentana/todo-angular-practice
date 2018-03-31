module Swagger::Todo
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Todo do
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :name do
        key :type, :string
      end
      property :memo do
        key :type, :string
      end
      property :star do
        key :type, :boolean
      end
      property :done do
        key :type, :boolean
      end
    end
  end
end