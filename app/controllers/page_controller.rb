class PageController < ApplicationController

  layout "disable_navbar", only: [:coming_soon]
  # layout "locations", only: [:locations]
  # before_action :authenticate_user!, only: [:home]

  def coming_soon
  end

  def home
    @notices = Notice.published
    @reviews = Review.published
    @centre = Centre.where(name: "Little Ducklings").first
    @staff_pages = StaffPage.where(location: ["Little Ducklings", "All"], state: "published")
    @menu = Menu.published.first
    # @blog_posts = BlogPost.published
  end

  def lake
    @notices = Notice.published
    @reviews = Review.published
    @centre = Centre.where(name: "Little Ducklings").first
    @staff_pages = StaffPage.where(location: ["Little Ducklings Lake", "All"], state: "published")
    @blog_posts = BlogPost.published
    @menu = Menu.first
  end

  def pond
    @notices = Notice.published
    @reviews = Review.published
    @staff_pages = StaffPage.where(location: ["Little Ducklings Pond", "All"], state: "published")
    @centre = Centre.where(name: "Little Ducklings").first
    @blog_posts = BlogPost.published
    @menu = Menu.first
  end

  def locations
    @notices = Notice.published
    render layout: "locations"
  end

  def infant
    @notices = Notice.published
  end

  def prekindergarten
    @notices = Notice.published
  end

  def preschool
    @notices = Notice.published
  end

  def toddler
    @notices = Notice.published
  end
end
