class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    self.all.average(:age)
  end

  def ordered_missions
    self.missions.order(title: :asc)
  end

  def total_time
    self.missions.sum(:time_in_space)
  end
end
