module Admin
  class UsersController < AdminController
    before_action :set_user, only: %i[edit update destroy]

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def edit; end

    def create
      @user = User.new(user_params)
      begin
        authorize @user
        if @user.save
          redirect_to admin_users_path, notice: "User #{@user.name} successfully created"
        else
          render :new
        end
      rescue Pundit::NotAuthorizedError
        @user.errors.add(:base, "You don't have permission to create a user")
        render :new
      end
    end

    def update
      authorize @user

      if user_params[:password].blank?
        if @user.update_without_password(user_params)
           redirect_to admin_users_path, notice: "User #{@user.name} updated" # rubocop:todo Layout/IndentationWidth
        else
           render :edit # rubocop:todo Layout/IndentationWidth
        end
      else
        @user.reset_password_token = "admin_reset"
        @user.update_without_password(user_params)
        if @user.reset_password(user_params[:password], user_params[:password_confirmation])
          redirect_to admin_users_path, notice: "User #{@user.name} updated.  Password changed!"
        else
          render :edit
        end
      end
    rescue Pundit::NotAuthorizedError
      @user.errors.add(:base, "You don't have permission to update a user")
      render :edit
    end

    def destroy
      authorize @user, :destroy?
      @user.destroy!
      redirect_to admin_user_path, notice: "User was successfully destroyed."
    end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
    end
  end
end
