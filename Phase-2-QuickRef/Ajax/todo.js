$(document).ready(function() {
    bindEvents();
});


function bindEvents() {
    // Bind functions which add, remove, and complete todos to the appropriate
    // elements
    $('#todo').on('click', '#create-todo', function(e){
        e.preventDefault();
        var action = $('#todo-form').attr('action');
        var method = $('#todo-form').attr('method');
        var item = $('.todo').val();
        console.log('button clicked');
        var request = $.ajax({
            url: action,
            type: method,
            data: {content: item},
            dataType: 'JSON'
        });
        request.done(function(response){
            console.log('in done');
            console.log(response);
            var finalContent = buildTodo(response['content']);
            $('.todo_list').append(finalContent);
            $('.todo').val('');
        });
        request.fail(function(){
            console.log('in fail');
            alert('FAIL');
        });
        console.log('all done');
    });

}

function buildTodo(todoName) {
    // gets todoTemplate stored in DOM.
    var todoTemplate = $.trim($('#todo_template').html());
    // Creates an jQueryDOMElement from the todoTemplate.
    var $todo = $(todoTemplate);
    // Modifies it's text to use the passed in todoName.
    $todo.find('h2').text(todoName);
    // Returns the jQueryDOMElement to be used elsewhere.
    return $todo;
}

//Create functions to add, remove and complete todos



//From the controller

get '/' do
    # Look in app/views/index.erb
erb :index
end

post '/add_todo' do
    p "in the controller"
@todo = Todo.new(todo_content: params[:content])
if @todo.save
{content: @todo.todo_content}.to_json
end
end