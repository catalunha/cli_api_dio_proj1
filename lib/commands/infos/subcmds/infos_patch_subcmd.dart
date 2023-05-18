import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/repository.dart';

class InfosPatchSubcommand extends Command {
  final Repository repository;
  InfosPatchSubcommand({
    required this.repository,
  }) {
    argParser.addOption('id',
        abbr: 'i', help: 'Informe o Id da info a ser atualizada');
    argParser.addOption('file',
        abbr: 'f', help: 'Path for the csv file with Info data');
  }

  @override
  String get name => 'patch';
  @override
  String get description => 'RESTFull PATCH Info';

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
      await repository.patch(id, json.decode(infoString));
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
      print('Erro em Path Info');
      print(e);
      print(s);
    }
  }
}
