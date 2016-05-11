class ShowImporter

  def self.import_tsv(file_path)
    first = true
    i = 0
    File.foreach(file_path) do |line|
      if first
        first = false
        next
      end

      show = line.strip.scrub.split "\t"
      show_params = 
        {
          imdb_id: show[1],
          title: show[2],
          year: show[3],
          rating: show[4],
          runtime: show[5],
          genre: show[6],
          release: show[7],
          season: show[8],
          episode: show[9],
          series_id: show[10],
          director: show[11],
          writer: show[12],
          cast: show[13],
          metacritic: show[14],
          imdb_rating: show[15],
          imdb_votes: show[16],
          poster: show[17],
          plot: show[18],
          full_plot: show[19],
          language: show[20],
          country: show[21],
          awards: show[22],
          last_updated: show[23]
        }

      show = Show.find_by imdb_id: show[1]
      if show.present?
        show.update_attributes show_params
      else
        Show.create show_params
      end

      i = i + 1
      puts "#{i} records imported" if i % 10_000 == 0
    end
  end
end