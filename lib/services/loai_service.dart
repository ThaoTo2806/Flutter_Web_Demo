import 'package:dio/dio.dart';

class LoaiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://192.168.1.7:5000/api"));

  Future<List<dynamic>> getLoaiDT() async {
    try {
      Response response = await _dio.get("/loaiDT");
      return response.data['data']; // Trả về danh sách
    } catch (e) {
      print("Lỗi khi gọi API loaiDT: $e");
      return [];
    }
  }

  Future<List<dynamic>> getLoaiLAP() async {
    try {
      Response response = await _dio.get("/loaiLAP");
      return response.data['data'];
    } catch (e) {
      print("Lỗi khi gọi API loaiLAP: $e");
      return [];
    }
  }

  Future<List<dynamic>> getLoaiPK() async {
    try {
      Response response = await _dio.get("/loaiPK");
      return response.data['data'];
    } catch (e) {
      print("Lỗi khi gọi API loaiPK: $e");
      return [];
    }
  }
}
