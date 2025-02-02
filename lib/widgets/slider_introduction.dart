import 'package:flutter/material.dart';

class SliderIntroduction extends StatefulWidget {
  const SliderIntroduction({super.key});

  @override
  _SliderIntroductionState createState() => _SliderIntroductionState();
}

class _SliderIntroductionState extends State<SliderIntroduction>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Tạo controller cho animation
    _controller = AnimationController(
      duration:
          const Duration(seconds: 30), // Thời gian hoàn thành hiệu ứng lâu hơn
      vsync: this,
    )..repeat(reverse: false); // Lặp lại vô hạn

    // Tạo animation cho việc dịch chuyển
    _animation = Tween<double>(begin: 1.0, end: -1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Giải phóng tài nguyên
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      color: Colors.red,
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: _controller, // Dùng controller thay vì _animation
        builder: (context, child) {
          return Transform.translate(
            offset:
                Offset(_animation.value * MediaQuery.of(context).size.width, 0),
            child: child,
          );
        },
        child: Row(
          children: [
            Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              "Welcome to our website! On the occasion of the New Year 2025, I wish you peace and happiness.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
