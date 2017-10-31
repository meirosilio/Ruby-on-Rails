class Kitten < ApplicationRecord

  validates :name, presence: true
  validates :age, presence: true
  validates :cuteness, presence: true
  validates :softness, presence: true

  default_scope {order(:cuteness => 'DESC')}
  default_scope {order(:softness => 'DESC')}
  default_scope {order(:created_at => 'DESC')}

  def self.above_cuteness_average?(cuteness)
    true if cuteness>= average(:cuteness)
  end

  def self.above_softness_average?(softness)
    true if softness>= average(:softness)
  end



end
