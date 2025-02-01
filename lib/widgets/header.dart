import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final TextEditingController searchController;
  final List<String> productNames;

  const Header({
    super.key,
    required this.searchController,
    required this.productNames,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              // Logo bên trái
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Image.asset("../Images_KTL2/LogoFpt.png",
                    fit: BoxFit.contain),
              ),
              // Thanh tìm kiếm ở giữa
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Tìm kiếm...",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      suffixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              // Vùng chứa tài khoản và giỏ hàng
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person, color: Colors.white),
                      const Text("Tài khoản",
                          style: TextStyle(color: Colors.white)),
                      GestureDetector(
                        onTap: () {},
                        child: const Text("Đăng nhập",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.shopping_cart, color: Colors.white),
                        SizedBox(width: 5),
                        Text("Giỏ hàng", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          // Danh sách sản phẩm dưới thanh tìm kiếm
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: productNames.map((name) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
