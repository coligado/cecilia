class Name < ActiveRecord::Base
  validates_presence_of :gender, :first_name, :last_name
end
