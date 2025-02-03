import 'package:flutter/material.dart';
import 'components/loai_list.dart';
import 'components/loai_tin.dart';
import 'components/slider.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Đảm bảo tất cả cột bắt đầu từ trên
      children: [
        // Cột 1 (20% - Danh sách loại sản phẩm)
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const LoaiList(),
          ),
        ),

        // Cột 2 (60% - Nội dung chính)
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    '../../Images_KTL2/bg_565cb98fcc.png'), // Nền ảnh cho cột 2
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
                bottom: 10), // Thêm padding trên 20 và các padding khác là 10
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
              mainAxisAlignment:
                  MainAxisAlignment.start, // Bắt đầu từ trên cùng
              children: [
                const SliderWidget(), // Thêm slider vào đây
              ],
            ),
          ),
        ),

        // Cột 3 (20% - Loại tin)
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const LoaiTin(),
          ),
        ),
      ],
    );
  }
}
