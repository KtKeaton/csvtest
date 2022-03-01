class FoosController < ApplicationController
  before_action :find_foo, only: [:edit, :update, :destroy]

  def index
    @foos = Foo.all
    
    respond_to do |format|
      format.html
      format.csv { send_data @foos.export, filename: "foos-#{Date.today}.csv" }
    end

  end

  def export
    attributes = %w{name}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |foo|
        csv << attributes.map{ |attr| foo.send(attr) }
      end
    end
  end

  def name
    "#{foo_id} #{name}"
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
