get '/' do
  erb : index
end


#CRUD & RESTful routes

#Index of all photos
get '/photos' do
  @photos = photos.all
  erb :"photos/all"
end

#New
get '/photos/new' do
  @photo = Photo.new #blank photo there so erb won't choke on @photo
  erb :"photo/new"
end

#create
post '/photos' do
  @photo=Photo.new(
      title: params[:title],
      url: parms[:url],
  )
  if @photo.save
    redirect "/photos/#{@photo.id}"
  else
    status 400
    "Crap #{@photo.errors.full_messages.inspect}"
    erb :"photo/new"
  end

end

#Show a photo (READ)
get '/photos/:id' do
  @photo = Photo.where(params[:id]).first
  if @photo
    erb :"photos/show"
  else
    status 404
    "could not find that photo"
  end
  content_type :text

end

#Edit
get '/photos/:id/edit' do

  put '/photos/:id' do
    @photo = Photo.where(params[:id]).first
    if @photo
      erb :"photos/edit"
    else
      status 404
      "could not find that photo"
    end
end

#Update
put '/photos/:id' do
  @photo = Photo.where(params[:id]).first
  @photo.title= params[:title]
  @photo.url= params[:url]


  if @photo.save
    redirect "/photos/#{@photo.id}"
  else
    status 401
    "could not find that photo"
  end

end


delete '/photos/:id' do
  @photo = Photo.where(id: params[:id]).first
  @photo.destroy
  if @photo
    redirect '/photos'
  else
    status 404
    "could not find that photo"
  end
end


#################### Migration create_photos.rb
class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :url
      t.timestamps
    end
  end
end


#################### Model photo.rb
class Photo < ActiveRecord::Base

  validates :title, presence: true
  validates :url, presence: true

  def url_not_from_fark
    if url.present? && url.include?('fark.com')
      errors.add(:url, "image cannot be from fark.com")
    end
  end
end


#################### view: photos/new.erb
<% @photo.errors.full_messages.each do |error|
  %>
<h3> <%=error %> </h3>
end
<% end %>


<form method= "POST" action="/photos/<%=@photo.id%> ">
  <input type="text" name="title" placeholder="title" value="<%= @photo.title %>"/>
  <input type="url" name="url" placeholder="url" value="<%= @photo.url" %> />
    <input type="submit" value="Create" />

#################### view: photos/show.erb
  <h1> <%= @photo.title %> </h1>

#################### view: photos/all.erb

<a href="/photos/new"> New Photo </a>
<ul>
<% @photos.each do |photo| %>
<li>
<h2> <%= photo.title %> </h2>
    <form action="/photos/<%= photo.id %> method="get">
  <input type"hidden name="_method"  value="edit" />
    <input type="submit" value="edit Photo" />
    <input type="submit" value="Delete Photo" />
  <form action="/photos/ <%= photo.id %> method="post">
  <input type"hidden name="_method"  value="delete" />
  <input type="submit" value="Delete Photo" />
  </form>
  <img src= "<% = @photo.url %>" />
       </li>
<% end %>


#################### view: photos/edit.erb
<% @photo.errors.full_messages.each do |error|
  %>
<h3> <%=error %> </h3>
end
<% end %>


    <form method= "POST" action="/photos/<%=@photo.id%> ">
      <input type="hidden" name="_method" value="put"/>
<input type="text" name="title" placeholder="title" value="<%= @photo.title %>"/>
<input type="url" name="url" placeholder="url" value="<%= @photo.url" %> />
    <input type="submit" value="save" />