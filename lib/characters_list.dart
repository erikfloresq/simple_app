import 'package:flutter/material.dart';
import 'package:simple_app/datamodel/api_response.dart';
import 'package:simple_app/repository/repository.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() {
    return _CharactersListState();
  }
}

class _CharactersListState extends State<CharactersList> {
  Repository repository = Repository();
  late Future<APIResponse> apiResponse;

  @override
  void initState() {
    super.initState();
    apiResponse = repository.loadResponse();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<APIResponse>(
      future: apiResponse,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('$snapshot.error');
        }
        return ListView(
            children: [
              CharacterRow(name: snapshot.data?.characters ?? ''),
              CharacterRow(name: snapshot.data?.locations ?? ''),
              CharacterRow(name: snapshot.data?.episodes ?? '')
              ]
          );
      },
    );
  }
}

class CharacterRow extends StatelessWidget {
  const CharacterRow({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        width: 50,
        child: const Placeholder(),
      ),
      title: Text(name),
      trailing: const Icon(Icons.star),
    );
  }
}
