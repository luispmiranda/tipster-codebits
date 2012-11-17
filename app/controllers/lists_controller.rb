class ListsController < ApplicationController

  load_and_authorize_resource class: 'Citygate::User', only: [:new, :create]

  before_filter :get_list_by_id, except: [:index, :new, :create]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
    @list = List.find(params[:id])
  end

  # GET /lists/new
  def new
    @list = current_user.lists.build
  end

  # GET /lists/1/edit
  def edit
    @list = List.find(params[:id])
  end

  # POST /lists
  def create
    @list = List.new(params[:list])
    @list.user_id = current_user.id

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /lists/1
  def update
    @list = List.find(params[:id])

    if @list.update_attributes(params[:list])
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /lists/1
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to :root
  end

  def favorite
    @list.favoriters << current_user
    redirect_to favorites_path
  end


  protected

    def get_list_by_id
      @list = List.find(params[:id])
    end
end
