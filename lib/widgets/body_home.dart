import 'package:flutter/material.dart';
import 'components/loai_list.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Cột 1 (20% - Danh sách loại sản phẩm)
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey[200], // Màu nền nhẹ
            child: const LoaiList(),
          ),
        ),

        // Cột 2 (60% - Màu nền xanh)
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Nội dung chính ở đây",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),

        // Cột 3 (20% - Màu nền vàng)
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.yellow,
            child: const Center(
              child: Text(
                "Thông tin bên phải",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
