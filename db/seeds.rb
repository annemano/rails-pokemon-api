require 'csv'

puts "Destroying all existing Pokemons..."
Pokemon.destroy_all
puts "Done!"
puts "Creating new Pokemons..."

csv_path = File.join(__dir__, "pokemon.csv")

CSV.foreach(csv_path, headers: :first_row) do |row|
      pokemon = {}
      pokemon[:number] = row["#"].to_i
      pokemon[:name] = row["Name"]
      pokemon[:type_1] = row["Type 1"]
      pokemon[:type_2] = row["Type 2"]
      pokemon[:total] = row["Total"].to_i
      pokemon[:hp] = row["HP"].to_i
      pokemon[:attack] = row["Attack"]
      pokemon[:defense] = row["Defense"].to_i
      pokemon[:sp_atk] = row["Sp. Atk"].to_i
      pokemon[:sp_def] = row["Sp. Def"].to_i
      pokemon[:speed] = row["Speed"].to_i
      pokemon[:generation] = row["Generation"].to_i
      pokemon[:legendary] = row["Legendary"] == "True" ? true : false

      Pokemon.create!(pokemon)
end


puts "Done!"
