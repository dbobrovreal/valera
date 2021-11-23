require_relative '../../lib/action/add_cond'
require 'rspec'

describe Action::AddCond do
  it '#execute' do
    cond = [].push double
    allow(cond[0]).to receive(:valid?) { true }

    effect = [].push double
    allow(effect.first).to receive(:execute) { true }

    add_cond = Action::AddCond.new conds: cond, effects: effect

    expect(add_cond.execute('')).to eq [true]
  end
end
