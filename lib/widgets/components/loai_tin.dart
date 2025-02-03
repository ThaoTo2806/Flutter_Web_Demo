import 'package:flutter/material.dart';
import '../../services/loai_service.dart';

class LoaiTin extends StatefulWidget {
  const LoaiTin({Key? key}) : super(key: key);

  @override
  _LoaiTinState createState() => _LoaiTinState();
}

class _LoaiTinState extends State<LoaiTin> {
  final LoaiService _loaiService = LoaiService();
  List<dynamic> loaiTin = [];

  @override
  void initState() {
    super.initState();
    fetchLoaiTin();
  }

  void fetchLoaiTin() async {
    loaiTin = await _loaiService.getLoaiTin();
    setState(() {});
  }

  Widget buildLoaiSection(String title, List<dynamic> data, Color bgColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.red,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: bgColor,
          child: Column(
            children: data.map((item) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      item['TLTin'], // Đổi thành dữ liệu chuẩn
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildLoaiSection("TIN TỨC", loaiTin, Colors.white),
      ],
    );
  }
}
