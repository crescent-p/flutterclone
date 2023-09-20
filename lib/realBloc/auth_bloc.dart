//authbloc
import 'package:bloc/bloc.dart';
import 'package:flutterclone/Bloc/auth_method.dart';
import 'package:flutterclone/Bloc/auth_user.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthMethod methods)
      : super(const AuthStateUninitialized(isLoading: true)) {
    on<AuthEventLogin>((event, emit) async {
      AuthUser? user = await methods.login(event.email, event.password);
      print(user);
      if (user == null) {
        emit(const AuthStateLoggedOut(isLoading: false));
      } else {
        emit(AuthStateLoggedIn(user: user, isLoading: false));
      }
    });
    on<AuthEventInitialize>((event, emit) {
      final user = methods.currentUser;
      if (user == null) {
        emit(const AuthStateLoggedOut(isLoading: false));
      } else {
        emit(AuthStateLoggedIn(user: user, isLoading: false));
      }
    });
  }
}
