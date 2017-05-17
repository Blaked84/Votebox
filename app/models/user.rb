class User < ActiveRecord::Base
  require_dependency File.expand_path(GorgEngine::Engine.config.root + 'app' + 'models' + ( self.name.underscore + '.rb'))


  has_many :projects_members
  has_many :projects, through: :projects_members
  has_many :submited_projects, class_name: "Project"

  has_many :comments

  acts_as_voter

  def infos_to_display
    {name: self.fullname, avatar_url:  self.avatar_url}
  end

  def vote_or_cancel_vote(direction, votable_ressource, cancel_method)
    self.send(cancel_method, votable_ressource) ?
        self.unvote_for(votable_ressource) :
        self.vote(votable_ressource, { :exclusive => true, :direction => direction })
  end

end
