class User {
  final int id;
  final String nombre;
  final String email;
  final String password;
  final String? usuario;
  final String? imagen;
  final String? descripcion;

  User({
    required this.id,
    required this.nombre,
    required this.email,
    required this.password,
    required this.usuario,
    required this.imagen,
    required this.descripcion,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nombre: json['nombre'],
      email: json['email'],
      password: json['password'],
      usuario: json['usuario'],
      imagen: json['imagen'],
      descripcion: json['descripcion'],
    );
  }

  // Getters
  int get getId => id;
  String get getNombre => nombre;
  String get getEmail => email;
  String get getPassword => password;
  String? get getUsuario => usuario;
  String? get getImagen => imagen;
  String? get getDescripcion => descripcion;

  // Setters
}


class UsuarioActual {
  static UsuarioActual? _instancia;
  late User _usuario;

  UsuarioActual(this._usuario); // Constructor

  static UsuarioActual get instancia {
    _instancia ??= UsuarioActual(User(
      id: 0,
      nombre: '',
      email: '',
      password: '',
      usuario: '',
      imagen: '',
      descripcion: '',
    ));
    return _instancia!;
  }

  User get usuario => _usuario;
  set usuario(User usuario) {
    _usuario = usuario;
  }
}