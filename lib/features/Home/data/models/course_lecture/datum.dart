import 'package:equatable/equatable.dart';

import 'item.dart';

class Datum extends Equatable {
	final int? id;
	final int? courseId;
	final String? title;
	final int? order;
	final dynamic deletedAt;
	final String? createdAt;
	final String? updatedAt;
	final int? itemsCount;
	final List<Item>? items;

	const Datum({
		this.id, 
		this.courseId, 
		this.title, 
		this.order, 
		this.deletedAt, 
		this.createdAt, 
		this.updatedAt, 
		this.itemsCount, 
		this.items, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				courseId: json['course_id'] as int?,
				title: json['title'] as String?,
				order: json['order'] as int?,
				deletedAt: json['deleted_at'] as dynamic,
				createdAt: json['created_at'] as String?,
				updatedAt: json['updated_at'] as String?,
				itemsCount: json['items_count'] as int?,
				items: (json['items'] as List<dynamic>?)
						?.map((e) => Item.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'course_id': courseId,
				'title': title,
				'order': order,
				'deleted_at': deletedAt,
				'created_at': createdAt,
				'updated_at': updatedAt,
				'items_count': itemsCount,
				'items': items?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				courseId,
				title,
				order,
				deletedAt,
				createdAt,
				updatedAt,
				itemsCount,
				items,
		];
	}
}
