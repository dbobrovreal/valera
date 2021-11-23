require_relative '../lib/valera_init'
require_relative '../lib/save_load'

RSpec.describe SaveOrLoad do
  let(:valera) { ValeraInit.new }
  subject { SaveOrLoad.new('./spec/test-data/save_test_game.txt') }
  parameters = %w[health mana happiness fatigue money]

  describe '#save' do
    context 'save game in file' do
      it { expect(subject.save(valera)).to eq(parameters) }
    end
  end

  describe '#load' do
    context 'load game from file' do
      it { expect(subject.load(valera)).to eq(parameters) }
    end
  end
end
