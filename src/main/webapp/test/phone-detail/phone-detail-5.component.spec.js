'use strict';

describe('phoneDetail5', function() {

  // Load the module that contains the `phoneDetail` component before each test
  beforeEach(module('phoneDetail5'));

  // Test the controller
  describe('phoneDetail5Controller', function() {
    var $httpBackend, ctrl;

    beforeEach(inject(function($componentController, _$httpBackend_, $routeParams) {
    	$httpBackend = _$httpBackend_;
    	$httpBackend.expectGET('../data/xyz.json').respond({name: 'phone xyz'});

    	$routeParams.phoneId = 'xyz';
      
    	ctrl = $componentController('phoneDetail5');
    }));

    it('should fetch the phone details', function() {    	    	
    	expect(ctrl.phone).toBeUndefined();

	  	$httpBackend.flush();
	  	expect(ctrl.phone).toEqual({name: 'phone xyz'});
    });

  });

});