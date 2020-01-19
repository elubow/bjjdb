class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.send_chain(methods)
    methods.inject(self, :send)
  end
end
