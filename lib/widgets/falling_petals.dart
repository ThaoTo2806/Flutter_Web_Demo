import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class FallingPetals extends StatefulWidget {
  @override
  _FallingPetalsState createState() => _FallingPetalsState();
}

class _FallingPetalsState extends State<FallingPetals>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Offset> petalPositions = [];
  final int petalCount = 25; // Số lượng cánh hoa
  late double screenHeight;
  late double screenWidth;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    )..repeat();

    // Tạo một Timer để dừng hiệu ứng sau 10 giây
    Timer(const Duration(seconds: 10), () {
      _controller.stop();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Lấy thông tin về kích thước màn hình sau khi context đã sẵn sàng
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    // Tạo vị trí ngẫu nhiên cho các cánh hoa
    for (int i = 0; i < petalCount; i++) {
      petalPositions.add(Offset(
        Random().nextDouble() *
            screenWidth, // Vị trí x ngẫu nhiên trên toàn bộ màn hình
        Random().nextDouble() * -100, // Bắt đầu từ trên màn hình
      ));
    }

    _controller.addListener(() {
      setState(() {
        for (int i = 0; i < petalPositions.length; i++) {
          petalPositions[i] = Offset(
            petalPositions[i].dx +
                sin(Random().nextDouble() * pi) *
                    5, // Di chuyển x ngẫu nhiên để tạo hiệu ứng lệch
            petalPositions[i].dy +
                1 +
                Random().nextDouble() * 2, // Tốc độ rơi ngẫu nhiên
          );

          // Reset cánh hoa khi nó rơi ra khỏi màn hình
          if (petalPositions[i].dy > screenHeight) {
            petalPositions[i] = Offset(
              Random().nextDouble() *
                  screenWidth, // Vị trí x ngẫu nhiên trên toàn bộ màn hình
              -10,
            );
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      // Đảm bảo cánh hoa bao phủ toàn bộ màn hình
      child: Stack(
        children: petalPositions.map((position) {
          return Positioned(
            left: position.dx,
            top: position.dy,
            child: Image.asset(
              '../Images_KTL2/flower_petal.png', // Đảm bảo đường dẫn ảnh đúng
              width: 15,
              height: 15,
            ),
          );
        }).toList(),
      ),
    );
  }
}
