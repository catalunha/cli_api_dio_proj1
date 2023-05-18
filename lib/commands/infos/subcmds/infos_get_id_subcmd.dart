import 'package:args/command_runner.dart';

import '../../../repositories/repository.dart';

class InfosGetIdSubcommand extends Command {
  final Repository repository;
  InfosGetIdSubcommand({
    required this.repository,
  }) {
    argParser.addOption('id', abbr: 'i', help: 'Informe o Id da info');
  }

  @override
  String get name => 'getid';
  @override
  String get description => 'RESTFull GET Info by Id';

  @override
  Future<void> run() async {
    String? id = argResults?['id'];
    if (id == null) {
      print('Informe o Id da Info');
      return;
    }
    print('Searching...');
    try {
      final info = await repository.getId(id);
      print('id: ${info.id} | typeString: ${info.typeString}');
      print(info.toString());
    } catch (e) {
      print('Erro em GetId da Info');
      print(e);
    }
  }
}
