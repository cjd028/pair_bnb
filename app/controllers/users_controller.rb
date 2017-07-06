class UsersController < Clearance::UsersController
    def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_to welcome_path
    else
      render template: "users/new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :age)
    end
end