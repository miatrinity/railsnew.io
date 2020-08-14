require 'ap'
require 'typhoeus'
require 'cgi'
require 'nokogiri'
require 'json'

class RailsbytesScraper  
  def initialize
    Typhoeus::Config.user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0) Gecko/20100101 Firefox/78.0"
  end
  
  def login
    puts "Loading 'https://www.railsbytes.com/'..."
    
    request = Typhoeus::Request.new(
      'https://www.railsbytes.com/',
      cookiefile: "/Users/miatrinity/workspace/ruby/railsbytes-scraper/cookies",
      cookiejar: "/Users/miatrinity/workspace/ruby//railsbytes-scraper/cookies"
    )
    initial_response = request.run
    
    csrf_token = initial_response.body.scan(/name="csrf-token" content="(.+)"/).flatten[0]
    
    puts "CSRF Token: #{csrf_token}"
    
    
    puts "Logging in..."
    login_request = Typhoeus::Request.new(
      'https://www.railsbytes.com/users/sign_in',
      method: :post,
      headers: { 
        Accept: 'text/javascript, application/javascript, application/ecmascript, application/x-ecmascript, */*; q=0.01',
        Referer: 'https://www.railsbytes.com/users/sign_in',
        "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8',
        "X-Requested-With": 'XMLHttpRequest',
        "X-CSRF-Token": csrf_token,
        Origin: 'https://www.railsbytes.com',
        Connection: 'keep-alive'    
      },
      followlocation: true,
      body: "authenticity_token=#{CGI.escape csrf_token}&user%5Bemail%5D=trinity.takei%40gmail.com&user%5Bpassword%5D=NF57gSDPA3avnr9&user%5Bremember_me%5D=1&commit=Log%20in",
      cookiefile: "/Users/miatrinity/workspace/ruby/railsbytes-scraper/cookies",
      cookiejar: "/Users/miatrinity/workspace/ruby//railsbytes-scraper/cookies",
      verbose: true
    )
    
    login_request.run    
  end

  def load_my_templates
    puts "Loading 'My Templates' page..."

    my_templates_request = Typhoeus::Request.new(
      'https://www.railsbytes.com/',
      method: :get,
      headers: { 
        Accept: 'text/html, application/xhtml+xml',
        Referer: 'https://www.railsbytes.com/users/sign_in',
        "Turbolinks-Referrer": 'https://www.railsbytes.com/users/sign_in',
        Connection: 'keep-alive'
      },
      followlocation: true,
      cookiefile: "/Users/miatrinity/workspace/ruby/railsbytes-scraper/cookies",
      cookiejar: "/Users/miatrinity/workspace/ruby//railsbytes-scraper/cookies",
      verbose: true
    )

    my_templates_response = my_templates_request.run

    Nokogiri::HTML.parse(my_templates_response.body)
  end
  
  def scrape_download_stats
    login
    
    my_templates_doc = load_my_templates
    
    railsbytes = my_templates_doc.
      xpath("//table[@class='table']//td[1]/a/div[1]/div[1]").
      map(&:to_s).
      map{|rails_byte| rails_byte.scan(/<div>(.+?)</m).flatten[0].strip}
      
    download_counts = my_templates_doc.xpath("//table[@class='table']//td[last()]").map(&:text)
    download_histogram = railsbytes.zip(download_counts).to_h

    total_downloads = download_counts.map{|x|x.to_i}.sum

    timestamp = Time.now.to_i

    output = {
      histogram: download_histogram,
      total_count: total_downloads,
      timestamp: timestamp
    }

    open("railsbytes_downloads_#{timestamp}.json",'w') {|f| f.write output.to_json}
  end
  
  def scrape_template_ids
    login
    
    my_templates_doc = load_my_templates

    single_template_railsbytes = my_templates_doc.
      xpath("//table[@class='table']//tbody//a").
      map(&:to_s).
      map{ |rails_byte| 
        rails_byte.scan(/href=".*\/templates\/(.+?)".+<div>(.+?)</m).
          flatten.
          map(&:strip) }
    
    Hash[*single_template_railsbytes.flatten.reverse]
  end
  
  def create_combo_template(railsbyte_combo)
    boundary_num = '4671981358393754851234594723'
    
    existing_railsbytes = scrape_template_ids
    
    # existing_railsbytes = {
    #           "Stimulus.js:RSpec" => "zOvs8d",
    #                       "RSpec" => "VD7sra",
    #     "Stimulus.js + Stimulus Reflex:Bootstrap" => "XnJs52",
    #     "Stimulus.js + Stimulus Reflex:TailwindCSS" => "z0gsd8",
    #       "Stimulus.js:Bootstrap" => "xjNsAn",
    #                   "Bootstrap" => "VMys5p",
    #                 "TailwindCSS" => "X8BsGy",
    #     "Stimulus.js + Stimulus Reflex" => "zr4s0Y",
    #                 "Stimulus.js" => "V33s33",
    #     "Stimulus.js:TailwindCSS" => "zyvsbW"
    #  }
    # 🛠️ 
    template_content = railsbyte_combo
      .split(':')
      .each_with_object([]) do |railsbyte_name, result| 
        result << <<~DOC
          puts "Installing #{railsbyte_name}"
          run "rails app:template LOCATION='https://www.railsbytes.com/script/#{existing_railsbytes[railsbyte_name]}'"
        DOC
      end.join("\n")
      
    request = Typhoeus::Request.new(
      'https://www.railsbytes.com/templates/new/',
      method: :get,
      headers: {
        Accept: 'text/html, application/xhtml+xml',
        #'Accept-Encoding': 'gzip, deflate, br',
        "Accept-Language": 'en-US,en;q=0.5',
        "Connection": 'keep-alive',
        "Host": 'www.railsbytes.com',
        "Referer": 'https://www.railsbytes.com',
        "TE": 'Trailers',
        "Turbolinks-Referrer": 'https://www.railsbytes.com'              
      },
      cookiefile: "/Users/miatrinity/workspace/ruby/railsbytes-scraper/cookies",
      cookiejar: "/Users/miatrinity/workspace/ruby//railsbytes-scraper/cookies",
      verbose: true
    )
    new_template_response = request.run
    
    csrf_token = new_template_response.body.scan(/name="csrf-token" content="(.+)"/).flatten[0]
  
    authenticity_token = new_template_response.body.scan(/name="authenticity_token" value="(.+)"/).flatten[0]
        
    form_data = form_data_for_create(boundary_num, railsbyte_combo, template_content, authenticity_token)
        
    create_template_request = Typhoeus::Request.new(
      'https://www.railsbytes.com/templates',
      method: :post,
      accept_encoding: "gzip",
      headers: {
        Accept: 'text/javascript, application/javascript, application/ecmascript, application/x-ecmascript, */*; q=0.01',
        "Accept-Encoding": 'gzip, deflate, br',
        "Accept-Language": 'en-US,en;q=0.5',
        Connection: 'keep-alive',        
        "Content-Type": "multipart/form-data; boundary=---------------------------#{boundary_num}",        
        Origin: 'https://www.railsbytes.com',
        Referer: 'https://www.railsbytes.com/templates/new',
        "X-CSRF-Token": csrf_token,        
        "X-Requested-With": 'XMLHttpRequest'
      },
      followlocation: true,
      cookiefile: "/Users/miatrinity/workspace/ruby/railsbytes-scraper/cookies",
      cookiejar: "/Users/miatrinity/workspace/ruby//railsbytes-scraper/cookies",
      body: form_data,
      verbose: true
    )
      
    create_template_response = create_template_request.run
    
    ap create_template_response
  end
  
  private
  
  def form_data_for_create(boundary_num, template_name, template_content, authenticity_token)
    <<~FORM_DATA
    -----------------------------#{boundary_num}
    Content-Disposition: form-data; name="authenticity_token"
    
    #{authenticity_token}
    -----------------------------#{boundary_num}    
    Content-Disposition: form-data; name="template[name]"
    
    #{template_name}
    -----------------------------#{boundary_num}
    Content-Disposition: form-data; name="template[icon]"; filename=""
    Content-Type: application/octet-stream
    
    
    -----------------------------#{boundary_num}
    Content-Disposition: form-data; name="template[short_description]"
    
    #{template_name}
    -----------------------------#{boundary_num}
    Content-Disposition: form-data; name="template[usage]"
    
    
    -----------------------------#{boundary_num}
    Content-Disposition: form-data; name="template[script]"

    #{template_content}
    -----------------------------#{boundary_num}
    Content-Disposition: form-data; name="template[public]"
    
    0
    -----------------------------#{boundary_num}
    Content-Disposition: form-data; name="button"
    
    
    -----------------------------#{boundary_num}--
    
    FORM_DATA
  end
end

scraper = RailsbytesScraper.new

scraper.create_combo_template("Stimulus.js:TailwindCSS")