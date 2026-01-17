// ============================================
// 🎯 CODER BYTE MÜLAKAT HAZIRLIK
// 📚 FLUTTER STATE MANAGEMENT
// ============================================
// Bu dosya Flutter'da state yönetimi için
// detaylı açıklamalar ve pratik örnekler içerir.
// ============================================

// ============================================
// 📌 BÖLÜM 1: STATE NEDİR?
// ============================================

/*
🔹 STATE (Durum) Nedir?
   - Uygulamanın o anki verisi
   - UI'ın nasıl görüneceğini belirler
   - Kullanıcı etkileşimiyle değişir

🔹 State Türleri:
   1. Ephemeral State (Local State)
      - Tek bir widget'a ait
      - Örnek: TextField içeriği, tab seçimi
      - setState ile yönetilir
   
   2. App State (Shared State)
      - Birden fazla widget tarafından paylaşılır
      - Örnek: Kullanıcı bilgisi, sepet, tema
      - Provider, Riverpod, BLoC ile yönetilir

⚠️ MÜLAKAT SORUSU: Ne zaman hangi state management kullanılır?
   - setState: Basit, tek widget scope
   - Provider: Küçük-orta projeler
   - Riverpod: Orta-büyük projeler, test öncelikli
   - BLoC: Enterprise, büyük ekipler
*/

// ============================================
// 📌 BÖLÜM 2: setState (Built-in)
// ============================================

import 'package:flutter/material.dart';

// 🔹 setState Temel Örnek
class CounterWithSetState extends StatefulWidget {
  const CounterWithSetState({super.key});

  @override
  State<CounterWithSetState> createState() => _CounterWithSetStateState();
}

class _CounterWithSetStateState extends State<CounterWithSetState> {
  int _counter = 0;
  
  void _increment() {
    // setState UI'ı yeniden build eder
    setState(() {
      _counter++;
    });
  }
  
  void _decrement() {
    setState(() {
      _counter--;
    });
  }
  
  void _reset() {
    setState(() {
      _counter = 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sayaç: $_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _decrement,
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _reset,
              child: const Text('Sıfırla'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _increment,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}

/*
⚠️ setState Dezavantajları:

1. Prop Drilling
   - State'i alt widget'lara geçirmek zor
   - Her seviyede constructor'a eklemek gerekir

2. Performans
   - Tüm widget yeniden build olur
   - Büyük widget tree'lerde yavaş

3. Test Edilebilirlik
   - İş mantığı UI ile karışık
   - Unit test yazmak zor

4. Kod Karmaşıklığı
   - Büyük uygulamalarda yönetimi zor
   - Callback'ler iç içe geçer
*/

// ============================================
// 📌 BÖLÜM 3: INHERITED WIDGET
// ============================================

// 🔹 InheritedWidget - Provider'ın Temeli
// Widget tree'de veri paylaşımı sağlar

class ThemeState {
  final Color primaryColor;
  final bool isDark;
  
  const ThemeState({
    required this.primaryColor,
    this.isDark = false,
  });
}

class ThemeInheritedWidget extends InheritedWidget {
  final ThemeState theme;
  final Function(ThemeState) onThemeChanged;
  
  const ThemeInheritedWidget({
    super.key,
    required this.theme,
    required this.onThemeChanged,
    required super.child,
  });
  
  // 🔹 of metodu ile erişim pattern'i
  static ThemeInheritedWidget of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
    if (widget == null) {
      throw FlutterError('ThemeInheritedWidget not found in context');
    }
    return widget;
  }
  
  // 🔹 Ne zaman child widget'lar rebuild olsun?
  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    return theme.primaryColor != oldWidget.theme.primaryColor ||
           theme.isDark != oldWidget.theme.isDark;
  }
}

// Kullanım:
// ThemeInheritedWidget.of(context).theme.primaryColor

// ============================================
// 📌 BÖLÜM 4: PROVIDER
// ============================================

/*
📦 Gerekli paket: provider: ^6.x.x

🔹 Provider Türleri:
   1. Provider<T> - Değişmeyen değerler (read-only)
   2. ChangeNotifierProvider<T> - Değişen state (notifyListeners)
   3. FutureProvider<T> - Async veriler
   4. StreamProvider<T> - Stream verileri
   5. MultiProvider - Birden fazla provider
   6. ProxyProvider - Başka provider'a bağımlı
*/

// 🔹 ChangeNotifier Model
class CounterModel extends ChangeNotifier {
  int _count = 0;
  
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners(); // Dinleyicilere haber ver
  }
  
  void decrement() {
    _count--;
    notifyListeners();
  }
  
  void reset() {
    _count = 0;
    notifyListeners();
  }
}

// 🔹 Daha karmaşık model örneği
class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [];
  
