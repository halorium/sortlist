(function(){
  'use strict';

  describe('tagsFilter', function() {

    var tagsFilter;

    var agencyOneX   = { name: 'One', description: '', tag_list: [ 'x','one' ], grade: '' };
    var agencyTwoXY  = { name: 'Two', description: '', tag_list: [ 'x','y','two' ], grade: '' };
    var agencyThreeY = { name: 'Three', description: '', tag_list: [ 'y','three' ], grade: '' };
    var items        = [ agencyOneX, agencyTwoXY, agencyThreeY ];

    beforeEach(module('app'));

    beforeEach(inject(function(_tagsFilterFilter_) {
      tagsFilter = _tagsFilterFilter_;
    }));

    describe("when tags = 'x'", function(){
      it("returns a collection of agencies with tag 'x'", function() {
        var tags = 'x';
        var results = tagsFilter(items, tags);
        expect(results).toEqual([agencyOneX, agencyTwoXY]);
      });
    });

    describe("when tags = 'y'", function(){
      it("returns a collection of agencies with tag 'y'", function() {
        var tags = 'y';
        var results = tagsFilter(items, tags);
        expect(results).toEqual([ agencyTwoXY, agencyThreeY ]);
      });
    });

    describe("when tags = 'x, y'", function(){
      it("returns a collection of agencies with tags 'x' and 'y'", function() {
        var tags = 'x, y';
        var results = tagsFilter(items, tags);
        expect(results).toEqual([ agencyTwoXY ]);
      });
    });

  });

})();
