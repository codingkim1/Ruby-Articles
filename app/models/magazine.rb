require_relative "./article"
require_relative "./author"

class Magazine
  attr_accessor :name, :category


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
    contributing_authors = Hash.new(0)
    Article.all.map do |article|
      if (article.magazine == self)
        contributing_authors[article.author] += 1 
      end
    end
    contributing_authors.select { |author, value| value > 1 }.keys
  end


end
