require_relative '../spec_helper'

describe StudentsController do
  # Every route should be within it's own context.
  context 'GET /' do
    # student will be a new, unsaved student.
    let!(:student){Student.create(:name => "Flatiron Student")}
    # As your test suite grows, you might need more sample data to correctly
    # test your controllers. For example, when testing updating a student
    # your test object (student), will have to have been saved and you'll have
    # to compare the original student to the updated student and make sure the
    # correct updates occurred. Feel free to create more test objects as you need.

    # BONUS - Use factory_girl https://github.com/thoughtbot/factory_girl

    # This creates a mock web request to the route '/' so that our tests
    #    can check the response to that request through the Rack::Test provided
    #    method 'last_response', which will always mean the last response
    #    our test suite triggered.
    before do
      get '/'
    end

    # A good controller test you can write for every single route/action
    # is to make sure it responds with a 200 status code.
    it 'responds with a 200' do
      # We use the last_response object to test the properties of the response
      # sinatra would send to the request. last_response behaves a lot like an
      # HTTP, with methods to provide a status code and the body of the response
      # A shortcut to checking the status is to just say it is ok with the line below.
      expect(last_response).to be_ok
    end

    it 'has the students name in the response' do
      # The body of the last_response is basically the rendered HTML from the view.
      expect(last_response.body).to include(student.name)
    end
  end

  context 'GET /students/new' do

    before do
      get '/students/new'
    end

    it 'responds with a 200' do
      expect(last_response).to be_ok
    end

    it 'has a form' do
      expect(last_response.body).to include("<form")
    end
  end

  context 'POST /students' do
    before do
      params = {:attributes => {:name => "New student"}}
      post '/students', params
    end

    it 'responds with a 302' do
      expect(last_response).to be_redirect
    end

    it 'redirects to /' do
      follow_redirect!
      expect(last_request.url).to eq('http://example.org/')
    end

    it 'creates a new student named New Student' do
      s = Student.last
      expect(s.name).to eq("New student")
    end
  end

  context 'GET /students/slug' do
    let!(:student){Student.create(:name => "Flatiron Student")}

    before do
      get "/students/#{student.slug}"
    end

    it 'responds with a 200' do
      expect(last_response).to be_ok
    end

    it 'has the students name in the response' do
      expect(last_response.body).to include(student.name)
    end
  end

  # This context should only be about testing the edit form.
  context 'GET /students/slug/edit' do
    let!(:student){Student.create(:name => "Flatiron Student")}

    before do
      get "/students/#{student.slug}/edit"
    end

    it 'responds with a 200' do

      expect(last_response).to be_ok
    end

  end

  context 'PATCH /students/slug' do
    let!(:student){Student.create(:name => "Flatiron Student")}
    before do
      params = {:attributes => {:name => "test"}}
      patch "/students/#{student.slug}", params
      student.reload
    end

    it 'responds with a 302' do
      expect(last_response).to be_redirect
    end

    it 'redirects to /' do
      follow_redirect!
      expect(last_request.url).to eq("http://example.org/students/#{student.slug}")
    end

    it 'updates the student name to "test"' do
      expect(student.name).to eq("test")
    end
  end
end