require_relative '../spec_helper'

describe 'Student views' do
  let!(:student){Student.create(:name => "Flatiron Student")}

  context '/' do
    before do
      visit('/')
    end
    it 'has the correct header' do
      expect(page).to have_content("Flatiron School")
    end
    it 'has a link to existing students' do
      click_link(student.name)
      expect(page).to have_content(student.name)
    end
    it 'has a link to a new student' do
      click_link('Add New Student')
      expect(page).to have_content("New Student")
    end
  end

  context '/students/new' do
    let(:attributes){
      {:inputName => "New Test Student",
       :inputTwitter => "Handle",
       :inputLinkedIn => "LinkedIn URL",
       :inputGithub => "Github URL",
       :inputQuote => "Awesome Quote",
       :inputBio => "Cool bio",
       :inputWork => "My awesome job",
       :inputWorkTitle => "My awesome title",
       :inputEducation => "Awesome school",
      }
    }
    before do
      visit('/students/new')
    end

    it 'has a form with all attributes and creates student' do
      attributes.each do |field, value|
        fill_in(field.to_s, :with => value)
      end
      click_button('Create')

      expect(page).to have_text("A new student has been created!")
    end

    it 'adds the new student to the index' do
      attributes.each do |field, value|
        fill_in(field.to_s, :with => value)
      end
      click_button('Create')

      expect(page).to have_text(attributes[:inputName])
    end
  end

  context '/students/:slug' do
    before do
      visit("/students/#{student.slug}")
    end
    it 'has the student name' do
      expect(page).to have_content(student.name)
    end

    it 'has a link to edit the student' do
      click_link("Edit Info")
      expect(page).to have_content("Edit Student")
    end
  end

  context '/students/:slug/edit' do
    let(:attributes){
      {:inputName => "Updated Student Name",
       :inputTwitter => "Updated Handle",
       :inputLinkedIn => "Updated LinkedIn URL",
       :inputGithub => "Updated Github URL",
       :inputQuote => "Updated Awesome Quote",
       :inputBio => "Updated Cool bio",
       :inputWork => "Updated My awesome job",
       :inputWorkTitle => "Updated My awesome title",
       :inputEducation => "Updated Awesome school",
      }
    }
    before do
      visit("/students/#{student.slug}/edit")
    end

    it 'allows user to update the student info' do
      attributes.each do |field, value|
        fill_in(field.to_s, :with => value)
      end
      click_button('Save')

      expect(page).to have_text("The student has been updated!")
    end

    it 'shows the updated info' do
      attributes.each do |field, value|
        fill_in(field.to_s, :with => value)
      end
      click_button('Save')

      expect(page).to have_text(attributes[:inputName])
    end

  end

end