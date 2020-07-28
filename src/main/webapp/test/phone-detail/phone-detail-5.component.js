'use strict';

// Register `phoneDetail` component, along with its associated controller and template
angular.
    module( 'phoneDetail5' ).
    component( 'phoneDetail5', {
    	templateUrl: '../phone-detail/phone-detail.template.html',
    	controller : ['$http', '$routeParams',
    					function phoneDetail5Controller($http, $routeParams){
    						var self = this;
    						
    						$http.get( '../data/'+ $routeParams.phoneId + '.json').then( function( response ) {
    							self.phone = response.data;
    						});
        				}
    				 ]      
    });