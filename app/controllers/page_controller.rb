class PageController < ApplicationController

  layout "disable_navbar", only: [:coming_soon]
  # layout "locations", only: [:locations]
  # before_action :authenticate_user!, only: [:home]

  def coming_soon
  end

  def home
    @notices = Notice.published
    @reviews = Review.published
    @staff_pages = StaffPage.where(location: "The Little Ducklings", state: "published")
  end

  def lake
    @notices = Notice.published
    @reviews = Review.published
    @staff_pages = StaffPage.where(location: "The Little Ducklings Lake", state: "published")
  end

  def pond
    @notices = Notice.published
    @reviews = Review.published
    @staff_pages = StaffPage.where(location: "The Little Ducklings Pond", state: "published")
  end

  def locations
    @notices = Notice.published
    render layout: "locations"
  end
end
