require 'rails_helper'

describe User do

  subject { build(:user) }

  context 'associations' do
    it do
      should have_many(:links)
    end
  end
end
