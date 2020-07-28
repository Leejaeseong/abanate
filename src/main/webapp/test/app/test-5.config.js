'use strict';

angular.
	module( 'test5App' ).
		config(['$routeProvider',
			function config($routeProvider) {
				$routeProvider.
					when('/phones', {
						template: '<phone-list-5></phone-list-5>'
					}).
					when('/phones/:phoneId',{
						template: '<phone-detail-5></phone-detail-5>'
					}).
					otherwise('/phones');
			}
	])