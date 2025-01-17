class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.names
    self.all.collect{|song| song.name}
  end
  
  

  def save
    self.class.all << self
  end
  
  def self.create
    new = self.new
    self.all << new
    new
  end
  
  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end
  
  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    self.all << new_song
    new_song
  end
  
  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    #self.names.include?(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end
  
  def self.alphabetical
   #alphabetical_names =  self.names.sort_by{|a, b| b <=> a}
   self.all.sort_by{|song| song.name}
   
  end
  
  def self.new_from_filename(filename)
    new_song = self.new
    song_data = filename.split(" - ")
    new_song.artist_name = song_data[0]
    new_song.name = song_data[1].split(".").first
    new_song
  end
  
  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end

end
