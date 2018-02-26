class ForexQuotesController < ApplicationController
=begin
  This library is provided without warranty under the MIT license
  Created by Jacob Davis <jacob@1forge.com>
=end

class ForexDataClient
  def index
    @api_key = 'M6rQ7bJ7Eor949rVxGwYPL9gON289o8B'
    @client = ForexDataClient.new('M6rQ7bJ7Eor949rVxGwYPL9gON289o8B')
  end

  def fetch(api_call)
    JSON.parse(HTTP.get("https://forex.1forge.com/1.0.2/" + api_call + "&api_key=" + @api_key))
  end

  def quota()
    self.fetch('quota?cache=false')
  end

  def getSymbols()
    self.fetch('symbols?cache=false')
  end

  def getQuotes(symbols)
    self.fetch('quotes?cache=false&pairs=' + symbols.join(','))
  end

  def convert(from, to, quantity)
    self.fetch('convert?cache=false&from=' + from + '&to=' + to + '&quantity=' + quantity.to_s)
  end

  def getMarketStatus()
    self.fetch('market_status?cache=false')
  end
end
end