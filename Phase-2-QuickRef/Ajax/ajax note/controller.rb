get '/users/:user_id/notes/new' do


  erb :_create_note, locals: {}, layout: false
end

post '/users/:user_id/notes' do
  @note = Note.new(title: params[:title], body: params[:body], user_id: params[:user_id])
  p request
  if @note.save
    erb(:_note_post, layout: false, locals: {note: @note})
    # redirect "/users/#{current_user.id}/notes"
  else
    @errors = "Make sure to type in both fields!"
    redirect "/users/#{current_user.id}/notes/new"
  end
end