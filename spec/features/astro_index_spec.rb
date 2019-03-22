require 'rails_helper'

RSpec.describe 'When I visit /astronauts', type: :feature do
  it 'shows information about each astronaut' do
    astro_1 = Astronaut.create(name: "bobby", age: 12, job: "technician")
    astro_2 = Astronaut.create(name: "steve", age: 13, job: "pilot")

    visit astronauts_path

    within "#astro-#{astro_1.id}" do
      expect(page).to have_content("Name: bobby")
      expect(page).to have_content("Age: 12")
      expect(page).to have_content("Job: technician")
    end
    within "#astro-#{astro_2.id}" do
      expect(page).to have_content("Name: steve")
      expect(page).to have_content("Age: 13")
      expect(page).to have_content("Job: pilot")
    end
  end

  it 'shows the average_age of astronauts' do
    Astronaut.create(name: "bobby", age: 10, job: "technician")
    Astronaut.create(name: "steve", age: 20, job: "pilot")

    visit astronauts_path

    expect(page).to have_content("Average Age: 15")
  end

  it 'shows a list of missions for each astronaut' do
    astro_1 = Astronaut.create(name: "bobby", age: 12, job: "technician")
    mission = astro_1.missions.create(title: "mission c", time_in_space: 30)
    mission = astro_1.missions.create(title: "mission b", time_in_space: 20)
    mission = astro_1.missions.create(title: "mission a", time_in_space: 10)

    visit astronauts_path
    within "#astro-#{astro_1.id}" do
      expect(page).to have_content("mission a mission b mission c")
    end
  end

  it 'shows total time in space for each astronaut' do
    astro_1 = Astronaut.create(name: "bobby", age: 12, job: "technician")
    mission = astro_1.missions.create(title: "mission c", time_in_space: 30)
    mission = astro_1.missions.create(title: "mission b", time_in_space: 20)
    mission = astro_1.missions.create(title: "mission a", time_in_space: 10)

    visit astronauts_path

    within "#astro-#{astro_1.id}" do
      expect(page).to have_content("Total Time in Space: 60 days")
    end
  end
end
