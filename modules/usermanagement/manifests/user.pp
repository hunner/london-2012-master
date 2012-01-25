define usermanagement::user ($group = undef, $homedir = undef) {
  if $name == 'root' { fail("Disallowed to manage root's homedir") }

  if ! $homedir {
    $homedir_real = "/home/${name}"
  } else {
    $homedir_real = $homedir
  }

  if ! $group {
    $group_real = $name
  } else {
    $group_real = $group
  }

  user { $name:
    ensure  => present,
    homedir => $homedir_real,
    gid     => $group_real,
  }

  if ! defined(Group[$group_real]) {
    group { $group_real:
      ensure => present,
    }
  }

  file { $homedir_real:
    ensure => directory,
    owner  => $name,
    group  => $group_real,
  }
}
