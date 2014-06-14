module ObjectCreationMethods
  def new_mover(overrides = {})
    defaults = { name: "My Little Mover #{counter}", description: "I am the best mover." }
    MoverRecord.new { |record| apply(record, defaults, overrides) }
  end

  def new_mover_yelp(overrides = {})
    defaults = {}
    MoverYelpRecord.new { |record| apply(record, defaults, overrides) }
  end

  def new_yelp_business(overrides = {})
    defaults = {}
    YelpBusiness.new.tap { |business| apply(business, defaults, overrides) }
  end

  def new_mover_pricing(overrides = {})
    defaults = {}
    MoverPricingRecord.new { |record| apply(record, defaults, overrides) }
  end

  def new_mover_compliance(overrides = {})
    defaults = {}
    MoverComplianceRecord.new { |record| apply(record, defaults, overrides) }
  end

  def new_mover_statistics(overrides = {})
    defaults = {}
    MoverStatisticsRecord.new { |record| apply(record, defaults, overrides) }
  end

  def new_mover_address(overrides = {})
    defaults = {}
    MoverAddressRecord.new { |record| apply(record, defaults, overrides) }
  end

  def new_mover_licenses(overrides = {})
    defaults = {}
    MoverLicensesRecord.new { |record| apply(record, defaults, overrides) }
  end

  def new_mover_opening_hour(overrides = {})
    defaults = {}
    MoverOpeningHourRecord.new { |record| apply(record, defaults, overrides) }
  end

  def new_mover_services(overrides = {})
    defaults = {}
    MoverServicesRecord.new { |record| apply(record, defaults, overrides) }
  end

  def new_mover_hero(overrides = {})
    defaults = {}
    MoverHeroRecord.new { |record| apply(record, defaults, overrides) }
  end

  private

  def method_missing(method, *args, &block)
    new_method = method.to_s.gsub(/^create_/, "new_")
    if method.to_s != new_method && self.respond_to?(new_method)
      send(new_method, *args).tap(&:save!)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?("create_") || super
  end

  def counter
    @counter ||= 0
    @counter += 1
  end

  def apply(object, defaults, overrides)
    options = defaults.merge(overrides)
    options.each do |method, value_or_proc|
      object.send("#{method}=", value_or_proc.is_a?(Proc) ? value_or_proc.call : value_or_proc)
    end
  end
end