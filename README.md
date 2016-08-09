### Run cluster

```sh
docker-compose up -d node1 node2
```

### Connect to a cluster node
```sh
docker-compose run --rm console
```
and run:
```lua
require('console').connect('admin:password@node2:3301')
s = box.space.tester
s:select()
s:insert({4})
s:select()
s:upsert({5, 'from r1', 1}, {{'=', 2, 'from r2'}, {'=', 3, 2}})
```
where:

- `admin:password` - credentials
- `node2` - node name
- `3301` - default port
