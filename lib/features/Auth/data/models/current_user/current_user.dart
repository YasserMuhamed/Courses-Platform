import 'package:equatable/equatable.dart';

import 'user.dart';

class CurrentUser extends Equatable {
  final String? message;
  final User? user;

  const CurrentUser({this.message, this.user});

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [message, user];
}
