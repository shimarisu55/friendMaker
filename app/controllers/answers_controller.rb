class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  # def index
  #   @answers = Answer.all
  # end

  # GET /answers/1
  # GET /answers/1.json
  # def show
  # end

  # GET /answers/new
  # def new
  #   @answer = Answer.new
  # end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  # def create
  #   @answer = Answer.new(answer_params)

  #   respond_to do |format|
  #     if @answer.save
  #       format.html { redirect_to user_answer_path(@answer), notice: 'Answer was successfully created.' }
  #       format.json { render :show, status: :created, location: @answer }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @answer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    if @answer.question.a_user == current_user
      respond_to do |format|
        if @answer.update(answer_params)
          format.html { redirect_to user_path(current_user) }
          flash[:success] = '回答が投稿されました！'
          format.json { render :show, status: :ok, location: @answer }
        else
          format.html { render :edit }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @user = User.find(params[:user_id])
      @answer = Answer.find_by(question_id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:question_id, :first_content, :second_content, :third_content)
    end
end
