abstract class SiginEvent {}

class SignInTextformFieldonchangedEvent extends SiginEvent {
  final String emailvalue;
  final String passwordvalue;

  SignInTextformFieldonchangedEvent(this.emailvalue, this.passwordvalue);
}

class SignInButtonPressedEvent extends SiginEvent {
  final String email;
  final String password;

  SignInButtonPressedEvent(this.email, this.password);
}
