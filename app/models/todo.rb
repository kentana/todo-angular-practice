class Todo < ApplicationRecord
  include Swagger::Todo

  def initialize(params={})
    super(params)

    # set default value.
    self.done ||= false
    self.star ||= false

    return self
  end
end
