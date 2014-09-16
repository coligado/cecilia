class HomepageController < ApplicationController
  before_filter :initialize_name, only: [:create]
  
  def about
  end

  def error
    @messages = params[:error_messages]
    return render :partial => "shared/error"
  end

  def create
    @new_name = Name.new
    @new_name.gender     = @gender
    @new_name.first_name = @first_name
    @new_name.last_name  = @last_name
    
    if @new_name.save
      redirect_to(controller: :italianize, action: :show, 
      gender: @gender, first_name: @first_name, last_name: @last_name)
    else
      redirect_to(action: :error, error_messages: @new_name.errors.messages.values.first)
    end
  end

  private
  def initialize_name
    @gender = params[:gender]
    @first_name = params[:first_name]
    @first_name.upcase!
    @last_name  = params[:last_name]
    @last_name.upcase!
  end
end