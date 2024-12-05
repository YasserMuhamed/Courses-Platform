import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Auth/data/models/current_user/current_user.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authRepo) : super(ProfileInitial());
  final AuthRepo authRepo;

  Future<void> getUserProfile() async {
    emit(ProfileLoading());
    final response = await authRepo.getCurrentUser();
    response.fold(
      (message) => emit(ProfileFailure(message)),
      (user) => emit(ProfileSuccess(user)),
    );
  }
}
