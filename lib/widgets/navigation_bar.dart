import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          "TRANG CHỦ",
          "THANH TOÁN",
          "TRẢ GÓP",
          "LIÊN HỆ",
          "CHĂM SÓC KHÁCH HÀNG",
          "TUYỂN DỤNG"
        ]
            .map((title) => TextButton(
                  onPressed: () {},
                  child:
                      Text(title, style: const TextStyle(color: Colors.white)),
                ))
            .toList(),
      ),
    );
  }
}
