import 'dart:async'; // Thêm thư viện Timer

import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final List<String> imgList = [
    '../../../Images_KTL2/desk_header_2f2dad2bc9.png',
    '../../../Images_KTL2/desk_header_2_e3d8f04def.png',
    '../../../Images_KTL2/desk_header_cc95bfe898.png',
  ];
  int _currentIndex = 0;
  late PageController _pageController; // Khai báo controller cho PageView

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Cài đặt slide tự động mỗi 3 giây
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < imgList.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      // Chuyển sang ảnh tiếp theo
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285, // Chiều cao của slider
      child: PageView.builder(
        itemCount: imgList.length,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Image.asset(
            imgList[index],
            fit: BoxFit.cover,
            width: double.infinity, // Chiếm chiều rộng full
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController
        .dispose(); // giải phóng PageController khi không sử dụng nữa
    super.dispose();
  }
}
