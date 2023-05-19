import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_api_dio_proj1/models/info_model.dart';

import '../../../repositories/repository.dart';

class InfosPostFileSubcommand extends Command {
  final Repository repository;
  InfosPostFileSubcommand({
    required this.repository,
  }) {
    argParser.addOption('file', abbr: 'f', help: 'Path for the image file');
    argParser.addOption('name', abbr: 'n', help: 'Name for the image file');
  }

  @override
  String get name => 'postfile';
  @override
  String get description => 'RESTFull POST for File Info';

  @override
  Future<void> run() async {
    String? file = argResults?['file'];
    if (file == null) {
      print('Informe o caminho for the image file');
      return;
    }
    String? name = argResults?['name'];
    if (name == null) {
      print('Informe o nome do arquivo');
      return;
    }
    print('Sending...');
    try {
      // final filePath = argResults!['file'];
      // final infoString = File(filePath).readAsStringSync();
      // final model = InfoModel.fromJson(infoString);
      await repository.postFile(file, name);
      print('Image send');
    } catch (e) {
      print('Erro em Post Info');
      print(e);
    }
  }
}
