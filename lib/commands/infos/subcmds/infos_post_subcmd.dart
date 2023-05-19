import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_api_dio_proj1/models/info_model.dart';

import '../../../repositories/repository.dart';

class InfosPostSubcommand extends Command {
  final Repository repository;
  InfosPostSubcommand({
    required this.repository,
  }) {
    argParser.addOption('file',
        abbr: 'f', help: 'Path for the json file with Info data');
  }

  @override
  String get name => 'post';
  @override
  String get description => 'RESTFull POST Info';

  @override
  Future<void> run() async {
    String? file = argResults?['file'];
    if (file == null) {
      print('Informe o caminho for the json file with Info data');
      return;
    }
    print('Adding...');
    try {
      final filePath = argResults!['file'];
      final infoString = File(filePath).readAsStringSync();
      final model = InfoModel.fromJson(infoString);
      await repository.post(model);
      print('Info add');
    } catch (e) {
      print('Erro em Post Info');
      print(e);
    }
  }
}
