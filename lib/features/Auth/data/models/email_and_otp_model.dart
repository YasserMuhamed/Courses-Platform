import 'package:equatable/equatable.dart';

class EmailAndOtpModel extends Equatable {
  final String? email;
  final int? code;

  const EmailAndOtpModel({this.email, this.code});

  factory EmailAndOtpModel.fromJson(Map<String, dynamic> json) {
    return EmailAndOtpModel(
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
