class FlexTemplatesController < ApplicationController
  before_action :set_flex_template, only: %i[ show edit update destroy ]

  # GET /flex_templates or /flex_templates.json
  def index
    @flex_templates = FlexTemplate.all
  end

  # GET /flex_templates/1 or /flex_templates/1.json
  def show
  end

  # GET /flex_templates/new
  def new
    @flex_template = FlexTemplate.new
  end

  # GET /flex_templates/1/edit
  def edit
  end

  # POST /flex_templates or /flex_templates.json
  def create
    @flex_template = FlexTemplate.new(flex_template_params)

    respond_to do |format|
      if @flex_template.save
        format.html { redirect_to flex_template_url(@flex_template), notice: "Flex template was successfully created." }
        format.json { render :show, status: :created, location: @flex_template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flex_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flex_templates/1 or /flex_templates/1.json
  def update
    respond_to do |format|
      if @flex_template.update(flex_template_params)
        format.html { redirect_to flex_template_url(@flex_template), notice: "Flex template was successfully updated." }
        format.json { render :show, status: :ok, location: @flex_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flex_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flex_templates/1 or /flex_templates/1.json
  def destroy
    @flex_template.destroy

    respond_to do |format|
      format.html { redirect_to flex_templates_url, notice: "Flex template was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flex_template
      @flex_template = FlexTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flex_template_params
      params.require(:flex_template).permit(:name, :body)
    end
end
