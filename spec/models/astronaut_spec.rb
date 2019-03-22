require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class Methods' do
    describe '.average_age' do
      it "shows average age of all astros" do
        astro_1 = Astronaut.create(name: "bobby", age: 10, job: "technician")
        astro_2 = Astronaut.create(name: "steve", age: 20, job: "pilot")

        expectation = Astronaut.average_age
        expect(expectation).to eq(15)
      end
    end
  end
  describe 'instance methods' do
    describe '.ordered_missions' do
      it 'orders the missions of an astronaut' do
        astro_1 = Astronaut.create(name: "bobby", age: 12, job: "technician")
        mission_1 = astro_1.missions.create(title: "mission c", time_in_space: 30)
        mission_2 = astro_1.missions.create(title: "mission b", time_in_space: 20)
        mission_3 = astro_1.missions.create(title: "mission a", time_in_space: 10)

        expectation = astro_1.ordered_missions
        result = [mission_3, mission_2, mission_1]

        expect(expectation).to eq(result)
      end
    end

    describe '.total_time' do
      it 'totals the time in space for an astronaut' do
        astro_1 = Astronaut.create(name: "bobby", age: 12, job: "technician")
        astro_1.missions.create(title: "mission c", time_in_space: 30)
        astro_1.missions.create(title: "mission b", time_in_space: 20)
        astro_1.missions.create(title: "mission a", time_in_space: 10)

        expected = astro_1.total_time

        expect(expected).to eq(60)
      end
    end
  end
end
