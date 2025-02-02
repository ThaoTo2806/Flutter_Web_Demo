import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  // Biến lưu trữ mục được hover
  String? hoveredItem;

  List<Map<String, dynamic>> menuItems = [
    {"name": "Chuột Bàn phím-Tai nghe", "icon": Icons.mouse},
    {"name": "Laptop - Handheld", "icon": Icons.laptop},
    {"name": "Máy tính", "icon": Icons.computer},
    {"name": "Màn hình - Loa", "icon": Icons.tv},
    {"name": "Linh kiện PC / Laptop", "icon": Icons.memory},
    {"name": "Lifestyle - Livestream setup", "icon": Icons.camera_alt},
    {"name": "SSD gắn trong", "icon": Icons.sd_card},
    {"name": "RAM Laptop, PC", "icon": Icons.hardware},
    {"name": "Thẻ nhớ", "icon": Icons.sd},
    {"name": "Ổ cứng SSD di động", "icon": Icons.drive_eta},
    {"name": "USB", "icon": Icons.usb},
    {"name": "HDD", "icon": Icons.hd_outlined},
    {"name": "GIẢI PHÁP NAS", "icon": Icons.storage},
    {"name": "Phụ kiện", "icon": Icons.more_horiz},
    {"name": "Dịch vụ thu phí", "icon": Icons.payment},
  ];

  List<Map<String, dynamic>> brands = [
    {
      "name": "iPhone",
      "subItems": [
        "iPhone 16 Series",
        "iPhone 15 Series",
        "iPhone 14 Series",
        "iPhone 13 Series",
        "iPhone 11 Series"
      ]
    },
    {
      "name": "Samsung",
      "subItems": ["Galaxy A", "Galaxy S", "Galaxy Z", "Galaxy M"]
    },
    {
      "name": "Oppo",
      "subItems": ["OPPO Reno Series", "OPPO A Series"]
    },
    {
      "name": "Xiaomi",
      "subItems": [
        "Poco Series",
        "Xiaomi Series",
        "Redmi Note Series",
        "Redmi Series"
      ]
    },
    {
      "name": "Honor",
      "subItems": ["Honor Magic Series"]
    },
    {
      "name": "Thương hiệu khác",
      "subItems": ["Tecno", "Realme", "Vivo", "ZTE", "Inoi", "Benco", "TCL"]
    },
    {
      "name": "Phổ thông 4G",
      "subItems": ["Nokia", "Itel"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ...menuItems.map((item) {
            return MouseRegion(
              onEnter: (_) {
                setState(() {
                  hoveredItem = item["name"];
                });
              },
              onExit: (_) {
                setState(() {
                  hoveredItem = null;
                });
              },
              child: ListTile(
                leading: Icon(
                  item["icon"],
                  color: hoveredItem == item["name"]
                      ? Color(0xFFFF4D4D)
                      : Colors.black,
                ),
                title: Text(
                  item["name"],
                  style: TextStyle(
                    color: hoveredItem == item["name"]
                        ? Color(0xFFFF4D4D)
                        : Colors.black,
                  ),
                ),
                onTap: () {},
              ),
            );
          }).toList(),
          Divider(),
          ...brands.map((brand) {
            return ExpansionTile(
              title: Text(brand["name"]),
              children: (brand["subItems"] as List<String>)
                  .map((subItem) => MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            hoveredItem = subItem;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            hoveredItem = null;
                          });
                        },
                        child: ListTile(
                          title: Text(
                            subItem,
                            style: TextStyle(
                              color: hoveredItem == subItem
                                  ? Color(0xFFFF4D4D)
                                  : Colors.black,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ))
                  .toList(),
            );
          }).toList(),
        ],
      ),
    );
  }
}
