class Employee < ActiveRecord::Base
  attr_accessible :age, :department, :designation, :email_id, :location, :name
  default_scope { where(:is_deleted => false) }
  before_save :capitalize_location
  
  def self.search(search)
    where("name ILIKE ? OR email_id ILIKE ? OR location ILIKE ? OR department ILIKE ? OR designation ILIKE ? OR age ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def capitalize_location
  	self.location.capitalize!
  end
end