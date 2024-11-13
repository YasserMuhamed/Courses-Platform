import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Auth/data/models/login_request.dart';
import 'package:courses_platform/features/Auth/data/models/login_response/login_response.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> loginUsers(LoginRequest loginRequest) async {
    emit(AuthLoginLoading());
    final response = await authRepo.loginUsers(loginRequest);
    response.fold(
      (l) => emit(AuthLoginFailure(l.error)),
      (r) => emit(AuthLoginSuccess(loginResponse: r)),
    );
  }
}
