exampleApp = angular.module 'exampleApp', ['ExampleModel', 'navigationBar', 'ngTouch']

exampleApp.controller 'IndexCtrl', ($scope, ExampleRestangular) ->

  $scope.exampleViews = []

  $scope.open = (url, isModal) ->
    if isModal
      steroids.modal.show
        view: $scope.exampleViews[url]
        navigationBar: true
    else
      steroids.layers.push
        view: $scope.exampleViews[url]
        navigationBar: true

  $scope.showMenu = () ->
    steroids.drawers.show {
      edge: steroids.screen.edges.LEFT
    }

  ExampleRestangular.all('mpa_example').getList().then (examples) ->
    $scope.mpaExamples = examples;
    angular.forEach examples, (val, idx) ->
      @[val.url] = new steroids.views.WebView val.url
      @[val.url].preload()
    , $scope.exampleViews

  ExampleRestangular.all('device_example').getList().then (examples) ->
    $scope.deviceExamples = examples;
    angular.forEach examples, (val, idx) ->
      @[val.url] = new steroids.views.WebView val.url
      @[val.url].preload()
    , $scope.exampleViews

  #Native navigation
  steroids.view.navigationBar.show()
  steroids.view.setBackgroundColor "#FFFFFF"
