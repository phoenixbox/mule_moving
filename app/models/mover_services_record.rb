class MoverServicesRecord < ActiveRecord::Base
  self.table_name = :mover_services

  SERVICE_LIST = [
    :appliances_install,
    :appliances_uninstall,
    :auto_transport,
    :bulky_items,
    :cleaning,
    :crating,
    :electronics_packaging,
    :extra_stops,
    :furniture_assembly,
    :furniture_disassembly,
    :furniture_wrapping,
    :gun_safe,
    :packaging,
    :personal_truck_loading,
    :pianos,
    :shuttling,
    :storage
  ]
end
