client = Client.find(10)
client = Client.find([1, 10])
client = Client.take(2)
client = Client.first(3)
client = Client.lasta(3)


Client.find_by first_name: 'Lifo'
Client.where(first_name: 'Lifo').take

Client.find_by! first_name: 'does not exist'
# => ActiveRecord::RecordNotFound


# This is very inefficient when the users table has thousands of rows.
User.all.each do |user|
  NewsMailer.weekly(user).deliver_now
end

User.find_each do |user|
  NewsMailer.weekly(user).deliver_now
end

User.where(weekly_subscriber: true).find_each do |user|
  NewsMailer.weekly(user).deliver_now
end

User.find_each(batch_size: 5000) do |user|
  NewsMailer.weekly(user).deliver_now
end

User.find_each(start: 2000, batch_size: 5000) do |user|
  NewsMailer.weekly(user).deliver_now
end

# conditions
Client.where("orders_count = ?", params[:orders]) #where count = params[]

Client.where("orders_count = ? AND locked = ?", params[:orders], false)

Client.where("created_at >= :start_date AND created_at <= :end_date",
             {start_date: params[:start_date], end_date: params[:end_date]})

Client.where(locked: true)
Client.where('locked' => true)


Article.where(author: author)
Author.joins(:articles).where(articles: { author: author })

#ranges
Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)

Client.where(orders_count: [1,3,5])

#not
Article.where.not(author: author)

#ordering
Client.order(:created_at)
Client.order(created_at: :desc)
Client.order("orders_count ASC").order("created_at DESC")
# SELECT * FROM clients ORDER BY orders_count ASC, created_at DESC

#subsets of fields
Client.select("viewable_by, locked")
Client.select(:name).distinct
This would generate SQL like:

                            SELECT DISTINCT name FROM clients

Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")
    SELECT date(created_at) as ordered_date, sum(price) as total_price
    FROM orders
    GROUP BY date(created_at)

Order.group(:status).count   # => { 'awaiting_approval' => 7, 'paid' => 12 }

class Article < ActiveRecord::Base
    has_many :comments, -> { order('posted_at DESC') }
end

Article.find(10).comments.reorder('name')

#find or Create
Client.find_or_create_by(first_name: 'Andy')

nick = Client.find_or_initialize_by(first_name: 'Nick')

Client.find_by_sql("SELECT * FROM clients
  INNER JOIN orders ON clients.id = orders.client_id
  ORDER BY clients.created_at desc")
      # => [ {"first_name"=>"Rafael", "created_at"=>"2012-11-10 23:23:45.281189"},
             {"first_name"=>"Eileen", "created_at"=>"2013-12-09 11:22:35.221282"}]


Client.connection.select_all("SELECT first_name, created_at FROM clients WHERE id = '1'")


#pluck
Client.where(active: true).pluck(:id)
      # SELECT id FROM clients WHERE active = 1
      # => [1, 2, 3]

Client.distinct.pluck(:role)
      # SELECT DISTINCT role FROM clients
      # => ['admin', 'member', 'guest']

Client.pluck(:id, :name)
      # SELECT clients.id, clients.name FROM clients
      # => [[1, 'David'], [2, 'Jeremy'], [3, 'Jose']]


#Exists?
Client.exists?(1)
Client.exists?(id: [1,2,3])
# or
Client.exists?(name: ['John', 'Sergei'])

Client.where(first_name: 'Ryan').exists?

Article.where(published: true).any?
Article.where(published: true).many?

#Calculations
Client.includes("orders").where(first_name: 'Ryan', orders: { status: 'received' }).count

Client.minimum("age")