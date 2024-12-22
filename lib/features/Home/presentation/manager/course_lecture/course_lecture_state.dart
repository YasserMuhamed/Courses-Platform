part of 'course_lecture_cubit.dart';

sealed class CourseLectureState extends Equatable {
  const CourseLectureState();

  @override
  List<Object> get props => [];
}

final class CourseLectureInitial extends CourseLectureState {}

final class CourseLectureLoading extends CourseLectureState {}

final class CourseLectureSuccess extends CourseLectureState {
  final CourseLecture courseLecture;

  const CourseLectureSuccess(this.courseLecture);

  @override
  List<Object> get props => [courseLecture];
}

final class CourseLectureFailure extends CourseLectureState {
  final String message;

  const CourseLectureFailure(this.message);

  @override
  List<Object> get props => [message];
}
