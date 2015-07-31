get '/' do

  @todos = Todo.all

  erb :index
end

post '/add_todo' do
  p params
  todo = Todo.new(todo_content: params[:todo_content])
  p todo
  if todo.save
    p 'in save'
    p todo
    erb :_todos, layout: false, locals: {todo: todo}
  else
    status 500
  end
end

get '/:todo_id' do
  todo = Todo.find(params[:todo_id])
  todo.update_attributes(completed: true)

  p todo
  {todo: todo.id}.to_json

end



#-----------
<div id="<%=todo.id%>" class="todo">
<h2><%= todo.todo_content %></h2>
  <ul>
    <li><a href="#" class="delete">Delete</a></li>
<% if todo.completed %>
    <% else %>
     <li><a href="#" class="complete">Complete</a></li>
     <% end %>
</ul>
</div>


    #---------------------JSON
    get '/' do
@todos = Todo.all
erb :index
end

post '/add_todo' do
  new_todo = Todo.new(todo_content: params[:content])

  if new_todo.save
    return {content: new_todo.todo_content, id: new_todo.id}.to_json
  else
    erb :index
  end
end

delete '/delete_todo' do
  todo = Todo.where(todo_content: params[:todo]).first
  todo.destroy()

  return {todo_name: todo.todo_content}.to_json
end

post '/complete_todo' do
  todo = Todo.where(todo_content: params[:todo]).first
  todo.completed = true
  todo.save

  return { todo_id: todo.id, todo_name: todo.todo_content, todo_status: todo.completed }.to_json
end
