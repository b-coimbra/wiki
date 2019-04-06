require 'mechanize'

class WebCrawler
    def initialize(file_name)
        @file = file_name
    end

    private
    def save_site_crawl(site_url)
        begin
            if check(site_url)
                File.open(@file, "a") do |data|
                    data.puts site_url
                end
            end
        rescue StandardError => error_message
            puts "ERROR: #{error_message}"
        end
    end

    def check(url)
        data = File.read(@file)
        urls = data.split
        if urls.include? url
            return false
        else
            return true
        end
    end

    def fetch_database_urls
        active_urls = File.read(@file)
        urls = active_urls.split
        return urls
    end

    public
    def crawl
        links_found = 0
        agent = Mechanize.new

        agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        fetched_urls = fetch_database_urls

        fetched_urls.each do |url_to_crawl|
            page = agent.get(url_to_crawl)
            links = page.links

            links.each do |link|
                scraped_url = link.attributes['href']
                next if scraped_url == "#"

                case scraped_url[0..4]
                when "https" then
                    save_site_crawl(scraped_url)
                    puts "Checked: #{scraped_url}\n---------------------------\n"
                when "http: " then
                    save_site_crawl(scraped_url)
                    puts "Checked: #{scraped_url}\n---------------------------\n"
                when "ftp:/" then
                    save_site_crawl(scraped_url)
                    puts "Checked: #{scraped_url}\n---------------------------\n"
                else
                    url_slit = url.to_crawl.split("/")

                    if scraped_url[0] == "/"
                        finle_url = url_split[0] + "//" + url_split[2] + scraped_url
                    else
                        finle_url = url_split[0] + "//" + url_split[2] + "/" + scraped_url
                    end
                    save_site_crawl(finle_url)
                    puts "Checked: #{file}\n---------------------\n"
                end

                links_found += 1
            end

            puts "Status Update: #{links_found} links found."
        end
    end
end

crawl = WebCrawler.new("./urlls.txt")
crawl.crawl
