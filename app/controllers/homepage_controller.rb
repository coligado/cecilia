class HomepageController < ApplicationController
  # FEMALE_NAMES = YAML.load_file('config/female_names.yml')
  
  def show_topics
  end

  def about
  end

  def italianize
  	gender = params[:gender]
  	first_name = params[:name][:first_name]
    first_name.upcase
    if gender = :gender_female
      # check if it's in the female YAML file
      puts gender
    else
      # check if it's in the 
    end
    last_name = params[:name][:last_name]
  	render :partial => "shared/italian_name"
  end

  private
  # def comment_params(params)
  #   return params.permit(:comment)
  # end
end