class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :edit, :update, :destroy]

  def index
    @blocks = Block.all
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
  end

  def destroy
    @block.destroy
      redirect_to blocks_url
    end
  end

  private
    # use callbacks to share common setup between actions
    def set_block
      @block = Block.find(params[:id])
    end
    # allow only white list and block black list
    def block_params
      params.require(:block).permit(:description)
    end
end