  List<Todo> get todos => List.unmodifiable(_todos);
  
  int get completedCount => _todos.where((t) => t.isCompleted).length;
  int get pendingCount => _todos.where((t) => !t.isCompleted).length;
  
  void addTodo(String title) {
    _todos.add(Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    ));
    notifyListeners();
  }
  
  void toggleTodo(String id) {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index].isCompleted = !_todos[index].isCompleted;
      notifyListeners();
    }
  }
  
  void removeTodo(String id) {
    _todos.removeWhere((t) => t.id == id);
    notifyListeners();
  }
  
  void clearCompleted() {
    _todos.removeWhere((t) => t.isCompleted);
    notifyListeners();
  }
}

class Todo {
  final String id;
  String title;
  bool isCompleted;
  
  Todo({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}

/*
// 🔹 Provider Setup (main.dart)

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
        ChangeNotifierProvider(create: (_) => TodoModel()),
        // FutureProvider örneği
        FutureProvider<List<User>>(
          create: (_) => UserService().fetchUsers(),
          initialData: [],
        ),
        // StreamProvider örneği
        StreamProvider<int>(
          create: (_) => Stream.periodic(Duration(seconds: 1), (i) => i),
          initialData: 0,
        ),
      ],
      child: MyApp(),
    ),
  );
}
*/

// 🔹 Provider Kullanım - Consumer Widget
class ProviderCounterWidget extends StatelessWidget {
  const ProviderCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔴 Kötü: Tüm widget rebuild olur
    // final counter = context.watch<CounterModel>();
    
    return Column(
      children: [
        // 🟢 İyi: Sadece bu kısım rebuild olur
        Consumer<CounterModel>(
          builder: (context, counter, child) {
            return Text('Count: ${counter.count}');
          },
        ),
        
        ElevatedButton(
          // 🟢 read: Sadece metot çağırma, rebuild yok
          onPressed: () => context.read<CounterModel>().increment(),
          child: const Text('Artır'),
        ),
      ],
    );
  }
}

// 🔹 Selector - Sadece belirli değer değiştiğinde rebuild
class ProviderSelectorExample extends StatelessWidget {
  const ProviderSelectorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TodoModel, int>(
      selector: (_, model) => model.completedCount,
      builder: (_, completedCount, child) {
        // Sadece completedCount değiştiğinde rebuild
        return Text('Tamamlanan: $completedCount');
      },
    );
  }
}

/*
⚠️ MÜLAKAT SORUSU: context.watch vs context.read farkı?

- watch: Provider'ı dinler, değiştiğinde widget'ı rebuild eder
  Kullanım: build metodu içinde UI'da
  
- read: Sadece değer okur, rebuild etmez
  Kullanım: Event handler'larda, one-time okuma

Örnek:
@override
Widget build(BuildContext context) {
  final counter = context.watch<CounterModel>(); // UI için
  
  return ElevatedButton(
    onPressed: () {
      context.read<CounterModel>().increment(); // Event için
    },
    child: Text('${counter.count}'),
  );
}
*/

// ============================================
// 📌 BÖLÜM 5: RIVERPOD
// ============================================

