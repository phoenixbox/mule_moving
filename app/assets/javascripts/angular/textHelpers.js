(function () {
  var textHelpers = angular.module("textHelpers", []);

  textHelpers.filter('insuranceFormat', function () {
    return function (generalLiabilityInsurance) {
      if (generalLiabilityInsurance === true) {
        return "Insured";
      } else if (generalLiabilityInsurance === false) {
        return "Not Insured";
      } else {
        return "Not Verified";
      }
    }
  });

  textHelpers.filter('yearsOperatingFormat', function () {
    return function (yearsInBusiness) {
      if (yearsInBusiness === null) {
        return "Not Verified"
      } else {
        return "Operating " + yearsInBusiness + " Years";
      }
    }
  });

  textHelpers.filter('pricePerHourFormat', function () {
    return function (avgPricePerHour) {
      if (avgPricePerHour === null) {
        return "Not Verified"
      } else {
        return "$" + avgPricePerHour + " avg per hour";
      }
    }
  });

  textHelpers.filter("emptyToEnd", function () {
    return function (array, key) {
      if (!angular.isArray(array)) return;
      var present = array.filter(function (item) {
        return item[key];
      });
      var empty = array.filter(function (item) {
        return !item[key]
      });
      return present.concat(empty);
    };
  });
})();