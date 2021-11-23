require_relative '../lib/action/cond'
require_relative '../lib/action/effect'
require_relative '../lib/action/action'
require_relative '../lib/valera_init'
require 'rspec'

describe Action do
  let(:cond) { [].push Action::Cond.new parameter: :health, operator: '<', value: 50 }
  let(:eff) { [].push Action::Effect.new parameter: :health, value: 5 }
  let(:character) { ValeraInit.new health: 40 }
  subject { Action.new name: 'test', conds: cond, effects: eff }

  describe '#valid?' do
    context 'when the conds is valid' do
      it { expect(subject.valid?(character)).to be_truthy }
    end
  end

  describe '#execute' do
    context 'when health should be increased by 5' do
      it { expect(subject.execute(character)).to eq([45]) }
    end
  end
end
