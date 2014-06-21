describe("textHelpers", function () {
  beforeEach(function () {
    module("textHelpers");
  });

  describe("insuranceFormatFilter", function () {
    it("returns insured when true", inject(function (insuranceFormatFilter) {
      expect(insuranceFormatFilter(true)).toEqual("Insured");
    }));

    it("returns not insured when false", inject(function (insuranceFormatFilter) {
      expect(insuranceFormatFilter(true)).toEqual("Insured");
    }));

    it("returns not verified when not true/false", inject(function (insuranceFormatFilter) {
      expect(insuranceFormatFilter(null)).toEqual("Not Verified");
    }));
  });

  describe("yearsOperatingFormatFilter", function () {
    it("returns formatted text when given not null", inject(function (yearsOperatingFormatFilter) {
      expect(yearsOperatingFormatFilter(12)).toEqual("Operating 12 Years");
    }));

    it("returns not verified when null", inject(function (yearsOperatingFormatFilter) {
      expect(yearsOperatingFormatFilter(null)).toEqual("Not Verified");
    }));
  });

  describe("pricePerHourFormatFilter", function () {
    it("returns formatted text when given not null", inject(function (pricePerHourFormatFilter) {
      expect(pricePerHourFormatFilter(12)).toEqual("$12 avg per hour");
    }));

    it("returns not verified when null", inject(function (pricePerHourFormatFilter) {
      expect(pricePerHourFormatFilter(null)).toEqual("Not Verified");
    }));
  });

  describe("emptyToEndFilter", function () {
    it("pushes empty items in a collection to the end", inject(function (emptyToEndFilter) {
      var collection = [
        {name: "Raphael"},
        {name: ""},
        {name: "Blair"},
        {name: "Shane"}
      ];

      var expected = [
        {name: "Raphael"},
        {name: "Blair"},
        {name: "Shane"},
        {name: ""}
      ];

      expect(emptyToEndFilter(collection, "name")).toEqual(expected);
    }));
  });
});