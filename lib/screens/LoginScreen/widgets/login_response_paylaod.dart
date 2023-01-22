class LoginResponsePayload {
  String accessToken;
  String refreshToken;

  factory LoginResponsePayload.fromJson(Map<String, dynamic> json) {
    return LoginResponsePayload(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  LoginResponsePayload({
    required this.accessToken,
    required this.refreshToken,
  });
}
