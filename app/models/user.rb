class User < ActiveRecord::Base  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :validatable, :recoverable, :rememberable,
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable
  
  has_many :cats
  
  def as_json(options={})
    {
      id: self.id,
      email: self.email
    }
  end
end
