import 'package:equatable/equatable.dart';

class ForgetPasswordSecondRequest extends Equatable {
  final String? email;
  final int? code;

  const ForgetPasswordSecondRequest({this.email, this.code});

  factory ForgetPasswordSecondRequest.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordSecondRequest(
      email: json['email'] as String?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'code': code,
      };

  @override
  List<Object?> get props => [email, code];
}
