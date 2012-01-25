class users::devs {
  include users
  User <| group == 'dev' |>
}
