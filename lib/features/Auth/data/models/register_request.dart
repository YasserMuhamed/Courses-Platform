import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? passwordConfirmation;
  final String? phone;
  final int? facultyId;

  const RegisterRequest({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.phone,
    this.facultyId,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      phone: json['phone'] as String?,
      facultyId: json['faculty_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'phone': phone,
        'faculty_id': facultyId,
      };

  @override
  List<Object?> get props {
    return [
      name,
      email,
      password,
      passwordConfirmation,
      phone,
      facultyId,
    ];
  }
}
