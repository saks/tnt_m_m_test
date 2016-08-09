box.cfg { }

box.once('user_replicator', function()
    box.schema.user.create('replicator', {password = 'password'})
    box.schema.role.grant('replication','read,write','universe')
    box.schema.user.grant('replicator','execute','role','replication')
end)

box.once('schema', function()
  box.schema.user.grant('guest', 'read,write,execute', 'universe')

  local s = box.schema.space.create('tester')
  s:create_index('primary', {
    type = 'hash',
    parts = {1, 'NUM'}
  })

  local t = s:insert{1}
  t = s:insert{2, 'Music'}
  t = s:insert{3, 'Length', 93}
end)
