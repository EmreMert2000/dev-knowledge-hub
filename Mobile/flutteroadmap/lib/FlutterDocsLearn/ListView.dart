//ListView Kullanımı ve mantığı
import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Learn')),
      body: ListView(
        children: [
          ListTile(leading: Icon(Icons.map), title: Text('Map')),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Photo Album'),
          ),
          ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.blue, height: 100, width: 100),
              Container(color: Colors.green, height: 100, width: 100),
              Container(color: Colors.yellow, height: 100, width: 100),
            ],
          ),
        ],
      ),
    );
  }
}

//ListView, genellikle uzun listeler veya dinamik olarak oluşturulan içerikler için kullanılır.
//ListView, performans açısından optimize edilmiştir ve yalnızca görünür öğeleri yükler
//GridView ise ızgara düzeninde öğeleri görüntülemek için kullanılır.
//GridView, öğeleri satırlar ve sütunlar halinde düzenler ve genellikle resim galerileri veya ürün listeleri için kullanılır.
//GridView, ListView'dan farklı olarak, öğeleri ızgara şeklinde düzenler ve her satırda birden fazla öğe görüntüleyebilir.
//Builder, Count ve Extent gibi farklı GridView türleri vardır ve her biri farklı kullanım senaryoları için uygundur.
//Builder Widget'ı, dinamik olarak oluşturulan öğeler için kullanılırken
//LayoutBuilder, belirli bir düzen gerektiren durumlar için kullanılır.
//FutureBuilder, asenkron verilerle çalışırken kullanılır.
/*| Widget               | Tanım                            | Nerede Kullanılır?  |
| -------------------- | -------------------------------- | ------------------- |
| **ListView.builder** | Lazy list                        | Uzun item listeleri |
| **GridView.builder** | Lazy grid                        | Kart, galeri, ürün  |
| **Builder**          | Ek context üretir                | Snackbar, dialog    |
| **LayoutBuilder**    | Parent genişliğini ölçer         | Responsive UI       |
| **FutureBuilder**    | Future tamamlanınca UI günceller | API istekleri       | */
