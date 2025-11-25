//Future,Stream,async,await

Future<String> fetchData() async {
  // Simulate a network request
  await Future.delayed(Duration(seconds: 2));
  return "Data loaded";
}

//Future kullanımı
void useFetchData() {
  fetchData().then((data) {
    print(data);
  });
}

//Async-Await kullanımı
// Asenkron fonksiyon içinde await ile bekleme
void useFetchDataAsync() async {
  String data = await fetchData();
  print(data);
}

// Future ile hata yakalama
Future<String> fetchDataWithError() async {
  await Future.delayed(Duration(seconds: 2));
  throw Exception("Failed to load data");
}

void useFetchDataWithError() {
  fetchDataWithError()
      .then((data) {
        print(data);
      })
      .catchError((error) {
        print("Error: $error");
      });
}

// Async-Await ile hata yakalama
void useFetchDataWithErrorAsync() async {
  try {
    String data = await fetchDataWithError();

    print(data);
  } catch (error) {
    print("Error: $error");
  }
}

// Stream Kullanımı
Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void useNumberStream() {
  Stream<int> stream = numberStream();
  stream.listen((number) {
    print("Stream number: $number");
  });
}

//Firebase kullanımı için asenkron işlemler yaygındır.
//Örneğin, veritabanından veri çekme işlemi asenkron olarak gerçekleştirilir.
// await FirebaseFirestore.instance.collection('users').get();

//FutureBuilder ve StreamBuilder widget'ları, asenkron verileri UI'da göstermek için kullanılır.
//Örneğin, bir FutureBuilder kullanarak veritabanından veri çekme işlemi
/*FutureBuilder(
  future: fetchData(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return Text("Loading...");
    return Text(snapshot.data.toString());
  },
)   */

//StreamBuilder kullanımı
/*StreamBuilder<int>(
  stream: numberStream(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return Text("Waiting for data...");
    return Text("Number: ${snapshot.data}");
  },
)   */  
// Asenkron işlemler, kullanıcı arayüzünün donmamasını sağlar ve uygulamanın daha akıcı çalışmasına yardımcı olur.
// Bu nedenle, Flutter uygulamalarında asenkron programlama yaygın olarak kullanılır.
//Future ile Stream arasındaki fark nedir?
// Future tek seferlik bir değeri temsil ederken, Stream sürekli veri akışını temsil eder.


