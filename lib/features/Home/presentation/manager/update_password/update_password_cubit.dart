import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Home/data/models/update_password_request.dart';
import 'package:courses_platform/features/Home/data/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit(this.homeRepo) : super(UpdatePasswordInitial());
  final HomeRepo homeRepo;

  Future<void> updatePassword(UpdatePasswordRequest request) async {
    emit(UpdatePasswordLoading());
    final response = await homeRepo.updatePassword(request);
    response.fold(
      (failure) => emit(UpdatePasswordFailure(failure.error)),
      (message) => emit(UpdatePasswordSuccess(message)),
    );
  }
}
