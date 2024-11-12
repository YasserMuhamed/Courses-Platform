import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String? message;
  final Data? data;

  const LoginResponse({this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [message, data];
}

class Data extends Equatable {
  final String? token;
  final User? user;

  const Data({this.token, this.user});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json['token'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [token, user];
}

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final int? facultyId;
  final Faculty? faculty;

  const User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.facultyId,
    this.faculty,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        facultyId: json['faculty_id'] as int?,
        faculty: json['faculty'] == null
            ? null
            : Faculty.fromJson(json['faculty'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'email_verified_at': emailVerifiedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'faculty_id': facultyId,
        'faculty': faculty?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      emailVerifiedAt,
      createdAt,
      updatedAt,
      facultyId,
      faculty,
    ];
  }
}

class Faculty extends Equatable {
  final int? id;
  final String? name;
  final String? city;
  final String? createdAt;
  final String? updatedAt;

  const Faculty({
    this.id,
    this.name,
    this.city,
    this.createdAt,
    this.updatedAt,
  });

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
        id: json['id'] as int?,
        name: json['name'] as String?,
        city: json['city'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  @override
  List<Object?> get props => [id, name, city, createdAt, updatedAt];
}
