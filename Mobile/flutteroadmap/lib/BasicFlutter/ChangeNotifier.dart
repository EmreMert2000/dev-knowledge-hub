//Change Notifier
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierExample extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // Notify listeners about the change
  }

  void decrement() {
    _counter--;
    notifyListeners(); // Notify listeners about the change
  }
}

//MultiProvider Example
class MultiProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeNotifierExample()),
        // Add more providers here if needed
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('MultiProvider Example')),
          body: Center(
            child: Consumer<ChangeNotifierExample>(
              builder: (context, notifier, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Counter: ${notifier.counter}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: notifier.increment,
                          child: Text('Increment'),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: notifier.decrement,
                          child: Text('Decrement'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

//Context.read işlemi ile ChangeNotifier'a erişim
//Context.watch işlemi ile ChangeNotifier'dan veri okuma
//Context.select işlemi ile ChangeNotifier'dan belirli bir alanı izleme
