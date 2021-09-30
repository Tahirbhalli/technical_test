require_relative '../lib/tasks.rb'

describe Task do
  let(:test_task) { Task.new }

  it 'First Task' do
    expect(test_task.task_one('BTC,ETH').count).to eq(2)
  end

  it 'Second Task' do
    expect(test_task.task_two({ ids: 'BTC,ETH,BNB',
                                attributes: 'logo_url,max_supply, name, symbol, price' }).count).to eq(3)
  end

  it 'task four' do
    expect(test_task.task_four(%w[BTC ETH])).to be >= 0
  end
end
