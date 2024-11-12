import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final String? message;
  final Data? data;

  const RegisterResponse({this.message, this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [message, data];
}

class Data extends Equatable {
  final User? user;
  final String? token;

  const Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'token': token,
      };

  @override
  List<Object?> get props => [user, token];
}

class User extends Equatable {
  final String? name;
  final String? email;
  final int? facultyId;
  final String? phone;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  const User({
    this.name,
    this.email,
    this.facultyId,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        email: json['email'] as String?,
        facultyId: json['faculty_id'] as int?,
        phone: json['phone'] as String?,
        updatedAt: json['updated_at'] as String?,
        createdAt: json['created_at'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'faculty_id': facultyId,
        'phone': phone,
        'updated_at': updatedAt,
        'created_at': createdAt,
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      name,
      email,
      facultyId,
      phone,
      updatedAt,
      createdAt,
      id,
    ];
  }
}
