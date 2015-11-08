class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blocks = Block.all
  end

  def show
  end

  def new
    @block = current_user.blocks.build
  end

  def edit
  end

  def create
    @block = current_user.blocks.build(block_params)

      if @block.save
        redirect_to @block, notice: 'Block was successfully created.'
      else
        render :new
      end
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
      @block = Block.find_by(params[:id])
    end

    def correct_user
      @block = current_user.blocks.find_by(id: params[:id])
      redirect_to blocks_path, notice: "Not authorized to edit this pin" if @block.nil?
    end
    # allow only white list and block black list
    def block_params
      params.require(:block).permit(:description)
    end