/*
📦 Gerekli paket: flutter_riverpod: ^2.x.x

🔹 Riverpod Avantajları:
   1. Compile-time safety - Hata derleme zamanında yakalanır
   2. Context bağımsız - BuildContext gerekmez
   3. Lazy loading - Kullanılana kadar oluşturulmaz
   4. Auto-dispose - Kullanılmayınca otomatik temizlenir
   5. Kolay test - Mock'lama çok kolay
   6. Birden fazla provider aynı tiple olabilir

🔹 Riverpod Provider Türleri:
   1. Provider<T> - Sadece okunur değer
   2. StateProvider<T> - Basit state (int, bool, string)
   3. StateNotifierProvider<T, S> - Karmaşık state (legacy)
   4. NotifierProvider<T, S> - Yeni syntax (Riverpod 2.0+)
   5. FutureProvider<T> - Async veriler
   6. StreamProvider<T> - Stream verileri
   7. ChangeNotifierProvider<T> - Legacy migration için
*/

// 🔹 Basit Provider'lar (Global tanımlanır)
/*
// Sadece okunur değer
final greetingProvider = Provider<String>((ref) {
  return 'Merhaba Dünya!';
});

// Basit state
final counterProvider = StateProvider<int>((ref) => 0);

// Boolean state
final isDarkModeProvider = StateProvider<bool>((ref) => false);
*/

// 🔹 StateNotifier ile Karmaşık State (Legacy)
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); // Başlangıç değeri
  
  void increment() => state++;
  void decrement() => state--;
  void reset() => state = 0;
  void setValue(int value) => state = value;
}

/*
final counterNotifierProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});
*/

// 🔹 Notifier ile Karmaşık State (Riverpod 2.0+)
class TodoState {
  final List<Todo> todos;
  final bool isLoading;
  final String? error;
  
  const TodoState({
    this.todos = const [],
    this.isLoading = false,
    this.error,
  });
  
  TodoState copyWith({
    List<Todo>? todos,
    bool? isLoading,
    String? error,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class TodoNotifier extends Notifier<TodoState> {
  @override
  TodoState build() {
    // Başlangıç state'i
    return const TodoState();
  }
  
  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    state = state.copyWith(
      todos: [...state.todos, newTodo],
    );
  }
  
  void toggleTodo(String id) {
    final updatedTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          title: todo.title,
          isCompleted: !todo.isCompleted,
        );
      }
      return todo;
    }).toList();
    
    state = state.copyWith(todos: updatedTodos);
  }
  
  void removeTodo(String id) {
    state = state.copyWith(
      todos: state.todos.where((t) => t.id != id).toList(),
    );
  }
}

/*
final todoNotifierProvider = NotifierProvider<TodoNotifier, TodoState>(() {
  return TodoNotifier();
});
*/

// 🔹 AsyncNotifier - Async işlemler için
class UserState {
  final List<User> users;
  final bool isLoading;
  final String? error;
  
  const UserState({
    this.users = const [],
    this.isLoading = false,
    this.error,
  });
}

class User {
  final String id;
  final String name;
  final String email;
  
  const User({
    required this.id,
    required this.name,
    required this.email,
  });
}

class UserNotifier extends AsyncNotifier<List<User>> {
  @override
  Future<List<User>> build() async {
    // İlk yükleme
    return await _fetchUsers();
  }
  
  Future<List<User>> _fetchUsers() async {
    // API çağrısı simülasyonu
    await Future.delayed(const Duration(seconds: 2));
    return [
      const User(id: '1', name: 'Emre', email: 'emre@example.com'),
      const User(id: '2', name: 'Ahmet', email: 'ahmet@example.com'),
    ];
  }
  
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchUsers());
  }
  
  Future<void> addUser(String name, String email) async {
    final currentUsers = state.value ?? [];
    final newUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
    );
    state = AsyncValue.data([...currentUsers, newUser]);
  }
}

/*
final userNotifierProvider = AsyncNotifierProvider<UserNotifier, List<User>>(() {
  return UserNotifier();
});
*/

// 🔹 FutureProvider Örneği
/*
final usersFutureProvider = FutureProvider<List<User>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.getUsers();
});

// Auto-refresh her 30 saniyede
final autoRefreshUsersProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  ref.keepAlive();
  
  final timer = Timer.periodic(Duration(seconds: 30), (_) {
    ref.invalidateSelf();
  });
  
  ref.onDispose(() => timer.cancel());
  
  return await ref.watch(apiServiceProvider).getUsers();
});
*/

