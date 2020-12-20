class PlantsController < SecuredController
  def index
    plants = Plant.where(user_id: current_user).order(created_at: :asc)
    render json: plants
  end

  def show
    id = params.require(:id)
    plant = Plant.find_by(id: id, user_id: current_user)

    if plant.nil?
      render status: :not_found
    else
      render json: plant
    end
  end

  def create
    name = params.require(:name)
    species = params.require(:species)
    plant = Plant.create(name: name, species: species, user_id: current_user)
    render status: :created, location: request.base_url + plant_path(plant.id)
  end
end
