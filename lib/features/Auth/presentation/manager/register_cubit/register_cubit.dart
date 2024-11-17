import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Auth/data/models/register_request.dart';
import 'package:courses_platform/features/Auth/data/models/register_response/register_response.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  Future<void> registerUsers(RegisterRequest registerRequest) async {
    emit(AuthRegisterLoading());
    final response = await authRepo.registerUsers(registerRequest);
    response.fold(
      (l) => emit(AuthRegisterFailure(l.error)),
      (r) => emit(AuthRegisterSuccess(r)),
    );
  }
}
