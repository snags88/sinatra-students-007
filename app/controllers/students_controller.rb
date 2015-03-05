class StudentsController < ApplicationController
  get '/' do
    @students = Student.all
    erb :'students/index'
  end

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
