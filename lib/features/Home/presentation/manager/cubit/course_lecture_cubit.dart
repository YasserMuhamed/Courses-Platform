import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Home/data/models/course_lecture/course_lecture.dart';
import 'package:courses_platform/features/Home/data/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'course_lecture_state.dart';

class CourseLectureCubit extends Cubit<CourseLectureState> {
  CourseLectureCubit(this.homeRepo) : super(CourseLectureInitial());
  final HomeRepo homeRepo;

  Future<void> getCourseLectures(int id) async {
    emit(CourseLectureLoading());
    final response = await homeRepo.getCourseLectures(id);
    response.fold(
      (l) => emit(CourseLectureFailure(l.error)),
      (r) => emit(CourseLectureSuccess(r)),
    );
  }
}
