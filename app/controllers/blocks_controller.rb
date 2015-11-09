class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :edit, :update, :destroy, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blocks = Block.all.order("created_at DESC")

  end

  def show
  end

  def new
    @block = Block.new
    end

  def edit
  end

  def create
    @block = Block.new(block_params)
    @block.user_id = current_user.id

      if @block.save
        
        render :show, notice: 'Block was successfully created.'
      else
        render :new
      end

  end

  def update
      if @block.update(block_params)
        redirect_to @block, notice: 'Block was successfully updated.'
      else
        render :edit
      end
  end

    def destroy
    @block.destroy
      redirect_to blocks_url
    end

  private
    # use callbacks to share common setup between actions
    def set_block
      if params[:id]
        @block = Block.find(params[:id])
      end
    end

    def correct_user
      @block = current_user.blocks.find_by(id: params[:id])
      if !@block
        redirect_to blocks_path, notice: "Not authorized to edit this pin" if @block.nil?
      end
    end


    # allow only white list and block black list
    def block_params
      params.require(:block).permit(:title, :description, :user_id)
    end
  end
