import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_api_dio_proj1/models/info_model.dart';

import '../../../repositories/repository.dart';

class InfosPutSubcommand extends Command {
  final Repository repository;
  InfosPutSubcommand({
    required this.repository,
  }) {
    argParser.addOption('id',
        abbr: 'i', help: 'Informe o Id da info a ser atualizada');
    argParser.addOption('file',
        abbr: 'f', help: 'Path for the csv file with Info data');
  }

  @override
  String get name => 'put';
  @override
  String get description => 'RESTFull PUT Info';

  @override
  Future<void> run() async {
    String? id = argResults?['id'];
    if (id == null) {
      print('Informe o Id da info a ser atualizada');
      return;
    }
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
      await repository.put(id, model);
      print('Info update');
    } on FormatException catch (e, s) {
      print('Erro na formatação do json');
      print(e);
      print(s);
    } on PathNotFoundException catch (e, s) {
      print('Não achei o arquivo');
      print(e);
      print(s);
    } catch (e, s) {
      print('Erro em Put Info');
      print(e);
      print(s);
    }
  }
}
