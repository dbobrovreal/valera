require_relative '../lib/valera_init'
require_relative '../lib/config_load'
require 'rspec'

describe ConfigLoader do
  let(:valera) { ValeraInit.new }
  subject { ConfigLoader.new(valera, {}) }
  let(:data) { subject.load_configuration }

  describe '#load_configuration' do
    context 'when config file is not empty' do
      it { expect(subject.load_configuration).to_not eq([]) }
    end
  end

  describe '#change_data' do
    context 'when initial data is true' do
      it { expect(subject.send(:change_data, data['initial'])).to eq(data['initial']) }
    end
  end

  describe '#build_actions' do
    context 'when actions data is true' do
      it { expect(subject.send(:build_actions, data['actions'])).to eq(data['actions']) }
    end
  end

  describe '#build_condition' do
    context 'when condition is not empty' do
      it { expect(subject.send(:build_condition, data['actions'][0])).to_not eq([]) }
    end

    context 'when condition is empty' do
      it { expect(subject.send(:build_condition, {})).to eq([]) }
    end
  end

  describe '#build_effect' do
    context 'when effects is not false' do
      it { expect(subject.send(:build_effect, data['actions'][0]['effects'][0])).to be_truthy }
    end
  end

  describe '#build_add_condition' do
    context 'when add_condition is not empty' do
      it { expect(subject.send(:build_add_condition, data['actions'][0])).to eq([]) }
    end
  end
end
