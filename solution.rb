require_relative "./config/environment"

# Please copy/paste all three classes into this file to submit your solution!

# Article class
class Article
    attr_reader :title, :author, :magazine
    @@all = []

    def initialize(title, author, magazine)
        @title = title
        @author = author
        @magazine = magazine
        @@all << self
    end

    def self.all
        @@all
    end

end

# Author class
class Author
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  
    def articles
      Article.all.select do |article|
        article.author == self
      end
    end
  
    def magazines
      mag_inst = articles.map do |article|
        article.magazine
      end
      mag_inst.uniq
    end
  
    def add_article(title, magazine)
      Article.new(title, self, magazine)
    end
  
    def topic_areas
      magazines.map do |magazine|
        magazine.category
      end.uniq
    end
  
end

# Magazine class 
class Magazine
  attr_accessor :name, :category
  @@all = []

  def initialize(name, category)
    @name = name
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  def contributors
    Article.all.map do |article|
      article.author if article.magazine == self
    end.compact.uniq
  end  
  
  def self.find_by_name(name)
    @@all.find { |magazine| magazine.name == name }
  end  

  def article_titles
    Article.all.select { |article| article.magazine == self }.map(&:title)
  end

  def contributing_authors
    contribs = Hash.new(0)
    Article.all.map do |article|
      if (article.magazine == self)
        contribs[article.author] += 1
      end
    end
    contribs.select { |author, value| value > 1 }.keys
  end

end