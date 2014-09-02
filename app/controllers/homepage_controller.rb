class HomepageController < ApplicationController
  def show_topics
  end

  def about
  end

  def italianize
  	gender = params[:gender]
  	first_name = params[:first_name]
  	return render partial: 'shared/italian_name'
  end

  private

end
