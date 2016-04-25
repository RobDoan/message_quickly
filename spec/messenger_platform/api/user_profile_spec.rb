require 'spec_helper'

describe MessengerPlatform::Api::UserProfile do

  subject { MessengerPlatform::Api::UserProfile }

  describe '#find' do

    let(:fbid) { ENV['FACEBOOK_MESSENGER_USER_ID'] }
    let(:fbid_invalid) { '091283908123' }

    context 'with own client' do
      let(:client) { MessengerPlatform::Api::Client.new(page_access_token: ENV['FACEBOOK_MESSENGER_PAGE_ACCESS_TOKEN'], page_id: ENV['FACEBOOK_MESSENGER_PAGE_ID']) }
      it { expect(subject.new(client).find(fbid)).to be_kind_of(MessengerPlatform::Messaging::User) }
    end

    context 'with matching user' do
      it { expect(subject.find(fbid)).to be_kind_of(MessengerPlatform::Messaging::User) }
      it { expect(subject.find(fbid).first_name).to eq(ENV['FACEBOOK_MESSENGER_USER_FIRST_NAME']) }
      it { expect(subject.find(fbid).last_name).to eq(ENV['FACEBOOK_MESSENGER_USER_LAST_NAME']) }
    end

    context 'with no matching user' do
      it { expect { subject.find(fbid_invalid) }.to raise_exception(MessengerPlatform::Api::GraphMethodException) }
    end

  end

end
