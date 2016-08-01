class ActorPresenter
  def self.prepare actor
    {
      id: actor.id,
      name: actor.name,
      role: actor.role
    }
  end
end
