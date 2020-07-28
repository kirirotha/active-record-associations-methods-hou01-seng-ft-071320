class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if an Drake is *not found*
    x = Artist.all.map do |a|
        a.name
    end
    if x.exclude?("Drake")
      drake = self.create_artist(name: "Drake")
    end

    self.artist = Artist.all.where(name: "Drake")

  end
end
