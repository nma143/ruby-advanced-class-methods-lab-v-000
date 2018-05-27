class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.name = nil
    song.artist_name = nil
    self.all << song
    return song
  end

  def self.new_by_name(name, artist_name = nil)
    song = self.new
    song.name = name
    #song.artist_name = nil
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.artist_name = nil
    self.all << song
    return song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name==name}
  end

  def self.find_or_create_by_name(name)
    newsong =  self.find_by_name(name)
    if !newsong
      newsong = self.create_by_name(name)
    end
    newsong
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename) #"Taylor Swift - Blank Space.mp3"
    nameparts = filename.split(" - ")
    artist = nameparts[0]
    title = nameparts[1].slice! ".mp3"
    self.new_by_name(title, artist)
  end

  def self.create_from_filename(filename)

  end

  def self.destroy_all
    self.all = []
  end
end
