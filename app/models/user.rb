class User < ActiveRecord::Base
  require File.expand_path(GorgEngine::Engine.config.root + 'app' + 'models' + ( self.name.underscore + '.rb'))

  acts_as_voter


end
