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
    @staff_pages = StaffPage.where(location: "The Little Ducklings", state: "published")
    # @blog_posts = BlogPost.published
  end

  def lake
    @notices = Notice.published
    @reviews = Review.published
    @centre = Centre.where(name: "Little Ducklings").first
    @staff_pages = StaffPage.where(location: "The Little Ducklings Lake", state: "published")
    @blog_posts = BlogPost.published
  end

  def pond
    @notices = Notice.published
    @reviews = Review.published
    @staff_pages = StaffPage.where(location: "The Little Ducklings Pond", state: "published")
    @centre = Centre.where(name: "Little Ducklings").first
    @blog_posts = BlogPost.published
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
