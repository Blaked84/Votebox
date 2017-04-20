class Project < ActiveRecord::Base

  acts_as_voteable

  def self.featured
    self.all.first(5)
  end

  def author
    User.first.fullname
  end

end
