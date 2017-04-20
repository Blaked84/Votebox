class Project < ActiveRecord::Base

  def self.featured
    self.all.first(5)
  end

  def author
    User.first.fullname
  end

end
