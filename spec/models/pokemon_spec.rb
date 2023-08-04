require 'rails_helper'

RSpec.describe Pokemon, :type => :model do
  subject {
    described_class.new(number: 1,
                        name: "Pikachu",
                        type_1: "Electric",
                        total: 100,
                        hp: 100,
                        attack: 100,
                        defense: 100,
                        sp_atk: 100,
                        sp_def: 100,
                        speed: 100,
                        generation: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a number" do
    subject.number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a unique number" do
    Pokemon.create!(number: 1,
            name: "Pikachu",
            type_1: "Electric",
            total: 100,
            hp: 100,
            attack: 100,
            defense: 100,
            sp_atk: 100,
            sp_def: 100,
            speed: 100,
            generation: 1)
    pokemon = Pokemon.new(number: 1,
                      name: "Bulbasaur",
                      type_1: "Grass",
                      total: 100,
                      hp: 100,
                      attack: 100,
                      defense: 100,
                      sp_atk: 100,
                      sp_def: 100,
                      speed: 100,
                      generation: 1)

    expect(pokemon).to_not be_valid
  end

  it "is not valid without a positive number" do
    subject.number = -5
    expect(subject).to_not be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a unique name" do
    Pokemon.create!(number: 1,
            name: "Pikachu",
            type_1: "Electric",
            total: 100,
            hp: 100,
            attack: 100,
            defense: 100,
            sp_atk: 100,
            sp_def: 100,
            speed: 100,
            generation: 1)
    pokemon = Pokemon.new(number: 2,
                      name: "Pikachu",
                      type_1: "Grass",
                      total: 100,
                      hp: 100,
                      attack: 100,
                      defense: 100,
                      sp_atk: 100,
                      sp_def: 100,
                      speed: 100,
                      generation: 1)
    expect(pokemon).to_not be_valid
  end

  it "is not valid without a type_1" do
    subject.type_1 = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a valid type" do
    subject.type_1 = "Toto"
    expect(subject).to_not be_valid
  end

  it "is not valid without a total number" do
    subject.total = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an hp" do
    subject.hp = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an attack number" do
    subject.attack = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a defense number" do
    subject.defense = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a sp_atk" do
    subject.sp_atk = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a sp_def" do
    subject.sp_def = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a speed number" do
    subject.speed = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a generation number" do
    subject.generation = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a positive generation number" do
    subject.generation = -5
    expect(subject).to_not be_valid
  end
end
