require 'rails_helper'

describe User do

  subject { build(:user) }

  context 'associations' do
    it do
      should have_many(:links)
      should have_many(:comments)
      should have_many(:private_notes).dependent(:destroy)
    end
  end
end
