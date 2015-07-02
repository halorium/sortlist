(function(){
  'use strict';

  describe('app/agencies', function() {

    var $rootScope, $state, $injector, state = 'agencies';

    beforeEach(function() {

      module('app');

      inject(function(_$rootScope_, _$state_, _$injector_, $templateCache) {
        $rootScope = _$rootScope_;
        $state = _$state_;
        $injector = _$injector_;

        $templateCache.put('agencies.html', '');
      })
    });

    it('should respond to URL', function() {
      expect($state.href(state)).toEqual('/');
    });

  });

})();
