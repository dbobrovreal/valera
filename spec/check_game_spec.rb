require_relative '../lib/game'
require 'rspec'

RSpec.describe Game do
  let(:valera) { ValeraInit.new }
  subject { ConfigLoader.new(valera, {}) }
  let(:data) { subject.load_configuration }
  let(:game) { Game.new(valera, data) }

  describe '#correct_input?' do
    context 'when input is correct' do
      context 'when load' do
        it { expect(game.other_actions('load')).to be_nil }
      end
      context 'when save' do
        it { expect(game.other_actions('save')).to be_nil }
      end
      context 'when exit' do
        it { expect(game.other_actions('exit')).to be_truthy }
      end
    end
    context 'when input is incorrect' do
      it { expect(game.other_actions('o')).to be_falsey }
    end
  end
end
