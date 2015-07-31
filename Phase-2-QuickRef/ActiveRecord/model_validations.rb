class Event < ActiveRecord::Base
  validates :organizer_name, presence: true
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :date, presence: true
  validate :date_is_future

  def date_is_future()
    return if date.nil?
    future = date >= Date.today
    if !future
      errors.add(:date, "The date entered is in the past.")
    end
  end

  def valid_email
    valid_stuff = (organizer_email =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
    if !valid_stuff
      errors.add(:organizer_email, "you appear to have let a cat enter your email address.")
    end
  end

end
=begin
Prevent Events from being saved when:
a. The events date is empty, in the past, or is not valid. √
bi. The events title is already taken √
bii. or empty. √
c. The event organizers name is empty.   √
d. The event organizers email address is invalid.
=end

#---------event_new.erb
<%= erb( :error_messages, locals: {new_event: @new_event} )%>

<%= erb( :event_form, locals: {new_event: @new_event} )%>

#Error messages.erb -- this goes into page after post route
<%if new_event.errors.any? %>
  <ul>
    <% new_event.errors.each do |error| %>
      <% dairy_products =  new_event.errors[error][0]%>
    <%= erb( :error_message, locals: {error: error, reason: dairy_products} )%>
    <% end %>
  </ul>
<% end %>

#error_message.erb
<li>
  <h3><%= error %></h3>
  <%= reason %>
</li>
