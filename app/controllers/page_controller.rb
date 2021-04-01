class PageController < ApplicationController

  layout "disable_navbar", only: [:coming_soon]
  # before_action :authenticate_user!, only: [:home]

  def coming_soon
  end

  def home
  end

  def lake
  end

  def pond
  end
end
