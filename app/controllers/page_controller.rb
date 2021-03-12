class PageController < ApplicationController
  layout "disable_navbar", only: [:home]
  def home
  end

  def about
  end

  def contact
  end

  def photos
  end

  def where
  end
end
