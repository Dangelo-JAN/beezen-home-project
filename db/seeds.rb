roles = ['admin', 'user', 'visitor']

users = [['admin', 'admin lastname', 'admin@email.com', '123456'], ['user', 'user lastname', 'user@email.com', '123456'], ['user2', 'user2 lastname', 'user2@email.com', '123456'], ['user3', 'user3 lastname', 'user3@email.com', '123456']]

tasks = [['task 1', 'description 1'], ['task 2', 'description 2'], ['task 3', 'description 3'], ['task 4', 'description 4'], ['task 5', 'description 5']]

alerts = [['portal_opened', 'Portal opened', '', 'A portal was opened', '123.89.00.2'], ['portal_closed', 'Portal closed', '', 'A portal was closed', '123.89.00.2'],]

tags = ["version 2.3.9", "production"]

def create_roles(roles)
  puts 'Creating roles..'
  roles.each_with_index do |r, i|
    Role.create(name: r)
    roles = Role.all
    puts "Role #{roles[i].name} was created"
  end

  puts 'Roles created!'
end

def create_users(users)
  puts 'Creating users...'
  users.each_with_index do |u, i|
    role = Role.all.sample
    User.create(name: u[0], lastname: u[1], email: u[2], password: u[3], role_id: role.id)
    user = User.all
    puts "User #{user[i].name} was created"
  end
  
  puts 'Users created!'
end

def create_alerts(alerts)
  puts 'Creating alerts...'
  alerts.each_with_index do |a, i|
    Alert.create(type: a[0], name: a[1], tag: a[2], description: a[3], origin: a[4])
    alert = Alert.all
    puts "Alert #{alert[i].name} was created"
  end

  puts 'Alerts created!'
end

def create_tasks(tasks)
  puts 'Creating tasks...'
  tasks.each_with_index do |t, i|
    user = User.all.sample
    alert = Alert.all.sample
    Task.create(name: t[0], description: t[1], user_id: user.id, alert_id: alert.id)
    task = Task.all
    puts "Task #{task[i].name} was created"
  end
  
  puts 'Tasks created!'
end

def create_tags(tags)
  puts 'Creating tags...'
  tags.each_with_index do |t, i|
    Tag.create(name: t)
    tag = Tag.all
    puts "Tag #{tag[i].name} was created"
  end

  puts 'Tags created!'
end

create_roles(roles)
create_users(users)
create_alerts(alerts)
create_tasks(tasks)
create_tags(tags)
