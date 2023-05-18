import 'package:args/command_runner.dart';
import 'package:cli_api_dio_proj1/datasource/datasource.dart';
import 'package:cli_api_dio_proj1/datasource/info_dio.dart';

import '../../repositories/info_repository.dart';
import 'subcmds/infos_delete_subcmd.dart';
import 'subcmds/infos_get_id_subcmd.dart';
import 'subcmds/infos_get_subcmd.dart';
import 'subcmds/infos_patch_subcmd.dart';
import 'subcmds/infos_post_subcmd.dart';
import 'subcmds/infos_put_subcmd.dart';

class InfosCommand extends Command {
  @override
  String get name => 'infos';
  @override
  String get description => 'Infos Operations';

  InfosCommand() {
    try {
      final DataSource dataSource = InfoDio();
      final InfoRepository infoRepository =
          InfoRepository(dataSource: dataSource);
      addSubcommand(InfosGetSubcommand(
        repository: infoRepository,
      ));
      addSubcommand(InfosGetIdSubcommand(
        repository: infoRepository,
      ));
      addSubcommand(InfosPostSubcommand(
        repository: infoRepository,
      ));
      addSubcommand(InfosPutSubcommand(
        repository: infoRepository,
      ));
      addSubcommand(InfosPatchSubcommand(
        repository: infoRepository,
      ));
      addSubcommand(InfosDeleteSubcommand(
        repository: infoRepository,
      ));
    } catch (e) {
      print('Infos SubComandos com erro. Veja -h');
    }
  }
}
