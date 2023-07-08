require_relative "./article"
require_relative "./magazine"

class Author
  attr_reader :name


  def initialize(name)
    @name = name
  
  end

  def articles
    Article.all.select { |article| article.author == self }
    
  end

  def magazines
    articles.map { |article| article.magazine }.uniq
  end

  def add_article(title, magazine)
    Article.new(title, self, magazine)
  end

  def topic_areas
    magazines.map  { |magazine|magazine.category }.uniq
  end
end
