class MoverFinder
  def all
    Mover.all
  end

  def find_by_id(id)
    Mover.find(id)
  end
end