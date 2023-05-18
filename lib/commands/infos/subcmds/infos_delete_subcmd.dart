import 'package:args/command_runner.dart';

import '../../../repositories/repository.dart';

class InfosDeleteSubcommand extends Command {
  final Repository repository;
  InfosDeleteSubcommand({
    required this.repository,
  }) {
    argParser.addOption('id', abbr: 'i', help: 'Informe o Id da info');
  }

  @override
  String get name => 'delete';
  @override
  String get description => 'RESTFull DELETE Info by id';

  @override
  Future<void> run() async {
    String? id = argResults?['id'];
    if (id == null) {
      print('Informe o Id da Info');
      return;
    }
    print('Deleting...');
    try {
      await repository.delete(id);
      print('Info id: $id deleted');
    } catch (e) {
      print('Erro em Delete Info');
      print(e);
    }
  }
}
