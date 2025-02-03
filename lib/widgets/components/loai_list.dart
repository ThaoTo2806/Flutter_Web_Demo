import 'package:flutter/material.dart';
import '../../services/loai_service.dart';

class LoaiList extends StatefulWidget {
  const LoaiList({Key? key}) : super(key: key);

  @override
  _LoaiListState createState() => _LoaiListState();
}

class _LoaiListState extends State<LoaiList> {
  final LoaiService _loaiService = LoaiService();
  List<dynamic> loaiDT = [];
  List<dynamic> loaiLAP = [];
  List<dynamic> loaiPK = [];

  @override
  void initState() {
    super.initState();
    fetchLoai();
  }

  void fetchLoai() async {
    loaiDT = await _loaiService.getLoaiDT();
    loaiLAP = await _loaiService.getLoaiLAP();
    loaiPK = await _loaiService.getLoaiPK();
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
                    overflow: TextOverflow
                        .ellipsis, // Handles overflow if title is too long
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
                      item['TenLoai'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Divider(),
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
        buildLoaiSection("ĐIỆN THOẠI", loaiDT, Colors.white),
        buildLoaiSection("LAPTOP", loaiLAP, Colors.white),
        buildLoaiSection("PHỤ KIỆN", loaiPK, Colors.white),
      ],
    );
  }
}
