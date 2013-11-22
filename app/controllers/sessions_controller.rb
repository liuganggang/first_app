class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(emall: session_params[:emall].downcase)
    if user && user.authenticate(session_params[:password])
      flash[:notice] = 'sign success'
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:emall,:password)
  end
end
