class PageController < ApplicationController

  layout "disable_navbar", only: [:coming_soon]
  # layout "locations", only: [:locations]
  # before_action :authenticate_user!, only: [:home]

  def coming_soon
  end

  def home
    # binding.pry
    @contact = Contact.new(params[:home])
    @notices = Notice.published
    @contact_submission = ContactSubmission.new
  end

  def lake
    @contact = Contact.new
    @notices = Notice.published
  end

  def pond
    @contact = Contact.new
    @notices = Notice.published
  end

  def locations
    @notices = Notice.published
    render layout: "locations"
  end

end
