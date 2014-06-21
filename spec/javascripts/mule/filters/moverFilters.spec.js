describe("moverFilters", function () {
  beforeEach(function () {
    module("mule");
  });

  describe("serviceFilter", function () {
    it("filters collection based on desired services", inject(function (serviceFilterFilter) {
      var moverListItems = [
        {packaging: true, cleaning: true, shuttling: true},
        {packaging: false, cleaning: true, shuttling: false},
        {packaging: false, cleaning: false, shuttling: true}
      ];
      var desiredServices = {packaging: true, cleaning: false, shuttling: true};
      var matchingItems = [
        {packaging: true, cleaning: true, shuttling: true}
      ];

      expect(serviceFilterFilter(moverListItems, desiredServices)).toEqual(matchingItems);
    }));
  });

  describe("priceFilter", function () {
    it("filters collection based on desired prices", inject(function (priceFilterFilter) {
      var moverListItems = [
        {avg_price_per_hour: 3},
        {avg_price_per_hour: 15},
        {avg_price_per_hour: 16},
        {avg_price_per_hour: 21}
      ];
      var desiredPrices = {one: false, two: true};
      var matchingItems = [
        {avg_price_per_hour: 15},
        {avg_price_per_hour: 16}
      ];

      expect(priceFilterFilter(moverListItems, desiredPrices)).toEqual(matchingItems);
    }));

    it("returns none if none match", inject(function (priceFilterFilter) {
      var moverListItems = [
        {avg_price_per_hour: 3},
        {avg_price_per_hour: 1}
      ];
      var desiredPrices = {one: false, two: true};
      var matchingItems = [];

      expect(priceFilterFilter(moverListItems, desiredPrices)).toEqual(matchingItems);
    }));
  });
});