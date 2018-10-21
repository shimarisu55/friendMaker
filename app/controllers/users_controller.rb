class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_question, only: [:show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  # def new
  #   @user = User.new
  # end

  # GET /users/1/edit
  def edit
   3.times { @user.profiles.build } if @user.profiles.blank?
  end

  # POST /users
  # POST /users.json
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user == current_user
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user }
          flash[:success] = '更新されました'
          format.json { render json: { src: icon_image_source }, status: :ok }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user == current_user
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url }
        flash[:success] = '退会処理完了しました！'
        format.json { head :no_content }
      end
    end
  end

  private

    def icon_image_source
      image_path = "animalicon/icon#{@user.icon_animal}_#{@user.icon_color}.png"
      img = self.class.helpers.image_tag(image_path)
      Nokogiri::HTML.parse(img)
        .search('img').first.attributes['src'].value
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_question
      @user = User.find(params[:id])
      @question = Question.find_by(user_a_id: @user, user_q_id: current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :icon_animal, :icon_color,
        profiles_attributes: [
          :id,
          :user_id,
          :profile_q_number,
          :profile_a,
        ])
    end
end
