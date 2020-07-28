// Define the `phonecatApp` module
var test1App = angular.module('test1App', []);

// Define the `PhoneListController` controller on the `phonecatApp` module
test1App.controller('test1Controller', function test1Controller($scope) {
  $scope.phones = [
    {
      name: 'Nexus S',
      snippet: 'Fast just got faster with Nexus S.'
    }, {
      name: 'Motorola XOOM™ with Wi-Fi',
      snippet: 'The Next, Next Generation tablet.'
    }, {
      name: 'MOTOROLA XOOM™',
      snippet: 'The Next, Next Generation tablet.'
    }
  ];
});