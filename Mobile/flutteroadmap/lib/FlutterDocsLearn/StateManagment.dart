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
//State Of Managment

//MVVM Yapısı

//Model
class CounterData {
  CounterData(this.count);

  final int count;
}

class CounterModel {
  Future<CounterData> loadCountFromServer() async {
    final uri = Uri.parse('https://myfluttercounterapp.net/count');
    final response = await get(uri);

    if (response.statusCode != 200) {
      throw ('Failed to update resource');
    }

    return CounterData(int.parse(response.body));
  }

  // Future<CounterData> updateCountOnServer(int newCount) async {
  // ...
  // }
}

//ViewModel

class CounterViewModel extends ChangeNotifier {
  final CounterModel model;
  int? count;
  String? errorMessage;
  CounterViewModel(this.model);

  Future<void> init() async {
    try {
      count = (await model.loadCountFromServer()).count;
    } catch (e) {
      errorMessage = 'Could not initialize counter';
    }
    notifyListeners();
  }

  Future<void> increment() async {
    final currentCount = count;
    if (currentCount == null) {
      throw ('Not initialized');
    }
    try {
      final incrementedCount = currentCount + 1;
      await model.updateCountOnServer(incrementedCount);
      count = incrementedCount;
    } catch (e) {
      errorMessage = 'Could not update count';
    }
    notifyListeners();
  }
}

//View

/*ListenableBuilder(
  listenable: viewModel,
  builder: (context, child) {
    return Column(
      children: [
        if (viewModel.errorMessage != null)
          Text(
            'Error: ${viewModel.errorMessage}',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.apply(color: Colors.red),
          ),
        Text('Count: ${viewModel.count}'),
        TextButton(
          onPressed: () {
            viewModel.increment();
          },
          child: Text('Increment'),
        ),
      ],
    );
  },
)
*/

//State Managmentte listenable ne işe yarar
