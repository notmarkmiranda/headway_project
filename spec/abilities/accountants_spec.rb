require 'rails_helper'
require_relative '../support/matchers/custom_cancan'

describe Canard::Abilities, '#accountants' do
  let(:acting_accountant) { FactoryGirl.create(:user, :accountant) }

  subject(:accountant_ability) { Ability.new(acting_accountant) }

  describe 'on User' do
    let (:user) { FactoryGirl.create(:user) }

    it { is_expected.to be_able_to(:manage, acting_accountant) }
    it { is_expected.to_not be_able_to(:manage, user) }
    it { is_expected.to_not be_able_to(:destroy, user) }
  end
end
