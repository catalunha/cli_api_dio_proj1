import 'package:args/command_runner.dart';
import 'package:cli_api_dio_proj1/commands/infos/infos_cmd.dart';

void main(List<String> arguments) {
  try {
    CommandRunner('cliApi', 'cliApi...')
      ..addCommand(InfosCommand())
      ..run(arguments);
  } catch (e) {
    print('Comandos com erro. Veja -h');
  }
}