// 🔹 StreamProvider Örneği
/*
final messagesStreamProvider = StreamProvider<List<Message>>((ref) {
  final chatService = ref.watch(chatServiceProvider);
  return chatService.messagesStream;
});
*/

// 🔹 Family Modifier - Parametreli provider
/*
final userByIdProvider = FutureProvider.family<User, String>((ref, userId) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.getUserById(userId);
});

// Kullanım: ref.watch(userByIdProvider('123'))
*/

// 🔹 Riverpod Widget Kullanımı
class RiverpodCounterWidget extends StatelessWidget {
  const RiverpodCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ConsumerWidget veya Consumer widget kullanılabilir
    return Consumer(
      builder: (context, ref, child) {
        // final count = ref.watch(counterProvider);
        
        return Column(
          children: [
            // Text('Count: $count'),
            ElevatedButton(
              onPressed: () {
                // ref.read(counterProvider.notifier).state++;
              },
              child: const Text('Artır'),
            ),
          ],
        );
      },
    );
  }
}

/*
// ConsumerWidget kullanımı
class RiverpodCounterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    
    return Scaffold(
      body: Center(
        child: Text('Count: $count'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).state++,
        child: Icon(Icons.add),
      ),
    );
  }
}

// ConsumerStatefulWidget kullanımı
class RiverpodCounterPage2 extends ConsumerStatefulWidget {
  @override
  ConsumerState<RiverpodCounterPage2> createState() => _RiverpodCounterPage2State();
}

class _RiverpodCounterPage2State extends ConsumerState<RiverpodCounterPage2> {
  @override
  void initState() {
    super.initState();
    // ref erişimi var
  }
  
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    return Text('$count');
  }
}
*/

/*
⚠️ MÜLAKAT SORUSU: ref.watch vs ref.read vs ref.listen farkı?

- ref.watch: Provider'ı dinler, değiştiğinde rebuild eder
  Kullanım: build metodu içinde

- ref.read: Sadece değer okur, rebuild etmez
  Kullanım: Event handler'larda, initState'de

- ref.listen: Side-effect'ler için dinler (snackbar, navigation)
  Kullanım: build içinde ama rebuild yapmaz

Örnek:
@override
Widget build(BuildContext context, WidgetRef ref) {
  final count = ref.watch(counterProvider); // UI için
  
  ref.listen(counterProvider, (prev, next) {
    if (next > 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('10\'u geçtiniz!')),
      );
    }
  });
  
  return ElevatedButton(
    onPressed: () => ref.read(counterProvider.notifier).state++,
    child: Text('$count'),
  );
}
*/

// ============================================
// 📌 BÖLÜM 6: BLOC (Business Logic Component)
// ============================================

/*
📦 Gerekli paketler:
   - flutter_bloc: ^8.x.x
   - bloc: ^8.x.x

🔹 BLoC Pattern Yapısı:
   1. Events - Kullanıcı aksiyonları (Input)
   2. States - UI durumları (Output)
   3. Bloc - İş mantığı (Event -> State dönüşümü)

🔹 BLoC Avantajları:
   - Separation of concerns (UI ve iş mantığı ayrı)
   - Test edilebilirlik (Pure functions)
   - Reactive programming (Stream tabanlı)
   - Scalability (Büyük projelerde ölçeklenebilir)
*/

// 🔹 Events Tanımlama
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}
class DecrementEvent extends CounterEvent {}
class ResetEvent extends CounterEvent {}
class SetValueEvent extends CounterEvent {
  final int value;
  SetValueEvent(this.value);
}

// 🔹 States Tanımlama
abstract class CounterState {
  final int count;
  const CounterState(this.count);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterLoaded extends CounterState {
  const CounterLoaded(super.count);
}

// 🔹 Daha Kapsamlı State Örneği
enum TodoStatus { initial, loading, success, failure }

class TodoBlocState {
  final List<Todo> todos;
  final TodoStatus status;
  final String? errorMessage;
  
  const TodoBlocState({
    this.todos = const [],
    this.status = TodoStatus.initial,
    this.errorMessage,
  });
  
