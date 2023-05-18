import '../models/info_model.dart';

abstract class DataSource {
  Future<List<InfoModel>> get();
  Future<InfoModel> getId(String id);
  Future<void> post(InfoModel model);
  Future<void> put(String id, InfoModel model);
  Future<void> patch(String id, Map<String, dynamic> map);
  Future<void> delete(String id);
}
