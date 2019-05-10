require 'rails_helper'

describe Link do

  subject { build(:link) }

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:private_notes) }
  end

  context 'validations' do
    it { should validate_presence_of :title }
  end

  context 'ensure correct location' do
    let(:link)    { create(:link, :from_youtube) }
    it 'is a youtube link' do
      expect(link.location).to eq("youtube.com")
    end
  end
end
