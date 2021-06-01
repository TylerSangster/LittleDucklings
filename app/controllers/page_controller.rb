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
    @infant_program = @centre.programs.where(title: "INFANT PROGRAM").first if @centre.present?
    @toddler_program = @centre.programs.where(title: "TODDLER PROGRAM").first if @centre.present?
    @prek_program = @centre.programs.where(title: "PRE-KINDERGARTEN PROGRAM").first if @centre.present?
    @preschool_program = @centre.programs.where(title: "PRESCHOOL PROGRAM").first if @centre.present?
  end

  def lake
    @notices = Notice.published
    @reviews = Review.published
    @centre = Centre.where(name: "Little Ducklings Lake").first
    @staff_pages = StaffPage.where(location: ["Little Ducklings Lake", "All"], state: "published")
    @blog_posts = BlogPost.published
    @menu = Menu.first
    @school_program = @centre.programs.where(title: "SCHOOL AGE PROGRAM").first if @centre.present?
    @prek_program = @centre.programs.where(title: "PRE-KINDERGARTEN PROGRAM").first if @centre.present?
  end

  def pond
    @notices = Notice.published
    @reviews = Review.published
    @staff_pages = StaffPage.where(location: ["Little Ducklings Pond", "All"], state: "published")
    @centre = Centre.where(name: "Little Ducklings Pond").first
    @blog_posts = BlogPost.published
    @menu = Menu.first
    @infant_program = @centre.programs.where(title: "INFANT PROGRAM").first if @centre.present?
    @toddler_program = @centre.programs.where(title: "TODDLER PROGRAM").first if @centre.present?
    @prek_program = @centre.programs.where(title: "PRE-KINDERGARTEN PROGRAM").first if @centre.present?
    @preschool_program = @centre.programs.where(title: "PRESCHOOL PROGRAM").first if @centre.present?
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
