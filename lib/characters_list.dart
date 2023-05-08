import 'package:flutter/material.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({super.key});

  get characters => ['rick', 'morty', 'erik'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getCharacters(),
    );
  }

  List<CharacterRow> _getCharacters() {
    return characters
        .map<CharacterRow>((e) => CharacterRow(
              name: e,
            ))
        .toList();
  }
}

class CharacterRow extends StatelessWidget {
  const CharacterRow({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        width: 50,
        child: Placeholder(),
      ),
      title: Text(name),
      trailing: Icon(Icons.star),
    );
  }
}
