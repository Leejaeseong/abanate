'use strict';

// Register `phoneList` component, along with its associated controller and template
angular.
    module( 'test5App' ).
    component( 'phoneList5', {   // This name is what AngularJS uses to match to the `<phone-list>` element.
        
      // To improve performance, use $templateRequest, $templateCache
      templateUrl: '../phone-list/phone-list.template.html',

      controller : ['$http',
        function phoneListController($http){
          var self = this;
          this.orderProp = 'age';

          $http.get('../data/phones.json').then( function( response ) {
            self.phones = response.data;

            //slice experiments
            //self.phones = response.data.slice(0, 5);
          });
        }
      ]      
    });