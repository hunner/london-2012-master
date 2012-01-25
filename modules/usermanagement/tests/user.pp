# Example of passing a group for a list of users
usermanagement::user { ['foo', 'hunner']:
  group => 'users',
}

# Example of locating a user in a different homedir
usermanagement::user { 'elvis':
  homedir => '/users/elvis',
}
