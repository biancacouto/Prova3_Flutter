class User {
  DateTime expiresIn = DateTime(0);
  String idToken = '';
  String localId = '';
  String nome = '';
  String cpf = '';
  String grau = '';
  String foto = '';
  String email = '';

  User({
    required this.expiresIn,
    required this.idToken,
    required this.localId,
    required this.nome,
    required this.cpf,
    required this.grau,
    required this.foto,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    expiresIn =
        DateTime.now().add(Duration(seconds: int.parse(json['expiresIn'])));
    idToken = json['idToken'] ?? "";
    localId = json['localId'] ?? "";
    nome = json['nome'] ?? "";
    cpf = json['cpf'] ?? "";
    grau = json['grau'] ?? "";
    foto = json['foto'] ?? "";
    email = json['email'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expiresIn'] = this.expiresIn;
    data['idToken'] = this.idToken;
    data['localId'] = this.localId;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['grau'] = this.grau;
    data['foto'] = this.foto;
    data['email'] = this.email;
    return data;
  }

  User.clear() {
    expiresIn = DateTime(0);
    idToken = "";
    localId = "";
    nome = "";
    cpf = "";
    grau = "";
    foto = "";
    email = "";
  }
}
