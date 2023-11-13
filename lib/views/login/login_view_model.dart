class LoginViewModel {
  bool rememberPassword = false;
  rememberPasswordChanged() {
    rememberPassword = !rememberPassword;
  }
}
