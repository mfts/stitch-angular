app.factory 'Remember', (Parse) ->
  class Remember extends Parse.Model
    @configure "Remember", "oauth", "folder_name"
