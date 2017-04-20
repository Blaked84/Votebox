class StaticPagesController < ApplicationController
  def landing
    @featured_projects = Project.featured
  end
end
