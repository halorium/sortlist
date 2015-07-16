(function(){
  'use strict';

  describe("AgencyCtrl", function() {
    var $controller, AgencyService, createController, scope;

    var emptyAgency = { name: '', description: '', tag_list: [  ], grade: '' };

    beforeEach(function() {
      module('app');

      // Provide will help us create fake implementations for our dependencies
      module(function($provide) {

        // Fake AgencyService Implementation returning a promise
        $provide.value('AgencyService', {
          list: function() {
            return {
              then: function(callback) {return callback([emptyAgency, emptyAgency]);}
            };
          },
          post: function() {
            return {
              then: function(callback) {return callback(emptyAgency);}
            };
          },
        });

        return null;
      });
    });

    beforeEach(function() {

      // When Angular Injects the AgencyService dependency,
      // it will use the implementation we provided above
      inject(function($controller, $rootScope, _AgencyService_) {
        scope = $rootScope.$new();
        AgencyService = _AgencyService_;

        createController = function(params) {
          return $controller("AgencyCtrl", {
            $scope: scope,
            $stateParams: params || {}
          });
        };
      });

      // Jasmine spy over the list service.
      // Since we provided a fake response already we can just call through.
      spyOn(AgencyService, 'list').and.callThrough();

      // Jasmine spy also allows to call Fake implementations via the callFake function
      // or we can return our own response via 'and.returnValue
      // Here we can override the response we previously defined and return a promise with a agency object
      spyOn(AgencyService, 'post').and.callFake(function() {
        return {
          then: function(callback) { return callback(emptyAgency); }
        };
      });

      createController();

    });

    describe('init', function() {
      it("should call the agency service to retrieve the agency list", function() {
        // Since we setup a spy we can now expect that spied function to have been called
        // or to have been called with certain parameters..etc
        expect(AgencyService.list).toHaveBeenCalled();
      });

      it('sets initial values, ', function() {
        expect(scope.agencies).toEqual([emptyAgency,emptyAgency]);
        expect(scope.nameFilter).toEqual('');
        expect(scope.tagsFilter).toEqual('');
        expect(scope.newAgency).toEqual(emptyAgency);
      });

    });

    describe('scope.submitForm', function() {
      it('submits form data to create a new agency', function() {
        scope.newAgency.name = 'New Agency';
        scope.newAgency.description = 'New Agency Description';
        scope.newAgency.tag_list = 'Tag One, Tag Two';
        scope.newAgency.grade = 'padawan';

        scope.submitForm();
        expect(AgencyService.post).toHaveBeenCalled();
        expect(scope.agencies).toEqual([emptyAgency,emptyAgency]);
      });
    });

  });

})();
