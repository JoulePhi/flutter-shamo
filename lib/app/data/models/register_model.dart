class Register {
  String fullname;
  String username;
  String email;
  String password;

  Register({
    required this.fullname,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
