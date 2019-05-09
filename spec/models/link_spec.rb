require 'rails_helper'

describe Link do

  subject { build(:link) }

  context 'associations' do
    it do
      should belong_to(:user)
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of :user_id }
    it { should validate_presence_of :title }
    it { should validate_presence_of :url }
  end
end
