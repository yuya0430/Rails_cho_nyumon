class DataController < ApplicationController
  def index
  end

  def ajax
    url = 'https://news.yahoo.co.jp/rss/topics/top-picks.xml'
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    render plain:Hash::from_xml(response.body).to_json #xmlデータをハッシュ(辞書形式)にして，それをjsonにする
  end
end
