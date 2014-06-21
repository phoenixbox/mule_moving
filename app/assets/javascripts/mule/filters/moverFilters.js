(function () {
  var app = angular.module("mule");

  app.filter("serviceFilter", function ($filter) {
    return function (moverListItems, filters) {

      // exclude services set to false
      var requestedFilters = {};
      $.each(filters, function (key, val) {
        if (val === true) {
          requestedFilters[key] = true
        }
      });

      return $filter("filter")(moverListItems, requestedFilters);
    }
  });

  app.filter("priceFilter", function () {
    return function (moverListItems, desiredPrices) {
      var priceMapping = {
        one: {low: 0, high: 32},
        two: {low: 33, high: 40},
        three: {low: 41, high: 50},
        four: {low: 51, high: 1000}
      };

      var desiredPriceVals = Object.keys(desiredPrices).map(function (key) {
        return desiredPrices[key];
      });

      // returns all if no price filters provided
      if (desiredPriceVals.indexOf(true) === -1) {
        return moverListItems;
      }

      var matchingMovers = [];

      $.each(moverListItems, function (index, mover) {
        $.each(desiredPrices, function (price, val) {
          if (val === true) {
            if (
                (mover['avg_price_per_hour'] !== null) &&
                (mover['avg_price_per_hour'] >= priceMapping[price]['low']) &&
                (mover['avg_price_per_hour'] <= priceMapping[price]['high'])
                ) {
              matchingMovers.push(mover);
            }
          }
        });
      });

      return matchingMovers;
    }
  });
})();

