class Cat < ActiveRecord::Base
  # validates_presence_of :name
  # validates_presence_of :city
  validates_presence_of :offset
  
  validates_format_of :offset, :with => /\A[+-][0-9][0-9]:[0-9][0-9]\z/, message: "should be formatted like +02:00"
  
  belongs_to :user
  
  def as_json(options={})
    {
      id: self.id,
      name: self.name,
      city: self.city,
      offset: self.offset
    }
  end
end
