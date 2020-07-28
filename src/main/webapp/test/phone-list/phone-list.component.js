'use strict';

// Register `phoneList` component, along with its associated controller and template
angular.
    module( 'test2App' ).
    component( 'phoneList', {   // This name is what AngularJS uses to match to the `<phone-list>` element.
        
      // To improve performance, use $templateRequest, $templateCache
      templateUrl: '../phone-list/phone-list.template.html',

      controller: function phoneListController() {
        this.phones = [
          {
            name: 'Nexus S',
            snippet: 'Fast just got faster with Nexus S.',
            age: 1
          }, {
            name: 'Motorola XOOM™ with Wi-Fi',
            snippet: 'The Next, Next Generation tablet.',
            age: 2
          }, {
            name: 'MOTOROLA XOOM™',
            snippet: 'The Next, Next Generation tablet.',
            age: 3
          }
        ];

        this.orderProp = 'age';
      }
    });