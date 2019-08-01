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

  context 'ensure correct search_name' do
    it "has a P for position" do
      tag = Tag.create!(
        category: 'start-position',
        name: 'guard'
      )
      expect(tag.search_name).to eq("[P] guard")
    end

    it "has an S for submission" do
      tag = Tag.create!(
        category: 'submission',
        name: 'kimura'
      )
      expect(tag.search_name).to eq("[S] kimura")
    end
  end

end
