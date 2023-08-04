require 'rails_helper'

RSpec.describe "List Pokemons", :type => :request do
  it "returns a list of Pokemons with OK status" do
    get '/api/v1/pokemons'
    expect(response).to have_http_status(200)
  end

  it "returns a paginated list of Pokemons when using page param" do
    get '/api/v1/pokemons', params: { page: 1 }
    expect(response.header["Total-Pages"]).to eq("1")
  end
end

RSpec.describe "Create a Pokemon", :type => :request do
  it "returns a created status when using valid attributes" do
    pokemon = { number: 2,
                name: "Pikachu",
                type_1: "Electric",
                total: 100,
                hp: 100,
                attack: 100,
                defense: 100,
                sp_atk: 100,
                sp_def: 100,
                speed: 100,
                generation: 1
              }
    post '/api/v1/pokemons', params: {pokemon: pokemon}
    expect(response).to have_http_status(201)
  end

  it "returns an unprocessable entity status when using invalid attributes" do
    invalid_pokemon = { name: "Pikachu" }
    post '/api/v1/pokemons', params: { pokemon: invalid_pokemon }
    expect(response).to have_http_status(422)
  end
end
