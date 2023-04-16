class User {
    User({
        required this.name,
        required this.lastName,
        required this.birthdate,
        required this.email,
        required this.uid,
    });

    final String name;
    final String lastName;
    final DateTime birthdate;
    final String email;
    final String uid;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        lastName: json["last_name"],
        birthdate: DateTime.parse(json["birthdate"]),
        email: json["email"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": lastName,
        "birthdate": birthdate.toIso8601String(),
        "email": email,
        "uid": uid,
    };
}