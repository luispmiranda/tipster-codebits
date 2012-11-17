class TipsController < ApplicationController

  load_and_authorize_resource class: 'Citygate::User', only: [:new, :create]

  before_filter :load_list

  # GET /tips
  def index
    @tips = @list.tips
  end

  # GET /tips/1
  def show
    @tip = Tip.find(params[:id])
  end

  # GET /tips/new
  def new
    @tip = @list.tips.build
  end

  # GET /tips/1/edit
  def edit
    @tip = Tip.find(params[:id])
  end

  # POST /tips
  def create
    @tip = Tip.new(params[:tip])

    if @tip.save
      @list.tips << @tip
      redirect_to list_path(@tip.list), notice: 'Tip was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /tips/1
  def update
    @tip = Tip.find(params[:id])

    if @tip.update_attributes(params[:tip])
      redirect_to list_tip_url(@list), notice: 'Tip was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /tips/1
  def destroy
    @tip = Tip.find(params[:id])
    @tip.destroy
    redirect_to :root
  end

  def favorite
    @tip = Tip.find(params[:id])
    @tip.favoriters << current_user
  end


  protected

    def load_list
      @list = List.find(params[:list_id])
    end
end
