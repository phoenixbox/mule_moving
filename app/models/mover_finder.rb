class MoverFinder
  def initialize(builder = MoverBuilder.new)
    @builder = builder
  end

  def all
    records = record_class.all
    records.map { |record| @builder.build(record) }
  end

  def find_by_id(id)
    record = record_class.find(id)
    @builder.build(record)
  end

  private

  def record_class
    MoverRecord
  end
end