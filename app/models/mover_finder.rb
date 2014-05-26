class MoverFinder
  def all
    MoverRecord.all
  end

  def find_by_id(id)
    MoverRecord.find(id)
  end
end