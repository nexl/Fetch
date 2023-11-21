require 'open-uri'

def fetch_websites(*urls)
  urls.each do | url | 
    begin
      website = URI.open(url).read
      filename = "#{URI.parse(url).host}.html"
      File.open(filename, 'w') { |file| file.write(website) }
    rescue => exception
      puts "Something went wrong, error message: #{exception.message}"
    end
  end
end

def get_metadata(file_path)
  if File.exist?(file_path)
    html_file = File.read(file_path)
    total_links = html_file.scan(/<a/).length
    total_images = html_file.scan(/<img/).length
    modification_time = File.mtime(file_path)
    formatted_date = modification_time.strftime("%a %b %d %Y %H:%M %Z")
    puts "Last modified date of #{file_path}: #{formatted_date}"
    puts "site: #{file_path}"
    puts "num_links: #{total_links}"
    puts "images: #{total_images}"
    puts "last fetch: #{formatted_date}"
  else 
    puts "File not found"
  end
end
