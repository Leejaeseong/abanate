'use strict';

// Register `phoneDetail` component, along with its associated controller and template
angular.
    module( 'phoneDetail' ).
    component( 'phoneDetail', {
      template: 'TBD: Detail view for <span>{{$ctrl.phoneId}}</span>',
      controller : ['$routeParams',
        function phoneDetailController($routeParams){
          this.phoneId = $routeParams.phoneId;
        }
      ]      
    });