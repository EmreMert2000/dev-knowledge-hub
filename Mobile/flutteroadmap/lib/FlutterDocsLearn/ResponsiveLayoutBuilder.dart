//Responsive yapılarda kullanılmak için
//oluşturulan layout builder yapısını oluşturuyoruz.

import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayoutBuilder({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1024) {
      return desktopLayout;
    } else if (screenWidth >= 600) {
      return tabletLayout;
    } else {
      return mobileLayout;
    }
  }
}
//Burada yapılan işlem ekran genişliğine göre
//farklı layoutları render etmektir.