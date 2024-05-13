class Interes {
  final int id;
  final String nombre;
  final String imagen;

  Interes({
    required this.id,
    required this.nombre,
    required this.imagen,
  });

  // Método factory para convertir un mapa JSON en una instancia de Interes
  factory Interes.fromJson(Map<String, dynamic> json) {
    return Interes(
      id: json['id'],
      nombre: json['nombre'],
      imagen: json['imagen'],
    );
  }
}
