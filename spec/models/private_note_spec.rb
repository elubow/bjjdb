require 'rails_helper'

describe PrivateNote do
  #subject { build(:private_note) }

  context 'associations' do
      it { should belong_to :link }
      it { should belong_to :user }
  end

end