  TodoBlocState copyWith({
    List<Todo>? todos,
    TodoStatus? status,
    String? errorMessage,
  }) {
    return TodoBlocState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}

// 🔹 BLoC Tanımlama
/*
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    
    on<IncrementEvent>((event, emit) {
      emit(CounterLoaded(state.count + 1));
    });
    
    on<DecrementEvent>((event, emit) {
      emit(CounterLoaded(state.count - 1));
    });
    
    on<ResetEvent>((event, emit) {
      emit(const CounterLoaded(0));
    });
    
    on<SetValueEvent>((event, emit) {
      emit(CounterLoaded(event.value));
    });
  }
}
*/

// 🔹 Async BLoC Örneği
/*
// Events
abstract class UserEvent {}
class LoadUsersEvent extends UserEvent {}
class RefreshUsersEvent extends UserEvent {}
class AddUserEvent extends UserEvent {
  final String name;
  final String email;
  AddUserEvent({required this.name, required this.email});
}

// States
abstract class UserState {}
class UserInitial extends UserState {}
class UserLoading extends UserState {}
class UserLoaded extends UserState {
  final List<User> users;
  UserLoaded(this.users);
}
class UserError extends UserState {
  final String message;
  UserError(this.message);
}

// Bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  
  UserBloc({required this.userRepository}) : super(UserInitial()) {
    
    on<LoadUsersEvent>((event, emit) async {
      emit(UserLoading());
      
      try {
        final users = await userRepository.getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
    
    on<RefreshUsersEvent>((event, emit) async {
      try {
        final users = await userRepository.getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
    
    on<AddUserEvent>((event, emit) async {
      final currentState = state;
      if (currentState is UserLoaded) {
        try {
          final newUser = await userRepository.addUser(event.name, event.email);
          emit(UserLoaded([...currentState.users, newUser]));
        } catch (e) {
          emit(UserError(e.toString()));
        }
      }
    });
  }
}
*/

// 🔹 BLoC Widget'ları Kullanımı
/*
// BlocProvider - BLoC'u widget tree'ye sağlar
BlocProvider(
  create: (context) => CounterBloc(),
  child: CounterPage(),
)

// MultiBlocProvider - Birden fazla BLoC
MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => CounterBloc()),
    BlocProvider(create: (_) => UserBloc(userRepository: getIt())),
  ],
  child: MyApp(),
)

// BlocBuilder - State değişikliklerinde rebuild
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    return Text('Count: ${state.count}');
  },
)

// BlocBuilder with buildWhen - Koşullu rebuild
BlocBuilder<CounterBloc, CounterState>(
  buildWhen: (previous, current) {
    return previous.count != current.count; // Sadece count değiştiğinde
  },
  builder: (context, state) {
    return Text('Count: ${state.count}');
  },
)

// BlocListener - Side-effect'ler için (navigation, snackbar)
BlocListener<UserBloc, UserState>(
  listener: (context, state) {
    if (state is UserError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  child: Container(),
)

// BlocListener with listenWhen - Koşullu listen
BlocListener<UserBloc, UserState>(
  listenWhen: (previous, current) {
    return current is UserError; // Sadece error durumunda
  },
  listener: (context, state) {
    // Handle error
  },
  child: Container(),
)

// BlocConsumer - Builder + Listener birlikte
BlocConsumer<UserBloc, UserState>(
  listener: (context, state) {
    if (state is UserError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  builder: (context, state) {
    if (state is UserLoading) {
      return CircularProgressIndicator();
    }
    if (state is UserLoaded) {
      return ListView.builder(
        itemCount: state.users.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(state.users[index].name),
        ),
      );
    }
    return Container();
  },
)

// BLoC'a erişim
context.read<CounterBloc>().add(IncrementEvent());
context.watch<CounterBloc>().state;

// Extension metotları
context.select<CounterBloc, int>((bloc) => bloc.state.count);
*/

// 🔹 Cubit - Basitleştirilmiş BLoC (Event yok)
/*
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0); // Başlangıç state'i
  
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void reset() => emit(0);
}

// Kullanım aynı:
BlocProvider(
  create: (_) => CounterCubit(),
  child: BlocBuilder<CounterCubit, int>(
    builder: (context, count) {
      return Text('$count');
    },
  ),
)

// Event tetikleme
context.read<CounterCubit>().increment();
*/

// ============================================
// 📌 BÖLÜM 7: STATE MANAGEMENT KARŞILAŞTIRMASI
// ============================================

/*
┌─────────────────────┬──────────────┬─────────────┬─────────────────┐
│                     │   Provider   │  Riverpod   │      BLoC       │
├─────────────────────┼──────────────┼─────────────┼─────────────────┤
│ Öğrenme Eğrisi      │    Kolay     │    Orta     │      Zor        │
│ Boilerplate Kod     │    Az        │    Az       │      Çok        │
│ Test Edilebilirlik  │    Orta      │  Çok İyi    │    Çok İyi      │
│ Ölçeklenebilirlik   │    Orta      │    İyi      │    Çok İyi      │
│ Performans          │    İyi       │  Çok İyi    │    Çok İyi      │
│ Context Bağımlılığı │    Evet      │   Hayır     │      Evet       │
│ Compile-time Safety │    Hayır     │    Evet     │      Hayır      │
│ Proje Boyutu        │  Küçük/Orta  │  Orta/Büyük │ Büyük/Enterprise│
│ Ekip Boyutu         │    Küçük     │    Orta     │      Büyük      │
│ DevTools Desteği    │    Evet      │    Evet     │      Evet       │
└─────────────────────┴──────────────┴─────────────┴─────────────────┘

📋 NE ZAMAN HANGİSİ?

🔹 setState:
   - Tek widget'a ait basit state
   - Örnek: Form validation, tab selection
   
🔹 Provider:
   - Küçük-orta projeler
   - Flutter'a yeni başlayanlar
   - Basit dependency injection
   
🔹 Riverpod:
   - Orta-büyük projeler
   - Test öncelikli geliştirme
   - Daha fazla type safety isteyenler
   - Code generation isteyenler
   
🔹 BLoC:
   - Enterprise projeler
   - Büyük ekipler
   - Strict architecture gerekliliği
   - Event-driven yapı gerektiğinde
*/

// ============================================
// 📌 BÖLÜM 8: MÜLAKAT SORULARI
// ============================================

/*
❓ SIKÇA SORULAN STATE MANAGEMENT SORULARI:

1. State nedir ve neden önemlidir?
   - Uygulamanın o anki verisi
   - UI'ın nasıl görüneceğini belirler
   - Doğru yönetim performans ve maintainability için kritik

2. setState ne zaman kullanılır?
   - Küçük, local state için
   - Tek widget scope'unda
   - Basit counter, form validation gibi

3. Provider'da watch vs read farkı nedir?
   - watch: Dinler, rebuild eder
   - read: Sadece okur, rebuild etmez

4. Riverpod'un Provider'dan farkı nedir?
   - Compile-time safety
   - Context bağımsız
   - Auto-dispose desteği
   - Aynı tipte birden fazla provider

5. BLoC'ta Event ve State farkı nedir?
   - Event: Input (kullanıcı aksiyonu)
   - State: Output (UI durumu)

6. Cubit vs Bloc farkı nedir?
   - Cubit: Metot çağırarak state değiştirir
   - Bloc: Event göndererek state değiştirir
   - Cubit daha basit, Bloc daha traceability

7. BlocBuilder vs BlocListener farkı nedir?
   - BlocBuilder: UI rebuild için
   - BlocListener: Side-effect için (snackbar, navigation)

8. ChangeNotifier ne zaman kullanılır?
   - Provider ile beraber
   - Basit-orta karmaşıklıkta state'ler için
   - notifyListeners() ile dinleyicilere haber verir

9. InheritedWidget nedir?
   - Widget tree'de veri paylaşımı
   - Provider, Riverpod gibi kütüphanelerin temeli
   - of(context) pattern ile kullanılır

10. Immutability state management'ta neden önemli?
    - Değişiklik tespiti kolay
    - Debug kolaylığı
    - Undo/Redo implementasyonu
    - Concurrent safety
*/
