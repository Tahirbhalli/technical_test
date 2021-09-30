require_relative '../lib/tasks.rb'

def main
  obj = Task.new

  puts "first Task"
  puts obj.task_one 'BTC,ETH,XRP'

  puts "2nd Task"
  puts obj.task_two({ids: 'BTC,ETH,BNB', attributes: 'logo_url,max_supply, name, symbol, price'})

  # puts "3rd Task" end point is restricted for premium clients
  # puts obj.task_three # this is required premium account So I don't have permisions for this

  puts '4th Task'
  puts obj.task_four(%w[ETH BTC])
  
end

main
