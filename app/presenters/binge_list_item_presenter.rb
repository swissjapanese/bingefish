class BingeListItemPresenter
  def self.prepare list
    {
      show_id: list.show_id,
      binge: list.binge,
      updated: list.updated,
      watchlist: list.watchlist,
      guilty: list.guilty
    }
  end
end
