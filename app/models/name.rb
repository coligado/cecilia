class Name < ActiveRecord::Base
  validates_presence_of :gender, :first_name, :last_name
  validates_length_of :first_name, :minimum => 2, :maximum => 14
  validates_length_of :last_name, :minimum => 2, :maximum => 14

  # def initialize(gender,first_name,last_name)
  # end
end