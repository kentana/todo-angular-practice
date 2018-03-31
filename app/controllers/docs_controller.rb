class DocsController < ApplicationController
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info version: '0.0.0' do
      key :title, 'angular todo practice'
      key :description, 'simple todo api to practice angular.'
      key :termsOfService, ''

      contact do
        key :name, 'kentana'
      end

      license do
        key :name, 'MIT'
      end
    end

    key :host, 'localhost:3000'
    key :basePath, '/'
    key :schemes, ['http']
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    TodosController,
    Todo,
    self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end