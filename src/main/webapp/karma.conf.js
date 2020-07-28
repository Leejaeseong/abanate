//jshint strict: false
module.exports = function(config) {
  config.set({

    // base path, that will be used to resolve files and exclude    
    basePath: '.',
    // basePath: './app',

    // frameworks to use
    frameworks: ['jasmine'],

    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,

    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera (has to be installed with `npm install karma-opera-launcher`)
    // - Safari (only Mac; has to be installed with `npm install karma-safari-launcher`)
    // - PhantomJS
    // - IE (only Windows; has to be installed with `npm install karma-ie-launcher`)    
    browsers: ['Chrome'],
    //browsers: ['Chrome', 'Firefox'],

    // list of files / patterns to load in the browser
    files: [
      // Modules
      './node_modules/angular/angular.js',
      './node_modules/angular-route/angular-route.js',
      './node_modules/angular-mocks/angular-mocks.js',

      // App
      //'**/*.module.js',
      
      'test/**/*.module.js',
      'test/**/*.component.js',      
      
      'test/**/*.controller.js',

      // Test
      //'*!(.module|.spec).js',
      //'!(lib)/**/*!(.module|.spec).js',
      'test/**/*.spec.js'
    ],

    plugins: [
      'karma-chrome-launcher',
      //'karma-firefox-launcher',
      'karma-jasmine'
    ]

  });
};
