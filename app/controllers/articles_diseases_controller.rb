class ArticlesDiseasesController < ApplicationController
  before_action :set_articles_disease, only: %i[ show edit update destroy ]

  # GET /articles_diseases or /articles_diseases.json
  def index
    @articles_diseases = ArticlesDisease.all
  end

  # GET /articles_diseases/1 or /articles_diseases/1.json
  def show
  end

  # GET /articles_diseases/new
  def new
    @articles_disease = ArticlesDisease.new
  end

  # GET /articles_diseases/1/edit
  def edit
  end

  # POST /articles_diseases or /articles_diseases.json
  def create
    @articles_disease = ArticlesDisease.new(articles_disease_params)

    respond_to do |format|
      if @articles_disease.save
        format.html { redirect_to articles_disease_url(@articles_disease), notice: "Articles disease was successfully created." }
        format.json { render :show, status: :created, location: @articles_disease }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @articles_disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles_diseases/1 or /articles_diseases/1.json
  def update
    respond_to do |format|
      if @articles_disease.update(articles_disease_params)
        format.html { redirect_to articles_disease_url(@articles_disease), notice: "Articles disease was successfully updated." }
        format.json { render :show, status: :ok, location: @articles_disease }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @articles_disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles_diseases/1 or /articles_diseases/1.json
  def destroy
    @articles_disease.destroy!

    respond_to do |format|
      format.html { redirect_to articles_diseases_url, notice: "Articles disease was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articles_disease
      @articles_disease = ArticlesDisease.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def articles_disease_params
      params.require(:articles_disease).permit(:article_id, :disease_id)
    end
end
