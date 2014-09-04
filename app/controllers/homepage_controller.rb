class HomepageController < ApplicationController
  FEMALE_NAMES = YAML.load_file('config/name_data/sorted_female_names.yml')
  MALE_NAMES = YAML.load_file('config/name_data/sorted_male_names.yml')
  SURNAMES = YAML.load_file('config/name_data/sorted_surnames.yml')
  TRANSLATED_FEMALE_NAMES = YAML.load_file('config/name_data/translated_female_names.yml')
  TRANSLATED_MALE_NAMES = YAML.load_file('config/name_data/translated_male_names.yml')
  before_filter :validate_gender_and_name, only: [:italianize]
  
  def show_topics
  end

  def about
  end

  # need to validate existence of form fields
  def italianize
    if @gender == "female"
      puts "FEMALE MOTHA FUCKA"
      @italian_name = TRANSLATED_FEMALE_NAMES[@first_name] || FEMALE_NAMES[@first_name[0,1]].sample
    else
      puts "MALE MOTHA FUCKA"
      @italian_name = TRANSLATED_MALE_NAMES[@first_name] || @italian_name = MALE_NAMES[@first_name[0,1]].sample
    end
    
    @italian_name.capitalize!
    @italian_name = @italian_name + " " + SURNAMES[last_name[0,1]].sample.capitalize
    
    render :partial => "shared/italian_name"
  end

  private
  
  def validate_gender_and_name
    @gender = params[:gender]
    @first_name = params[:info][:first_name]
    @first_name.upcase!
    @last_name = params[:info][:last_name]
    @last_name.upcase!
    # @name = Name.new(
    #   params[:gender],
    #   params[:exchange_number],
    #   params[:subscriber_number]
    # )
  end
end