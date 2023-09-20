import 'package:flutterclone/Bloc/auth_user.dart';

abstract class AuthState {
  final bool isLoading;
  const AuthState({required this.isLoading});
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;

  const AuthStateLoggedIn({
    required this.user,
    required bool isLoading,
  }) : super(isLoading: isLoading);
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading() : super(isLoading: true);
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut({required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized({required bool isLoading})
      : super(isLoading: true);
}
