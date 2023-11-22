require 'open-uri'

def fetch_websites(*urls)
  urls.each do | url | 
    begin
      website = URI.open(url).read
      website_name = URI.parse(url).host
      filename = "#{website_name}.html"
      File.open(filename, 'w') do | file |
        website.each_line do | line |
          regex = /<[^>]*src\s*=\s*['"]([^'"]*)['"][^>]*>/i
          if line =~ regex
            begin 
              asset_url =  line.match(regex)[1]
              result = line.gsub(asset_url, "#{website_name}_files/#{File.basename(URI.parse(asset_url).path)}")
              download_asset("#{website_name}_files", asset_url, File.basename(URI.parse(asset_url).path))
              file.puts result
            rescue => exception
              puts "Something went wrong, error message: #{exception.message}"
            end
          else 
            file.puts line
          end
        end
      end
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
    puts "site: #{file_path}"
    puts "num_links: #{total_links}"
    puts "images: #{total_images}"
    puts "last fetch: #{formatted_date}"
  else 
    puts "File not found"
  end
end

def download_asset(folder, url, filename)
  Dir.mkdir(folder) if !Dir.exist?(folder) 
  destination_path = File.join(folder, filename)
  File.open(destination_path, 'wb') do | file |
    file << URI.open(url).read
  end
end

if ARGV[0] == "--metadata"
  get_metadata(ARGV[1])
else
  fetch_websites(*ARGV[0..-1])
end
