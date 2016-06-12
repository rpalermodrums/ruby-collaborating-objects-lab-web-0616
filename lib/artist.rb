require "pry"

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.all=(all)
    @all = all
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self unless @@all.any? { |artist| artist.name == self.name }
  end

  def self.find_or_create_by_name(person)
    if self.all.any? { |artist| artist.name == person }
      found = self.all.find { |artist| artist == person }
    else
      new_artist = Artist.new(person)
      self.all << new_artist
    end
    self.all = self.all.uniq
    found || new_artist
  end

  def print_songs
    puts @songs.map { |song| song.name  }
  end
end
