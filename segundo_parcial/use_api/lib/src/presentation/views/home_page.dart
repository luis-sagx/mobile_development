import 'package:flutter/material.dart';
import '../viewmodels/rickandmorty_viewmodel.dart';

class HomePage extends StatefulWidget {
  final RickandmortyViewmodel viewModel;

  const HomePage({super.key, required this.viewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadCharacters();
    widget.viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
        backgroundColor: Colors.green,
      ),
      body: widget.viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : widget.viewModel.error != null
          ? Center(child: Text('Error: ${widget.viewModel.error}'))
          : ListView.builder(
              itemCount: widget.viewModel.characters.length,
              itemBuilder: (context, index) {
                final character = widget.viewModel.characters[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(
                      character.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(character.name),
                    subtitle: Text('ID: ${character.id}'),
                  ),
                );
              },
            ),
    );
  }
}
