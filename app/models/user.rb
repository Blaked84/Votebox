class User < ActiveRecord::Base
  require File.expand_path(GorgEngine::Engine.config.root + 'app' + 'models' + ( self.name.underscore + '.rb'))

  has_many :projects_members
  has_many :projects, through: :projects_members
  has_many :submited_projects, class_name: "Project"

  acts_as_voter


end
