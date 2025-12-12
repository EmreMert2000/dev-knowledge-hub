//Inherited Widgetslar,üst veri paylaşımı için kullanılırlar ve widget ağacında yukarıdan aşağıya doğru veri iletimi sağlarlar.
//Bu, özellikle büyük uygulamalarda veri yönetimini kolaylaştırır ve performansı artırır çünkü yalnızca ilgili widgetlar yeniden oluşturulur.
//Kullanılan Yerler:Provider,MediaQuery.of,Navigator.of

import 'package:flutter/material.dart';

class Inheritedwidgets extends InheritedWidget {
  const Inheritedwidgets({super.key, required this.child})
    : super(child: child);

  final Widget child;

  static Inheritedwidgets? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Inheritedwidgets>();
  }

  @override
  bool updateShouldNotify(Inheritedwidgets oldWidget) {
    return true;
  }
}
