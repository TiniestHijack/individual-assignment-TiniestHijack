class Movie < ApplicationRecord
    has_many :purchases

    def self.search(term, category)
        if term
            where("#{category} LIKE ?", "%#{term}%")
        else
            all
        end
    end

    def self.get_plot_by_title(title)
        title.gsub!(/\s+$/,'')
        response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&t=#{title.gsub(' ','+')}").to_s
        parsed_response = JSON.parse(response)
        parsed_response["Plot"]
    end

    def self.get_image_by_title(title)
        title.gsub!(/\s+$/,'')
        response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&t=#{title.gsub(' ','+')}").to_s
        parsed_response = JSON.parse(response)
        parsed_response["Poster"]
    end
end