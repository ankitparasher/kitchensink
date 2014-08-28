commentsApp = angular.module 'commentsApp', ['CommentsModel', 'ngTouch']

commentsApp.controller 'IndexCtrl', ($scope, $timeout, $interval, Comments, user)->

  steroids.view.navigationBar.show "Secret Comments"

  # Generate a user
  $scope.currentUser = user.generateUser()
