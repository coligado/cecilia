class HomepageController < ApplicationController
  def show_topics
  end

  def about
  end

  def italianize
  	gender = params[:gender]
  	first_name = params[:name][:first_name]
    first_name.upcase
    if first_name[-1,1] == 'A'
      # check if it's in the female YAML file
    else
      # check if it's in the 
    end

  	@last_name = params[:name][:last_name]
    render :partial => "shared/italian_name"
  end

  private
  # def comment_params(params)
  #   return params.permit(:comment)
  # end
end
