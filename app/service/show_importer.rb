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
          director: show[8],
          writer: show[9],
          cast: show[10],
          metacritic: show[11],
          imdb_rating: show[12],
          imdb_votes: show[13],
          poster: show[14],
          plot: show[15],
          full_plot: show[16],
          language: show[17],
          country: show[18],
          awards: show[19],
          last_updated: show[20],
          show_type: show[21]
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