require 'spec_helper'

describe MessengerPlatform::Messaging::User do

  subject { MessengerPlatform::Messaging::User.new(id: ENV['FACEBOOK_MESSENGER_USER_ID']) }

  it { expect(subject.first_name).to eq(ENV['FACEBOOK_MESSENGER_USER_FIRST_NAME']) }
  it { expect(subject.last_name).to eq(ENV['FACEBOOK_MESSENGER_USER_LAST_NAME']) }

end
