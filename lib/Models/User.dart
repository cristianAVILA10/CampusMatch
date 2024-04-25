class User {
  final int id;
  final String nombre;
  final String email;
  final String password;

  User({required this.id, required this.nombre, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nombre: json['nombre'],
      email: json['email'],
      password: json['password'],
    );
  }
}