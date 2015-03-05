# StudentsController inherits from ApplicationController
# so any settings defined there will apply to this controller.
class StudentsController < ApplicationController
  # GET '/'
  get '/' do
    # Homepage action to display the student index.
    # Load all the students into an instance variable.
    # We use the ::all method on the Student class, provided by Sequel
    @students = Student.all
    erb :'students/index' # render the index.erb within app/views/students
  end

  # Build the rest of the routes here.

  get '/students' do
    redirect '/'
  end

  get '/students/new' do
    erb :'students/new'
  end

  post '/students' do
    @student = Student.create(params[:attributes])
    flash[:new] = "New student created"
    redirect '/'
  end

  get '/students/:slug' do
    @student = Student.find_by(:slug => params[:slug])
    erb :"students/show"
  end

  get '/students/:slug/edit' do
    @student = Student.find_by(:slug => params[:slug])
    erb :"students/edit"
  end

  patch '/students/:slug' do
    @student = Student.find_by(:slug => params[:slug])
    @student.update(params[:attributes])
    flash[:updated] = "Updated student!"
    redirect "students/#{@student.slug}"
  end
end
