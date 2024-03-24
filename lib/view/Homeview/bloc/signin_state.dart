abstract class SigninState {}

class SigininInitialState extends SigninState {}

class SigninValidState extends SigninState {}

class SiginInErrorState extends SigninState {
  final String errorMessage;
  SiginInErrorState(this.errorMessage);
}

class SignLoadedState extends SigninState {}
