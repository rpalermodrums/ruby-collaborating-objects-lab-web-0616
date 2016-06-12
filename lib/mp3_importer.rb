require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.foreach(@path) do |file|
      @files << file unless file == '.' || file == '..'
    end
    @files
  end

  def import
    files.each do |file|
      each_cat = file.split(" - ")
      if Artist.all.none? { |artist| artist.name == each_cat[0] }
        new_song = Song.new_by_filename(file)
        new_song.artist = Artist.new(each_cat[0])
        Artist.all << new_song.artist
        Artist.all.last.songs << new_song

      else
        found = Artist.all.find {|artist| artist.name == each_cat[0]}
        found.songs << file.split(" - ")[1]
      end
    end
  end
end
