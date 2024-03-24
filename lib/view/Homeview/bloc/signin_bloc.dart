import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/view/Homeview/bloc/signin_events.dart';
import 'package:project/view/Homeview/bloc/signin_state.dart';

class SiginBloc extends Bloc<SiginEvent, SigninState> {
  SiginBloc() : super(SigininInitialState()) {
    on<SignInTextformFieldonchangedEvent>(onchanged);
    on<SignInButtonPressedEvent>(onsubmitted);
  }

  void onchanged(SignInTextformFieldonchangedEvent event, Emitter emit) {
    if (EmailValidator.validate(event.emailvalue) == false) {
      emit(SiginInErrorState('Please Enter Vaild Email'));
    } else if (event.passwordvalue == '' || event.passwordvalue.length < 8) {
      emit(SiginInErrorState('Please Enter Valid Password'));
    } else {
      emit(SigninValidState());
    }
  }

  void onsubmitted(SignInButtonPressedEvent event, Emitter emit) {
    emit(SignLoadedState);
  }
}
