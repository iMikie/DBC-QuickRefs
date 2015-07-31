#TERMINAL: Generate the databases via migration files
    rake generate:migration NAME='create_songs'               #will create db/migrate/20150613183845_create_songs.rb
    rake generate:migration NAME='create_performances'        #will create db/migrate/20150613183853_create_performances.rb
    rake generate:migration NAME='create_performance-songs'  #will create db/migrate/20150613183946_create_performance_songs.rb
    rake generate:migration NAME='create_users'               #will create db/migrate/20150613183953_create_users.rb

#TERMINAL: Generate the model files Models are singular
    rake generate:model NAME='Song'              # will create app/models/song.rb
    rake generate:model NAME='Performance'       # will create app/models/performance.rb
    rake generate:model NAME='PerformanceSong'  # will create app/models/performance_song.rb,

    # model: singular-singular -- performance_song
    #db table name singular-plural.  -- performance_song

    rake generate:model NAME='User'              # will create app/models/userssong.rb



#Now fill out the ActiveRecord migrations, (table name is plural, lower snake case)
#Common data types
:boolean          :primary_key
:datetime         :string
:decimal          :text
:float            :time
:integer          :timestamp

#db/migrate/20150613183845_create_songs.rb
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :username, limit: 50
      t.string   :email, limit: 50
      t.string   :password_hash
      t.string   :phone_number, limit: 24

      t.timestamps
    end
  end
end

#db/migrate/20150613183853_create_performances.rb
class CreatePerformances < ActiveRecord::Migration
  def change
    create_table  :performances do |t|
      t.string    :title, limit: 50
      t.date      :date
      t.time      :performance_time
      t.time      :call_time
      t.string    :location

      t.timestamps

    end
  end
end

#will create db/migrate/20150613183946_create_performance_songs.rb
class CreatePerformanceSongs < ActiveRecord::Migration
  def change
    create_table :performance_songs do |t|
      t.integer  :performance_id
      t.integer  :song_id

      t.timestamps
    end
  end
end

#Table naming in Migrations: category_products.
# first name is singular.  Second is plural.  In lexical order.
#Model naming: category_product  : both are singular.  AR will pluralize the outer one and will look for: category_products for the table name