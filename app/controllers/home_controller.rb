class HomeController < ApplicationController
  def index
    # These two requires come with Ruby so commented out
    require 'net/http'
    require 'json'
    
    #instance variables
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    #go to the website and store in response
    @response = Net::HTTP.get(@uri)
    #parse out the data and store in coinse
    @coins = JSON.parse(@response)
    
    @my_coins = ["BTC", 'XRP', 'ADA', 'XLM', 'STEEM',]
  end
  
  def about
  end
  
  def lookup
    # These two requires come with Ruby so commented out
    require 'net/http'
    require 'json'
    
    #instance variables
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    #go to the website and store in response
    @response = Net::HTTP.get(@uri)
    #parse out the data and store in coinse
    @lookup_coin = JSON.parse(@response)

    @symbol = params[:sym]
    if @symbol
      @symbol = @symbol.upcase
    end 
    
    if @symbol == ""
      @symbol = "Hey you forget to enter a currency"
    end 
  end 
  
end
