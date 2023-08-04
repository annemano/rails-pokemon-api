class Api::V1::PokemonsController < ApplicationController
  include Pagy::Backend
  before_action :set_pokemon, only: [:show, :update, :destroy]
  after_action { pagy_headers_merge(@pagy) if @pagy }

  # GET api/v1/pokemons
  # GET api/v1/pokemons?page=1&items=10
  def index
    @pokemons = Pokemon.order(:number, :name)
    @pagy, @pokemons = pagy(@pokemons) if params[:page]

    if @pokemons
      render json: {status: "Success", message: "Fetched Pokemons successfully", data: @pokemons}, status: :ok
    else
      render json: @friends.errors, status: :bad_request
    end
  end

  # GET api/v1/pokemons/:id
  def show
    if @pokemon
      render json: {status: "Success", message: "Fetched #{@pokemon.name} successfully", data: @pokemon}, status: :ok
    else
      render json: @pokemon.errors, status: :bad_request
    end
  end

  # POST api/v1/pokemons/
  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save!
      render json: {status: "Success", message: "#{@pokemon.name} was created successfully!", data: @pokemon}, status: :created
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PUT api/v1/pokemons/:id
  def update
    if @pokemon.update(pokemon_params)
      render json: {status: "Success", message: "#{@pokemon.name} was updated successfully!", data: @pokemon}, status: :ok
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/pokemons/:id
  def destroy
    if @pokemon.destroy
      render json: {status: "Success", message: "#{@pokemon.name} was deleted successfully!"}, status: :ok
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
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
