require "pry"

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist=(artist)
    @artist = artist
  end

  def self.new_by_filename(filename)
    each_cat = filename.split(" - ")
    song = self.new(each_cat[1])
    song.artist = Artist.all.find { |artist| artist.name == each_cat[0]} || Artist.new(each_cat[0])
    song
  end
end
