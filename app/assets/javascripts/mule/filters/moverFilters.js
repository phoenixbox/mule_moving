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
        one: {low: 0, high: 13},
        two: {low: 14, high: 20},
        three: {low: 21, high: 33},
        four: {low: 34, high: 1000}
      };

      var matchingMovers = [];

      $.each(moverListItems, function (index, mover) {
        $.each(desiredPrices, function (price, val) {
          if (val === true) {
            if (mover['avg_price_per_hour'] >= priceMapping[price]['low'] && mover['avg_price_per_hour'] <= priceMapping[price]['high']) {
              matchingMovers.push(mover);
            }
          }
        });
      });

      return matchingMovers;
    }
  });
})();

