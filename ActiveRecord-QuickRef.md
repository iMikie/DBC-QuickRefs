Mike Farr = SF-Dragonflies-2015
mikefarr@mac.com
michaelmfarr@gmail.com

###ActiveRecord
ActiveRecord provides a Ruby interface to an SQL database.  You describe your data by subclassing certain ActiveRecord classes and then instead of writing SQL you can access the data using Ruby.  Ultimately this is very nice but there's a bunch of stuff to memorize.

```
class Order:
  belongs_to :customer  (singular) each employee row contains a manager id
  
  @customer = @order.customer
  @order.customer = @customer
  @customer = @order.build_customer(customer_number: 123,
                                  customer_name: "John Doe")
  @customer.save

  @customer = @order.create_customer(customer_number: 123,
                                   customer_name: "John Doe")
   You can use '.' notation to reference any property of the class as in @customer.name
   
  has_one: job_position  (singular) each row of job-position has an id to user
```

Has_many:

class Customer < ActiveRecord::Base
  has_many :orders
end
Each instance of the Customer model will have these methods:

```
orders(force_reload = false)
orders<<(object, ...)
orders.delete(object, ...)
orders.destroy(object, ...)
orders=(objects)
order_ids
order_ids=(ids)
orders.clear
orders.empty?
orders.size
orders.find(...)
orders.where(...)
orders.exists?(...)
orders.build(attributes = {}, ...)
orders.create(attributes = {})
orders.create!(attributes = {})
```

  Band has many musicians.  A musician has many bands.  You will need two type1 tables and a join or junction table.  Both the musician and bands tables will have has_many relationships and both will have a has_many , through relationship through the join table. the join table will belong to both.
  
  Many to many
  
class Musician < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  has_many :projects  #this means my id appears many times in the other table
  has_many :bands, through: :projects #this means my id appears in projects and in the same record is the id of a band.  this is how you do a many-to-many

end

has and belongs to:
Many-to-Many:
```
class Part < ActiveRecord::Base
  has_and_belongs_to_many :assemblies
end
```

```
assemblies(force_reload = false)
assemblies<<(object, ...)
assemblies.delete(object, ...)
assemblies.destroy(object, ...)
assemblies=(objects)
assembly_ids
assembly_ids=(ids)
assemblies.clear
assemblies.empty?
assemblies.size
assemblies.find(...)
assemblies.where(...)
assemblies.exists?(...)
assemblies.build(attributes = {}, ...)
assemblies.create(attributes = {})
assemblies.create!(attributes = {})
```


  
 Inside a migration, these three mean the same thing.  I prefer references because integer says nothing about the relationship and belongs_to is confusingly also used in the model. 
  t.integer
  t.belongs_to
  
  has_and_belongs_to is a many to many but forgoes a model for the join table even though you must create it.
  
  A picture is either of a person or a product.  The foreign key could be either table, so you need a type
  
  
  Self join:  an employee table where each employee can have a manager, and can have subordinates.  In this case manager has one to many (has_many) with employees, and a (blongs_to) with his manager.  I suspect these may actually create multiple tables.
  
class Employee < ActiveRecord::Base
  has_many :subordinates, class_name: "Employee",
                          foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee"
end

class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :manager, index: true
      t.timestamps null: false
    end
  end
end
