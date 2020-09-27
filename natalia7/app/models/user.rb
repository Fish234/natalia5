class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record? 

  def set_default_role
    self.role ||= :user
  end

  passwordless_with :email
end
