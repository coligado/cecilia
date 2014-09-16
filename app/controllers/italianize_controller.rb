class ItalianizeController < ApplicationController
  FEMALE_NAMES = YAML.load_file('config/name_data/sorted_female_names.yml')
  MALE_NAMES = YAML.load_file('config/name_data/sorted_male_names.yml')
  TRANSLATED_FEMALE_NAMES = YAML.load_file('config/name_data/translated_female_names.yml')
  TRANSLATED_MALE_NAMES = YAML.load_file('config/name_data/translated_male_names.yml')
  before_filter :initialize_name, only: [:show]

  def show
    nome
    cognome
    render :partial => "shared/italian_name"
  end

  private
  def initialize_name
    @gender     = params[:gender]
    @first_name = params[:first_name]
    @last_name  = params[:last_name]
  end

  def nome
    @first_name.gsub!(/\s+/, "")
    if @gender == "female"
      @italian_name = TRANSLATED_FEMALE_NAMES[@first_name] || FEMALE_NAMES[@first_name[0,1]].sample
    else
      @italian_name = TRANSLATED_MALE_NAMES[@first_name] || @italian_name = MALE_NAMES[@first_name[0,1]].sample
    end
    @italian_name.capitalize!
  end

  def cognome
    sostituire
    prefisso
    suffisso
    @italian_name = @italian_name + "  " + @prefix + @last_name.capitalize 
  end

  def prefisso
    @prefix = ""
    if @last_name =~ /\A[AEIOU]/
      @prefix = "D\'"
    elsif @last_name[0,1] == 'D'
      @last_name.insert(1,"\'")
    else  
      if rand(2) == 0
        @prefix = "Di"
      end
    end
  end

  def suffisso
    @last_name.gsub!(/\s+/, "")
    if @last_name =~ /[AEIO]$/
      @last_name.gsub!(/[AEIO]$/, ['I','INO','INA','INI'].sample)
    else
      @last_name.concat(['I','INO','INA','INI'].sample)
    end
    @last_name.squeeze!
  end

  def sostituire
    @last_name.gsub!(/[J]/, 'GI')
    @last_name.gsub!(/[W]/, 'V')
    @last_name.gsub!(/[Y]/, 'I')
    @last_name.gsub!(/(AY)/, 'EI')
    @last_name.gsub!(/(CH)/, 'CI')
    @last_name.gsub!(/(CK|K|QU)/, 'CH')
    @last_name.gsub!(/(OO)/, 'U')
    @last_name.gsub!(/(PH)/, 'F')
    @last_name.gsub!(/(SH)/, 'C')
    @last_name.gsub!(/(X|Z)/, 'S')
  end
end
