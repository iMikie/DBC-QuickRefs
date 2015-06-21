#TERMINAL: Generate the model files
rake generate:model NAME='Song'              # will create app/models/song.rb
rake generate:model NAME='Performance'       # will create app/models/performance.rb
rake generate:model NAME='PerformancesSong'  # will create app/models/performances_song.rb, note: NOT: "performances_songs"
rake generate:model NAME='User'              # will create app/models/user.rb


######################################################################
#Now add your model objects

# app/models/song.rb
class Song < ActiveRecord::Base
  validates :song_number, :presence => true
  validates :title, :presence => true

  has_many :performances_songs
  has_many :performances, :through =>  :performances_songs
end


# app/models/performance.rb
class Performance < ActiveRecord::Base
  validates :title, :presence => true
  validates :date, :presence => true

  has_many :performances_songs
  has_many :songs, :through =>  :performances_songs
end


# app/models/user.rb
class User < ActiveRecord::Base
  include BCrypt

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :phone_number, :presence => true
  validates :password, :presence => true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

# app/models/performances_song.rb, note: NOT: "performances_songs"
class PerformancesSong < ActiveRecord::Base
  validates :performance_id, :presence => true
  validates :song_id, :presence => true

  belongs_to :performance
  belongs_to :song

end


