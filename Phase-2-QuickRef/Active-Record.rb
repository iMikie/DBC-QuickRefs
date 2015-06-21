#TERMINAL: Generate the databases via migration files
    rake generate:migration NAME='create_songs'               #will create db/migrate/20150613183845_create_songs.rb
    rake generate:migration NAME='create_performances'        #will create db/migrate/20150613183853_create_performances.rb
    rake generate:migration NAME='create_performances-songs'  #will create db/migrate/20150613183946_create_performances_songs.rb
    rake generate:migration NAME='create_users'               #will create db/migrate/20150613183953_create_users.rb

#TERMINAL: Generate the model files
    rake generate:model NAME='Song'              # will create app/models/song.rb
    rake generate:model NAME='Performance'       # will create app/models/performance.rb
    rake generate:model NAME='PerformancesSong'  # will create app/models/performances_song.rb, note: NOT: "performances_songs"
    rake generate:model NAME='User'              # will create app/models/userssong.rb



#Now fill out the ActiveRecord migrations
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

#will create db/migrate/20150613183946_create_performances_songs.rb
class CreatePerformancesSongs < ActiveRecord::Migration
  def change
    create_table :performances_songs do |t|
      t.integer  :performance_id
      t.integer  :song_id

      t.timestamps
    end
  end
end

#Sometimes you have to change your database:
class RemovePasswordHashLimit < ActiveRecord::Migration
  def change
    change_column(:users, :password_hash, :string)
  end
end

######################################################################
#Now add your model objects
class Song < ActiveRecord::Base
  validates :song_number, :presence => true
  validates :title, :presence => true

  has_many :performances_songs
  has_many :performances, :through =>  :performances_songs
end
