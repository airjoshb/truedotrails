class ChallengeStepsController < ApplicationController
    before_action :set_challenge_step, only: [:show, :edit, :update, :destroy]
  
    # GET /challenges
    # GET /challenges.json
    def index
      @challenge_steps = ChallengeStep.all
    end
  
    # GET /challenges/1
    # GET /challenges/1.json
    def show
    end
  
    # GET /challenges/new
    def new
      @challenge_steps = ChallengeStep.new
    end
  
    # GET /challenges/1/edit
    def edit
    end
  
    # POST /challenges
    # POST /challenges.json
    def create
      @challenge_step = ChallengeStep.new(challenge_step_params)
  
      respond_to do |format|
        if @challenge_step.save
          format.html { redirect_to @challenge_step, notice: 'Challenge Step was successfully created.' }
          format.json { render :show, status: :created, location: @challenge_step }
        else
          format.html { render :new }
          format.json { render json: @challenge_step.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /challenges/1
    # PATCH/PUT /challenges/1.json
    def update
      respond_to do |format|
        if @challenge_step.update(challenge_step_params)
          format.html { redirect_to @challenge_step, notice: 'Challenge Step was successfully updated.' }
          format.json { render :show, status: :ok, location: @challenge_step }
        else
          format.html { render :edit }
          format.json { render json: @challenge_step.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /challenges/1
    # DELETE /challenges/1.json
    def destroy
      @challenge_step.destroy
      respond_to do |format|
        format.html { redirect_to challenge_steps_url, notice: 'Challenge Step was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_challenge_step
        @challenge_step = ChallengeStep.friendly.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def challenge_step_params
        params.require(:challenge_step).permit(:title, :content)
      end
  end
  