require_relative '../spec_helper'

describe Student do
  context 'build student' do
    before do
      attributes = {
          :name => "Seiji Naganuma",
          :twitter => "Test1",
          :linkedin => "Test2",
          :github => "Test3",
          :quote => "Test4",
          :bio => "Test5",
          :work => "Test6",
          :work_title => "Test7",
          :education => "Test8",
          :profile_image => "Test9",
          :background_image => "Test10"
        }
        Student.create(attributes)
    end

    after do
      Student.destroy_all
    end

    let(:student){Student.first}

    describe '#name' do
      it "allows saving of a student with a name" do
        expect(student.name).to eq("Seiji Naganuma")
      end
    end
    describe '#twitter' do
      it "allows saving of a student with a twitter" do
        expect(student.twitter).to eq("Test1")
      end
    end
    describe '#linkedin' do
      it "allows saving of a student with a linkedin" do
        expect(student.linkedin).to eq("Test2")
      end
    end
    describe '#github' do
      it "allows saving of a student with a github" do
        expect(student.github).to eq("Test3")
      end
    end
    describe '#quote' do
      it "allows saving of a student with a quote" do
        expect(student.quote).to eq("Test4")
      end
    end
    describe '#bio' do
      it "allows saving of a student with a bio" do
        expect(student.bio).to eq("Test5")
      end
    end
    describe '#work' do
      it "allows saving of a student with a work" do
        expect(student.work).to eq("Test6")
      end
    end
    describe '#work_title' do
      it "allows saving of a student with a work_title" do
        expect(student.work_title).to eq("Test7")
      end
    end
    describe '#education' do
      it "allows saving of a student with a education" do
        expect(student.education).to eq("Test8")
      end
    end
    describe '#profile_image' do
      it "allows saving of a student with a profile_image" do
        expect(student.profile_image).to eq("Test9")
      end
    end
    describe '#background_image' do
      it "allows saving of a student with a background_image" do
        expect(student.background_image).to eq("Test10")
      end
    end

  end

  context 'with slugs' do
    describe '#slugify!' do
      it "formats a slug based on a student's name" do
        # Remember that subject will by default be a new instance
        # of the class being described.
        subject.name = "Avi Flombaum"
        subject.slugify!

        expect(subject.slug).to eq('avi-flombaum')
      end

      it 'saves the slug to the database on create' do
        # You will need to read this and learn about model hooks.
        # http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html
        # http://edgeguides.rubyonrails.org/active_record_callbacks.html
        subject.name = "Avi Flombaum"
        subject.save

        expect(subject.slug).to eq('avi-flombaum')
        expect(Student.find_by(:slug => "avi-flombaum")).to eq(subject)
      end
    end
  end
end
