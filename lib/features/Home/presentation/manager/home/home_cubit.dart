import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Home/data/models/sub_courses/sub_courses.dart';
import 'package:courses_platform/features/Home/data/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  Future<void> getSubCourses() async {
    emit(HomeLoading());
    final response = await homeRepo.getSubCourses();
    response.fold(
      (failure) => emit(HomeFailure(failure.error)),
      (subCourses) => emit(HomeSuccess(subCourses)),
    );
  }
}
