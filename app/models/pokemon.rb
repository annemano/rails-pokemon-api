class Pokemon < ApplicationRecord
  VALID_TYPES = %w(Normal Grass Poison Fire Flying Dragon Water Bug Psychic Ground Electric Fairy Fighting Rock Steel Ice Ghost Dark)

  validates :number, :name, :type_1, :total, :hp, :attack, :defense, :sp_atk,
            :sp_def, :speed, :generation, presence: true
  validates :name, uniqueness: true
  validates :number, :generation, numericality: { :greater_than_or_equal_to => 0 }
  validates :type_1,
            inclusion: { in: VALID_TYPES,
                          message: "%{value} is not a valid Pokemon type"
                        }
  validates :type_2,
            inclusion: { in: VALID_TYPES,
                          message: "%{value} is not a valid Pokemon type",
                          allow_nil: true
                        }
end
