class Maintain::LookupsController < Maintain::BaseController
  def index
    @lookups = Lookup.paginate(:page=>params[:page])
  end

  def show
    @lookup = Lookup.find(params[:id])
  end

  def new
    @lookup = Lookup.new
  end

  def create
    @lookup = Lookup.new(params[:lookup])
    if @lookup.save
      redirect_to maintain_lookups_path
    else
      redirect_to :back
    end
  end

  def edit
    @lookup = Lookup.find(params[:id])
  end

  def update
    @lookup = Lookup.find(params[:id])
    if @lookup.update_attributes(params[:lookup])
      redirect_to maintain_lookup_path(@lookup)
    else
      redirect_to :back
    end
  end

  def destroy
  end
end
