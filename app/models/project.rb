class Project < ActiveRecord::Base

  has_many :projects_members
  has_many :users, through: :projects_members
  belongs_to :category
  belongs_to :author, foreign_key: "user_id", class_name: "User"

  acts_as_voteable

  def self.featured
    self.plusminus_tally.first(5)
  end

  def author_name
    author.present? ? author.fullname : "pas d'auteur"
  end

  def members_names
    users.map{|m| m.fullname}
  end
  def members_infos
    users.map{|m| [name: m.fullname,
                   avatar_url:  m.avatar_url,
                   profile_url: "https://www.arts-et-metiers.asso.fr/index.php/annuaire2/profil/id/" + m.avatar_url.split("/").last.split("_").last.split(".").first
    ]}.flatten
  end

  def members_count
    self.users.count
  end

  def voters(_for)
    likers_id = Vote.where(voteable_type: "Project", voter_type: "User", voteable_id: self.id, vote: _for).pluck(:voter_id)
    User.where(id: likers_id).map(&:fullname)
  end



end
