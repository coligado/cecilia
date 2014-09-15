class HomepageController < ApplicationController
  FEMALE_NAMES = YAML.load_file('config/name_data/sorted_female_names.yml')
  MALE_NAMES = YAML.load_file('config/name_data/sorted_male_names.yml')
  TRANSLATED_FEMALE_NAMES = YAML.load_file('config/name_data/translated_female_names.yml')
  TRANSLATED_MALE_NAMES = YAML.load_file('config/name_data/translated_male_names.yml')
  before_filter :validate_gender_and_name, only: [:italianize]
  
  def about
  end

  def italianize
    nome
    cognome
    render :partial => "shared/italian_name"
  end

  private
  
  # need to validate existence of form fields
  def validate_gender_and_name
    @gender = params[:gender]
    @first_name = params[:first_name]
    @first_name.upcase!
    @last_name = params[:last_name]
    @last_name.upcase!
    # @name = Name.new(
    #   params[:gender],
    #   params[:exchange_number],
    #   params[:subscriber_number]
    # )
  end

  def nome
    if @gender == "female"
      @italian_name = TRANSLATED_FEMALE_NAMES[@first_name] || FEMALE_NAMES[@first_name[0,1]].sample
    else
      @italian_name = TRANSLATED_MALE_NAMES[@first_name] || @italian_name = MALE_NAMES[@first_name[0,1]].sample
    end
    @italian_name.capitalize!
  end

  def cognome
    prefisso
    suffiso
    @italian_name = @italian_name + "  " + @prefix + @last_name.capitalize 
  end

  def prefisso
    @prefix = ""
    if @last_name =~ /\A[AEIOU]/
      @prefix = "D'"
    elsif @last_name[0,1] == 'D'
      @last_name.insert(1,"\'")
    else  
      if rand(2) == 0
        @prefix = "Di"
      end
    end
  end

  def suffiso
    if @last_name =~ /[AEIOUY]$/
      @last_name.gsub!(/[AEIOUY]$/, ['I','INO','INA','INI'].sample)
    else
      @last_name.concat(['I','INO','INA','INI'].sample)
    end
  end
end