class User {
  final int id;
  final String nombre;
  final String email;
  final String password;
  final String? usuario;
  final String? imagen;
  final String? descripcion;
  final String imageAsset;
  final String distance;

  User({
    required this.id,
    required this.nombre,
    required this.email,
    required this.password,
    required this.usuario,
    required this.imagen,
    required this.descripcion,
    required this.imageAsset,
    required this.distance,
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
      imageAsset: json['imageAsset'],
      distance: json['distance'],
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
   String? get getImageAsset => imageAsset;
   String? get getDistance => distance;
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
      imageAsset: '',
      distance: '',
    ));
    return _instancia!;
  }

  User get usuario => _usuario;
  set usuario(User usuario) {
    _usuario = usuario;
  }
}