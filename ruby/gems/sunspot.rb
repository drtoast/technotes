# http://railscasts.com/episodes/278-search-with-sunspot

# Gemfile
gem 'sunspot_rails'

# bundle install
# rails g sunspot_rails:install
# rake sunspot:solr:start

# models/article.rb
class Article < ActiveRecord::Base
  attr_accessible :name, :content
  has_namy :comments
  
  searchable do
    text :name, :boost => 5
    text :content, :publish_month
    text :comments do
      comments.map(&:content)
    end
    time :published_at
    string :publish_month
  end

  def publish_month
    published_at.strftime("%B %Y")
  end
  
end


# articles_controller.rb 
def index
  @search = Article.search do
    fulltext params[:search]
    with(:published_at).less_than(Time.zone.now)
    facet(:publish_month)
    with(:publish_month, params[:month]) if params[:month].present?
  end
  @articles = @search.results
end