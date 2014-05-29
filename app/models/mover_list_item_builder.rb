class MoverListItemBuilder
  def build(mover, business, pricing, compliance, statistics)
    MoverListItem.new.tap do |mover_list_item|
      mover_list_item.id = mover.id
      mover_list_item.name = mover.name
      mover_list_item.description = mover.description

      if business
        mover_list_item.rating = business.rating
      end
      if compliance
        mover_list_item.general_liability_insurance = compliance.general_liability_insurance
      end
      if pricing
        mover_list_item.avg_price_per_hour = pricing.avg_price_per_hour
      end
      if statistics
        mover_list_item.years_in_business = statistics.years_in_business
        mover_list_item.employees = statistics.employees
      end
    end
  end
end