class StaticPagesController < ApplicationController
  def landing
    @featured_projects = Project.featured
    render layout: 'landing'
  end
end
