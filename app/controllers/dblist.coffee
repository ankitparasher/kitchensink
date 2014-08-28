dblistApp = angular.module 'dblistApp', ['ListModel', 'ngTouch']

dblistApp.controller 'IndexCtrl', ($scope, ListResource)->

  steroids.view.navigationBar.show "List from DB"

  ListResource.findAll().then (items) ->
    $scope.$apply ->
      $scope.items = items
