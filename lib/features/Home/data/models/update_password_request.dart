import 'package:equatable/equatable.dart';

class UpdatePasswordRequest extends Equatable {
  final String? currentPassword;
  final String? newPassword;
  final String? newPasswordConfirmation;

  const UpdatePasswordRequest({
    this.currentPassword,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordRequest(
      currentPassword: json['current_password'] as String?,
      newPassword: json['new_password'] as String?,
      newPasswordConfirmation: json['new_password_confirmation'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'current_password': currentPassword,
        'new_password': newPassword,
        'new_password_confirmation': newPasswordConfirmation,
      };

  @override
  List<Object?> get props {
    return [
      currentPassword,
      newPassword,
      newPasswordConfirmation,
    ];
  }
}
