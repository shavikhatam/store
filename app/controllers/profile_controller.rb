class ProfileController < ApplicationController

  before_filter :authenticate_user!

  def show

  end

  def edit

  end

  def save
    if current_user.update_attributes params[:user].permit(:email, :first_name, :last_name, :avatar)
      redirect_to profile_show_path, notice: 'saved'
    else
      render 'edit'
    end
  end

end
