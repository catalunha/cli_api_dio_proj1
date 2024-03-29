import '../models/info_model.dart';

abstract class Repository {
  Future<List<InfoModel>> get();
  Future<InfoModel> getId(String id);
  Future<void> post(InfoModel model);
  Future<void> postFile(String filePath, String fileName);
  Future<void> put(String id, InfoModel model);
  Future<void> patch(String id, Map<String, dynamic> map);
  Future<void> delete(String id);
}
