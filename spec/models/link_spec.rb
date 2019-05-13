require 'rails_helper'

describe Link do
  subject { build(:link) }

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:private_notes) }
    it { should have_and_belong_to_many(:instructors) }
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

  context 'ensures clean url parameters' do
    let!(:user) { create(:user) }

    it "leaves non-special location links alone" do
      link = Link.create!(
        title: 'Youtube 1',
        url: 'https://www.bjjglobetrotters.com/inaction/summercamp2019-someone-says-something-useful',
        user_id: User.first.id)
      expect(link.url).to be_a_similar_url_to("https://www.bjjglobetrotters.com/inaction/summercamp2019-someone-says-something-useful")
    end
    it "leaves the youtube link alone" do
      link = Link.create!(
        title: 'Youtube 1',
        url: 'https://www.youtube.com/watch/?v=abc&t=5',
        user_id: User.first.id)
      expect(link.url).to be_a_similar_url_to("https://www.youtube.com/watch/?v=abc&t=5")
    end
    it "strips the s param from the youtube link" do
      link = Link.create!(
        title: 'Youtube 1',
        url: 'https://www.youtube.com/watch/?v=abc&t=5&s=3',
        user_id: User.first.id)
      expect(link.url).to be_a_similar_url_to("https://www.youtube.com/watch/?v=abc&t=5")
    end
    it "removes the utm_* params 1" do
      link = Link.create!(
        title: 'Youtube 1',
        url: 'https://www.youtube.com/watch/?v=abc&t=5&utm_medium=foo&utm_source=baz',
        user_id: User.first.id)
      expect(link.url).to be_a_similar_url_to("https://www.youtube.com/watch/?v=abc&t=5")
    end
    it "removes the utm_* params a" do
      link = Link.create!(
        title: 'Youtube 1',
        url: 'https://www.youtube.com/watch/?v=abc&t=5&utm_source=baz',
        user_id: User.first.id)
      expect(link.url).to be_a_similar_url_to("https://www.youtube.com/watch/?v=abc&t=5")
    end
    it "removes all params on an instagram link" do
      link = Link.create!(
        title: 'IG 1',
        url: 'https://www.instagram.com/p/foobarbaz?igshid=wtfisthis',
        user_id: User.first.id)
      expect(link.url).to be_a_similar_url_to("https://www.instagram.com/p/foobarbaz")
    end
    it "fully cleans an instagram link" do
      link = Link.create!(
        title: 'IG 1',
        url: 'https://www.instagram.com/p/foobarbaz?igshid=wtfisthis&utm_source=share',
        user_id: User.first.id)
      expect(link.url).to be_a_similar_url_to("https://www.instagram.com/p/foobarbaz")
    end
  end
end
