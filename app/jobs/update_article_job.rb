require "httparty"
require "nokogiri"

class UpdateArticleJob < ApplicationJob
  queue_as :default

  def perform(url)      
    puts "======================== begin ====================================="
    a = Article.find_by(url: url)
    html = HTTParty.get(url, { headers: { "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36" },}).body
    doc = Nokogiri::HTML(html)
    a.title = doc.title
    a.description = doc.at("meta[name='description']")["content"]
    a.published = true
    begin
      a.save!
    rescue => e 
      puts "error: #{e.message}"
      puts "Didn't Save!"
      puts a.errors.inspect
    ensure
      puts a.inspect
      puts "========================  end  ====================================="
    end
  end
end
