class Api::V1::PokemonsController < ApplicationController
  include Pagy::Backend
  before_action :set_pokemon, only: [:show, :update, :destroy]
  after_action { pagy_headers_merge(@pagy) if @pagy }

  # GET api/v1/pokemons
  # GET api/v1/pokemons?page=1&items=10
  def index
    @pokemons = Pokemon.order(:number, :name)
    @pagy, @pokemons = pagy(@pokemons) if params[:page]

    render json: {status: "Success", message: "Fetched Pokemons successfully", data: @pokemons}, status: :ok
  end

  # GET api/v1/pokemons/:id
  def show
    render json: {status: "Success", message: "Fetched #{@pokemon.name} successfully", data: @pokemon}, status: :ok
  end

  # POST api/v1/pokemons/
  def create
    @pokemon = Pokemon.create!(pokemon_params)

    render json: {status: "Success", message: "#{@pokemon.name} was created successfully!", data: @pokemon}, status: :created
  end

  # PUT api/v1/pokemons/:id
  def update
    @pokemon.update(pokemon_params)

    render json: {status: "Success", message: "#{@pokemon.name} was updated successfully!", data: @pokemon}, status: :ok
  end

  # DELETE api/v1/pokemons/:id
  def destroy
    @pokemon.destroy

    render json: {status: "Success", message: "#{@pokemon.name} was deleted successfully!"}, status: :ok
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(
      :number,
      :name,
      :type_1,
      :type_2,
      :total,
      :hp,
      :attack,
      :defense,
      :sp_atk,
      :sp_def,
      :speed,
      :generation,
      :legendary
    )
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
