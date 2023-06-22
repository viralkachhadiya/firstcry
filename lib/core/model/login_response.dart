class LoginResponse    {
  final String uid;
  final String email;
  final String number;
  final String name;
  const LoginResponse (
      {
        required this.uid,
        required this.email,
        required this.number,
        required this.name,
      });

  factory LoginResponse.fromJson(Map<dynamic, dynamic> json) =>
      LoginResponse(
        uid: json['uid'],
        email: json['email'],
        number: json['number'],
        name: json['name'],

      );
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'number': number,
      'name': name,
    };
  }
}