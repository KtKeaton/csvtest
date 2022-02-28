class FoosController < ApplicationController
  before_action :find_foo, only: [:edit, :update, :destroy]

  def index
    @foos = Foo.all
  end

  def new
    @foo = Foo.new  
  end

  def create
    @foo = Foo.new(foo_params)
    if @foo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @foo = find_foo
  end

  def update
    @foo = find_foo
    @foo.update(foo_params)
    redirect_to foo_path(@foo)
  end

  # def destroy
  #   @foo = find_foo
  #   @foo.destroy
  #     redirect_to tasks_url, :notice "Foo not exist"
  # end

private
  def find_foo
    @foo = Foo.find(params[:id])
  end

  def foo_params
    params.require(:foo).permit(:name)
  end
end
