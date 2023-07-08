require_relative "./author"
require_relative "./magazine"

class Article
    
    attr_reader :name, :magazine, :title

    @@all = []
    def initialize(author, magazine, title)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self 
    end

    def self.all 
        @@all 
    end


end
