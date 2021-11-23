require_relative '../../lib/action/effect'
require_relative '../../lib/valera_init'
require 'rspec'

describe Action::Effect do
  describe '#execute' do
    subject { effect.execute character }

    let(:character) { ValeraInit.new health: 50 }

    context 'when the health increased by 30' do
      let(:effect) { Action::Effect.new parameter: :health, value: 30 }
      it { is_expected.to eq(80) }
    end

    context 'when the health increased by 100' do
      let(:effect) { Action::Effect.new parameter: :health, value: 100 }
      it { is_expected.to eq(100) }
    end

    context 'when the health decreased by 100' do
      let(:effect) { Action::Effect.new parameter: :health, value: -100 }
      it { is_expected.to eq(0) }
    end
  end
end
