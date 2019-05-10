require 'rails_helper'

describe Tag do

  subject { build(:tag) }

  context 'associations' do
    it { should have_and_belong_to_many(:links) }
  end

  context 'validations' do
    it { should validate_presence_of :category }
    it { should validate_presence_of :name }
  end

end
