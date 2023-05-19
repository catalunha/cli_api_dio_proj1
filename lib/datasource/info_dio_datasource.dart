import 'package:cli_api_dio_proj1/datasource/datasource.dart';
import 'package:dio/dio.dart';
import '../models/info_model.dart';

class InfoDioDataSource extends DataSource {
  @override
  Future<List<InfoModel>> get() async {
    try {
      final response = await Dio().get('http://localhost:8080/infos');

      if (response.data.isEmpty) {
        throw Exception('DataSource Infos não encontrados');
      }
      return response.data.map<InfoModel>((e) => InfoModel.fromMap(e)).toList();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<InfoModel> getId(String id) async {
    try {
      final response = await Dio().get('http://localhost:8080/infos/$id');

      if (response.data.isEmpty) {
        throw Exception('DataSource Info não encontrados');
      }

      return InfoModel.fromMap(response.data);
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<void> post(InfoModel model) async {
    try {
      await Dio().post('http://localhost:8080/infos', data: model.toMap());
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<void> postFile(String filePath, String fileName) async {
    final FormData formData = FormData.fromMap(
      {
        'file': await MultipartFile.fromFile(
          filePath,
          // filename: fileName,
        )
      },
    );
    print('$filePath - $fileName');
    try {
      final response =
          await Dio().post('http://localhost:8080/uploads', data: formData);
      print(response.data.toString());
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<void> put(String id, InfoModel model) async {
    try {
      await Dio().put('http://localhost:8080/infos/$id', data: model.toMap());
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<void> patch(String id, Map<String, dynamic> map) async {
    try {
      await Dio().patch('http://localhost:8080/infos/$id', data: map);
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await Dio().delete('http://localhost:8080/infos/$id');
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}
