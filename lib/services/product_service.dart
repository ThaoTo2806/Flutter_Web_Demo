import 'package:dio/dio.dart';

class SanPhamService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://192.168.1.7:5000/api"));

  Future<List<dynamic>> getDSSanPham() async {
    try {
      Response response = await _dio.get("/sanpham");
      return response.data['data'];
    } catch (e) {
      print("Lỗi khi gọi API sanpham: $e");
      return [];
    }
  }
}
