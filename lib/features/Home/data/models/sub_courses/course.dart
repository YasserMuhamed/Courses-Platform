import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final int? price;
  final int? teacherId;
  final dynamic deletedAt;
  final String? createdAt;
  final String? updatedAt;

  const Course({
    this.id,
    this.title,
    this.description,
    this.image,
    this.price,
    this.teacherId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        price: json['price'] as int?,
        teacherId: json['teacher_id'] as int?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'price': price,
        'teacher_id': teacherId,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      image,
      price,
      teacherId,
      deletedAt,
      createdAt,
      updatedAt,
    ];
  }
}
