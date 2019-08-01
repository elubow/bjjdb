require 'rails_helper'

describe Comment do
  subject { build(:comment) }

  context 'associations' do
      it { should belong_to :link }
      it { should belong_to :user }
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of :body }
  end

end
