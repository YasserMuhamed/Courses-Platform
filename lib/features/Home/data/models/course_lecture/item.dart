import 'package:equatable/equatable.dart';

class Item extends Equatable {
	final int? id;
	final int? lectureId;
	final String? title;
	final String? file;
	final String? fileType;
	final String? fileSize;
	final int? videoDuration;
	final int? order;
	final int? isActive;
	final dynamic deletedAt;
	final String? createdAt;
	final String? updatedAt;

	const Item({
		this.id, 
		this.lectureId, 
		this.title, 
		this.file, 
		this.fileType, 
		this.fileSize, 
		this.videoDuration, 
		this.order, 
		this.isActive, 
		this.deletedAt, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Item.fromJson(Map<String, dynamic> json) => Item(
				id: json['id'] as int?,
				lectureId: json['lecture_id'] as int?,
				title: json['title'] as String?,
				file: json['file'] as String?,
				fileType: json['file_type'] as String?,
				fileSize: json['file_size'] as String?,
				videoDuration: json['video_duration'] as int?,
				order: json['order'] as int?,
				isActive: json['is_active'] as int?,
				deletedAt: json['deleted_at'] as dynamic,
				createdAt: json['created_at'] as String?,
				updatedAt: json['updated_at'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'lecture_id': lectureId,
				'title': title,
				'file': file,
				'file_type': fileType,
				'file_size': fileSize,
				'video_duration': videoDuration,
				'order': order,
				'is_active': isActive,
				'deleted_at': deletedAt,
				'created_at': createdAt,
				'updated_at': updatedAt,
			};

	@override
	List<Object?> get props {
		return [
				id,
				lectureId,
				title,
				file,
				fileType,
				fileSize,
				videoDuration,
				order,
				isActive,
				deletedAt,
				createdAt,
				updatedAt,
		];
	}
}
