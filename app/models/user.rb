class User < ActiveRecord::Base
  require_dependency File.expand_path(GorgEngine::Engine.config.root + 'app' + 'models' + ( self.name.underscore + '.rb'))


  has_many :projects_members
  has_many :projects, through: :projects_members
  has_many :submited_projects, class_name: "Project"

  has_many :comments

  acts_as_voter

  def infos_to_display
    {name: self.fullname, avatar_url:  self.avatar_url}
    # profile_url: "https://www.arts-et-metiers.asso.fr/index.php/annuaire2/profil/id/" + m.avatar_url.split("/").last.split("_").last.split(".").first

  end

end
