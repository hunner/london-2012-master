class one {
  $packages = ['a','b']
}

class two {
  include one
  $two::more_packages = [$one::packages, 'c']
}
