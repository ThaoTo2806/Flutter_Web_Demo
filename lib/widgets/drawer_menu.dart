import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = [
      "Chuột Bàn phím-Tai nghe",
      "Laptop - Handheld",
      "PC / Máy Bộ",
      "Màn hình - Loa",
      "Linh kiện PC / Laptop",
      "Lifestyle - Livestream setup",
      "SSD gắn trong",
      "RAM Laptop, PC",
      "Thẻ nhớ",
      "Ổ cứng SSD di động",
      "Ổ cứng HDD di động",
      "USB",
      "HDD",
      "GIẢI PHÁP NAS",
      "Phụ kiện",
      "Dịch vụ thu phí"
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Text("Menu",
                style: TextStyle(fontSize: 24, color: Colors.black)),
          ),
          ...menuItems.map((item) => ListTile(
                title: Text(item),
                onTap: () {},
              )),
        ],
      ),
    );
  }
}
