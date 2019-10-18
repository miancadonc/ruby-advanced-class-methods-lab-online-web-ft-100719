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
    self.all.sort_by{|a, b| b.name <=> a.name}
  end
  
  

end
