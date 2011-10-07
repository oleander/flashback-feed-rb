require "rest-client"
require "nokogiri"
require "sinatra"
require "thread"
require "jsonify"

domain  = "https://www.flashback.org"
threads = nil

Thread.new do
  loop do
    data  = RestClient.get "https://www.flashback.org/heta-amnen"
    doc   = Nokogiri::HTML(data)
    threads = doc.css("table#threadslist tr").map do |thread|
      content1 = thread.at_css("td.threadslistrow a")
      content2 = thread.at_css("td.threadslistrow a.gentle2")
      stats    = thread.css("td.alt1.alignc")

      next unless content1

      {
        url: domain + content1.attr("href"),
        title: content1.text,
        category: content2.text.gsub(/\(|\)/, ""),
        category_url: domain + content2.attr("href"),
        readers: stats[1].content,
        views: stats[2].content.gsub(/[^0-9]/, ""),
        answers: stats[3].content
      }
    end.reject(&:nil?).to_json
    sleep 60
  end
end

get "/" do
  threads
end