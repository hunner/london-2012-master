class users::ops {
  include users
  User <| group == 'ops' |>
}
