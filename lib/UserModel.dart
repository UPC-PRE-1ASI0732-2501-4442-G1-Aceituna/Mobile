class UserModel {
  String nombre;
  String correo;
  String celular;
  String tipoUsuario; // "propietario" o "rentador"

  UserModel({
    required this.nombre,
    required this.correo,
    required this.celular,
    required this.tipoUsuario,
  });
}
