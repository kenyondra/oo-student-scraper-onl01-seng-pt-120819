require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html=open(index_url)
    studentPage=Nokogiri::HTML(html)

    students=[]
    studentPage.css("div.student-card").each do |student|
      students << {
        :name => student.css("h4.student-name").text,
        :location => student.css("p.student-location").text,
        :profile_url => "./fixtures/student-site/" + student.css("a").attribute("href").value
        }
    end
    students
  end
  

  def self.scrape_profile_page(profile_url)
    
  end

end

