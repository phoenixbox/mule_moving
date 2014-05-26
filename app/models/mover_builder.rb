class MoverBuilder
  def build(record)
    MoverEntity.new.tap do |entity|
      entity.id = record.id
      entity.name = record.name
      entity.description = record.description
    end
  end
end