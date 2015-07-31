enable :sessions

get '/session_viewer' do
  session.inspect
end

get '/' do
  if session[:user_id]
    user = User.find(session[:user_id])
    @username = user.username
    @tweets = get_tweets_from_those_im_following(user)
    sort_tweets(@tweets)
    erb :home
  else
    erb :login
  end
end

post '/' do
  user = User.find_by(username: params[:username])
  if user && (user.password == params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Username or password invalid."
    erb :login
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

#-------------------------------
enable :sessions

get '/session_viewer' do
  session.inspect
end

get '/' do
  if session[:user_id]
    user = User.find(session[:user_id])
    @username = user.username
    @tweets = get_tweets_from_those_im_following(user)
    sort_tweets(@tweets)
    erb :home
  else
    erb :login
  end
end

post '/' do
  user = User.find_by(username: params[:username])
  if user && (user.password == params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Username or password invalid."
    erb :login
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

#----------------------------------------
post '/signin' do

  if @user = User.authenticate(params[:user_name], params[:password_hash])
    session[:user_id] = @user.id
    redirect "/users/#{current_user.id}/notes"
  else
    @errors = "Whoops - you typed in the wrong information."
    erb :signin
  end
end

get '/signup' do
  if current_user
    @errors = "You're already logged in."
    redirect "/users/#{current_user.id}/notes"
  else
    erb :signup
  end
end

post '/signup' do

  if params[:user][:password_hash] == params[:password_hash_verify]
    @user = User.new(params[:user])
    @user.password = params[:user][:password_hash]
    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{current_user.id}/notes"
    end
  end
  @errors = "Sorry! Your username, or password, or BOTH are incorrect."
  erb :signup
end

#_-----------------------------------
#Model user.rb
require 'bcrypt'

class User < ActiveRecord::Base
  has_many :notes

  include BCrypta       #is it necessary here and in environment.rb?

  def self.authenticate(user_name, entered_password)
    user = User.where(user_name: user_name).first
    if user && user.password == entered_password
      return user
    else
      return nil
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
#--------
helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    @current_user ||= User.where(id: session[:user_id]).first if session[:user_id]
  end

end
#-------------
class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :user_name
      t.string :email
      t.string :password_hash

      t.timestamps
    end
  end
end

#---------------