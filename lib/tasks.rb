require 'net/http'
require 'json'
require_relative './process_url'

class Task
  include ProcessUrl
  attr_accessor :url

  def task_one(currencies)
    @url = build_url('currencies/ticker')
    @url = add_query({ ids: currencies })
    payload = Net::HTTP.get(@url)
    data = JSON.parse(payload)
    data
  end

  def task_two(query)
    @url = build_url('currencies')
    @url = add_query(query)
    payload = Net::HTTP.get(@url)
    data = JSON.parse(payload)
    data
  end
  # end point supportfor premium Cliend
  def task_three
    @url = build_url('exchanges/ticker')
    @url = add_query({ ids: 'BTC', convert: 'EUR' })
    payload = Net::HTTP.get(@url)
    data = JSON.parse(payload)
    data
  end

  def task_four(currencies)
    @url = build_url('exchange-rates')
    payload = Net::HTTP.get(@url)
    data = JSON.parse(payload)
    data.select! { |obj| currencies.include? obj['currency'] }
    rate1 = data[0]['rate'].to_f
    rate2 = data[1]['rate'].to_f
    return (rate2 / rate1) if data[0]['currency'].eql? currencies[0]

    rate = (rate1 / rate2)
    rate
  end
end
