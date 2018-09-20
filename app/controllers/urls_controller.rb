class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :short, :destroy]

  # GET /urls
  # GET /urls.json
  def index
    @url = Url.new
    @urls = Url.all
  end

  # GET /urls/:short_url
  # GET /urls/:short_url.json
  def show; end

  def short
    redirect_to(formatted_url)
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)
    respond_to do |format|
      if @url.save
        format.html { redirect_to url_path(@url.short_url), notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: url_path(@url.short_url) }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/:short_url
  # DELETE /urls/:short_url.json
  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      begin
        @url = Url.find_by_short_url!(params[:short_url] || params[:id])
      rescue ActiveRecord::RecordNotFound
        handle_error
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:original_url)
    end

    def formatted_url
      new_url = @url.original_url.downcase.gsub(/(https?:\/\/)|(www\.)/, '')
      new_url.slice!(-1) if new_url[-1] == '/'
      "http://#{new_url}"
    end

    def handle_error
      respond_to do |format|
        format.html { redirect_to urls_url, notice: "Url doesn't exist" }
        format.json { render json: { error: "Url doesn't exist", status: 404 } }
      end
    end
end
