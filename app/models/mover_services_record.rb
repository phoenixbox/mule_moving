class MoverServicesRecord < ActiveRecord::Base
  self.table_name = :mover_services

  SERVICES = [
    {
      category: "Pickup",
      items: [
        { id: "packaging", name: "Packaging" },
        { id: "crating", name: "Crating" },
        { id: "furniture_wrapping", name: "Furniture Wrapping" },
        { id: "furniture_disassembly", name: "Furniture Disassembly" },
        { id: "personal_truck_loading", name: "Personal Truck Loading" },
        { id: "appliances_uninstall", name: "Appliances Uninstall" }
      ]
    },
    {
      category: "Transport",
      items: [
        { id: "shuttling", name: "Shuttling" },
        { id: "storage", name: "Storage" },
        { id: "extra_stops", name: "Extra Stops" }
      ]
    },
    {
      category: "Dropoff",
      items: [
        { id: "furniture_assembly", name: "Furniture Assembly" },
        { id: "appliances_install", name: "Appliances Install" }
      ]
    },
    {
      category: "Special",
      items: [
        { id: "electronics_packaging", name: "Electronics Packaging" },
        { id: "auto_transport", name: "Auto Transport" },
        { id: "bulky_items", name: "Bulky Items" },
        { id: "pianos", name: "Pianos" },
        { id: "gun_safe", name: "Gun Safe" },
        { id: "cleaning", name: "Cleaning" }
      ]
    }
  ]
end
