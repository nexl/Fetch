require 'open-uri'

def fetch_website(url)
  begin
    website = URI.open(url).read
    filename = "#{URI.parse(url).host}.html"
    File.open(filename, 'w') { |file| file.write(website) }
  rescue => exception
    puts "Something went wrong, error message: #{exception.message}"
  end
end

fetch_website(ARGV[0])