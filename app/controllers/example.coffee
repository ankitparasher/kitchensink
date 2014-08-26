exampleApp = angular.module 'exampleApp', ['ExampleModel', 'navigationBar', 'ngTouch']

exampleApp.controller 'IndexCtrl', ($scope, ExampleRestangular) ->

  $scope.exampleViews = []

  $scope.open = (url) ->
    steroids.layers.push $scope.exampleViews[url]

  $scope.showMenu = () ->
    steroids.drawers.show {
      edge: steroids.screen.edges.LEFT
    }

  ExampleRestangular.all('example').getList().then (examples) ->
    $scope.examples = examples;
    angular.forEach examples, (val, idx) ->
      @[val.url] = new steroids.views.WebView val.url
      @[val.url].preload()
    , $scope.exampleViews

  #Native navigation
  steroids.view.navigationBar.show()
  steroids.view.setBackgroundColor "#FFFFFF"
