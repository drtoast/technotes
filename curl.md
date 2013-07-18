# POST

    curl
      -v, --verbose
      --cookie "foo=bar"
      -H, --header "Content-Type: application/json"
      --data '{ "data": { "x":"1", "y": "2", "op": "+" }}'
      'http://localhost:3000/api/v1/projects/19/tasks.json?api_key=foo'
