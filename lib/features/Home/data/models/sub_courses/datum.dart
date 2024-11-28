import 'package:equatable/equatable.dart';

import 'course.dart';

class Datum extends Equatable {
  final int? id;
  final int? courseId;
  final int? userId;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final Course? course;

  const Datum({
    this.id,
    this.courseId,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.course,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        courseId: json['course_id'] as int?,
        userId: json['user_id'] as int?,
        status: json['status'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        course: json['course'] == null
            ? null
            : Course.fromJson(json['course'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'course_id': courseId,
        'user_id': userId,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'course': course?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      courseId,
      userId,
      status,
      createdAt,
      updatedAt,
      course,
    ];
  }
}
