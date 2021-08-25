import 'package:flutter/material.dart';

import '../../../models/models.dart';

class CardUser extends StatelessWidget {
  final User user;
  CardUser({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            child: Image.network(
              user.foto,
              width: 200,
              errorBuilder: (context, url, error) => Container(
                  child: Icon(
                Icons.error,
                color: Colors.grey,
              )),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user.nome,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user.cpf,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Grau de Escola: ' + user.grau,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user.email,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
