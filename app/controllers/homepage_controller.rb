class HomepageController < ApplicationController
  FEMALE_NAMES = YAML.load_file('config/name_data/sorted_female_names.yml')
  MALE_NAMES = YAML.load_file('config/name_data/sorted_male_names.yml')
  TRANSLATED_FEMALE_NAMES = YAML.load_file('config/name_data/translated_female_names.yml')
  TRANSLATED_MALE_NAMES = YAML.load_file('config/name_data/translated_male_names.yml')
  before_filter :initialize_name, only: [:italianize]
  
  def about
  end

  def italianize
    nome
    cognome
    render :partial => "shared/italian_name"
  end

  # def create
  #   @new_name = Name.new(name_params(@first_name,@last_name,@gender))
  #   @new_name.first_name = @first_name
  #   @new_name.last_name  = @last_name
  #   @new_name.gender     = @gender
    
  #   if @new_name.save then
  #     puts "Name saved!"
  #   else
  #     flash[:notice] = "Please complete all fields."
  #   end
  #   redirect_to(action: :italianize)
  # end

  private
  
  def initialize_name
    @gender = params[:gender]
    @first_name = params[:first_name]
    @first_name.upcase!
    @last_name  = params[:last_name]
    @last_name.upcase!
  end

  # def name_params
  #   return params.permit(:first_name,:last_name,:gender)
  # end

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
    suffiso
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

  def suffiso
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
    @last_name.gsub!(/(SH)/, 'C')
    @last_name.gsub!(/(X|Z)/, 'S')
  end
end