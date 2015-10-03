angular.module("app.templates", []).run(["$templateCache", function($templateCache) {$templateCache.put("home.html","<h1 class=\"text-center title-text\">Stitch</h1><h2 class=\"dropbox-blue text-center\">Organize and Manage Professional Presentations</h2><div class=\"row\"><div class=\"col-xs-10 col-xs-offset-1 text-center\"><button ng-click=\"dropboxLogin()\" class=\"btn btn-default btn-login\"><span class=\"fa fa-dropbox\"></span> Login with Dropbox</button></div></div>");
$templateCache.put("presentation.html","<div class=\"text-center\"><h1>Hello {{user.name}} <br> <small>{{user.email}}</small></h1><br><br><h1>{{ accessToken }}</h1><div class=\"col-xs-4 col-xs-offset-4\"><form id=\"pre-presentation\" role=\"form\" name=\"new-event\"><input type=\"text\" placeholder=\"Name of Event\" ng-model=\"newEvent.name\" class=\"form-control\"><br><button ng-click=\"createEvent()\" class=\"btn btn-default\">Create event</button><br><br></form></div><div class=\"col-xs-6 col-xs-offset-3\"><table class=\"table table-hover stitch-row\"><tr ng-repeat=\"event in user.events\" class=\"animation\"><td>{{event.name}}</td><td>{{event.date}}</td><td class=\"stitch-now\"><a class=\"stitch-link\"><span class=\"fa fa-briefcase\"></span></a></td></tr></table></div></div>");
$templateCache.put("task.html","<h1>Todo List</h1>");}]);