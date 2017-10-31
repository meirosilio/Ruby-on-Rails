class KittensController < ApplicationController

  def index
    @kittens= Kitten.all

    respond_to do |format|
      format.html
      format.json{render :json=>@kittens}
    end
  end

  def show
    @kitten = Kitten.find_by(id: params[:id])

    respond_to do |format|
      format.html
      format.json{render :json=>@kitten}
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find_by(id: params[:id])
  end


  def update
    @kitten=Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:success] = " #{@kitten.name} Updated"
      redirect_to kittens_path
    else
      render :edit
      flash[:danger] = "Please try again"
    end
  end


  def create
    @kitten=Kitten.create(kitten_params)
    if @kitten.save
      flash[:success] = "A new kitten named #{@kitten.name} become part of our growing family"
      redirect_to kittens_path
    else
      render :new
      flash[:danger] = "Please try again"
    end
  end

  def destroy
    @kitten = Kitten.find_by(id: params[:id])
    @kitten.destroy
    flash[:success] = "You deleted sucessfuly #{@kitten.name}"
    redirect_to kittens_path
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name,:age,:cuteness,:softness )
  end
end
