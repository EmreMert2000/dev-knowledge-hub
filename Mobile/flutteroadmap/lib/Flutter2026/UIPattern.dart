// ============================================
// 🎯 CODER BYTE MÜLAKAT HAZIRLIK
// 📚 FLUTTER UI PATTERNS & WIDGETS
// ============================================
// Bu dosya Flutter UI pattern'leri ve widget'ları
// için detaylı açıklamalar ve örnekler içerir.
// ============================================

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ============================================
// 📌 BÖLÜM 1: TEMEL WIDGET'LAR
// ============================================

// --------------------------------------------
// 1.1 LAYOUT WIDGET'LARI
// --------------------------------------------

class LayoutWidgetsExample extends StatelessWidget {
  const LayoutWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Container - En çok kullanılan layout widget
        Container(
          width: 200,
          height: 100,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.purple],
            ),
          ),
          child: const Text('Container'),
        ),
        
        // 🔹 Row - Yatay düzenleme
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: 50, height: 50, color: Colors.red),
            Container(width: 50, height: 50, color: Colors.green),
            Container(width: 50, height: 50, color: Colors.blue),
          ],
        ),
        
        // 🔹 Column - Dikey düzenleme
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(height: 30, color: Colors.red),
            Container(height: 30, color: Colors.green),
            Container(height: 30, color: Colors.blue),
          ],
        ),
        
        // 🔹 Stack - Üst üste bindirme
        Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 150, height: 150, color: Colors.red),
            Container(width: 100, height: 100, color: Colors.green),
            Container(width: 50, height: 50, color: Colors.blue),
            // Positioned ile özel konumlama
            const Positioned(
              top: 10,
              right: 10,
              child: Icon(Icons.close),
            ),
          ],
        ),
        
        // 🔹 Wrap - Satır dolunca alta geç
        Wrap(
          spacing: 8,        // Yatay boşluk
          runSpacing: 8,     // Dikey boşluk
          children: List.generate(10, (index) {
            return Chip(label: Text('Chip $index'));
          }),
        ),
      ],
    );
  }
}

// --------------------------------------------
// 1.2 FLEXIBLE LAYOUT WIDGET'LARI
// --------------------------------------------

class FlexibleLayoutExample extends StatelessWidget {
  const FlexibleLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Expanded - Kalan alanı kaplar
        Row(
          children: [
            Container(width: 100, height: 50, color: Colors.red),
            Expanded(
              flex: 2, // 2 birim
              child: Container(height: 50, color: Colors.green),
            ),
            Expanded(
              flex: 1, // 1 birim
              child: Container(height: 50, color: Colors.blue),
            ),
          ],
        ),
        
        // 🔹 Flexible - İhtiyacı kadar alan kaplar
        Row(
          children: [
            Flexible(
              fit: FlexFit.loose, // İhtiyacı kadar
              child: Container(width: 100, height: 50, color: Colors.orange),
            ),
            Flexible(
              fit: FlexFit.tight, // Tüm alanı kullan (Expanded gibi)
              child: Container(height: 50, color: Colors.purple),
            ),
          ],
        ),
        
        // 🔹 Spacer - Boşluk bırakır
        Row(
          children: [
            const Text('Sol'),
            const Spacer(flex: 1),
            const Text('Orta'),
            const Spacer(flex: 2),
            const Text('Sağ'),
          ],
        ),
        
        // 🔹 AspectRatio - En-boy oranı
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(color: Colors.cyan),
        ),
        
        // 🔹 FractionallySizedBox - Parent'ın yüzdesi
        FractionallySizedBox(
          widthFactor: 0.8,  // %80
          heightFactor: 0.5, // %50
          child: Container(color: Colors.amber),
        ),
        
        // 🔹 ConstrainedBox - Min/Max kısıtlamalar
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 100,
            maxWidth: 200,
            minHeight: 50,
            maxHeight: 100,
          ),
          child: Container(color: Colors.teal),
        ),
        
        // 🔹 SizedBox - Sabit boyut
        const SizedBox(
          width: 100,
          height: 50,
          child: Placeholder(),
        ),
        
        // 🔹 SizedBox.expand - Tüm alanı kapla
        SizedBox.expand(
          child: Container(color: Colors.pink.withOpacity(0.3)),
        ),
      ],
    );
  }
}

// --------------------------------------------
// 1.3 SCROLLABLE WIDGET'LAR
// --------------------------------------------

class ScrollableWidgetsExample extends StatelessWidget {
  const ScrollableWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 SingleChildScrollView - Tek child kaydırma
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(20, (index) {
              return Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(8),
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }),
          ),
        ),
        
        // 🔹 ListView - Liste görünümü
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              ListTile(title: const Text('Item 1')),
              ListTile(title: const Text('Item 2')),
              ListTile(title: const Text('Item 3')),
            ],
          ),
        ),
        
        // 🔹 ListView.builder - Lazy loading (Performanslı)
        Expanded(
          child: ListView.builder(
            itemCount: 1000,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(child: Text('$index')),
                title: Text('Item $index'),
                subtitle: Text('Subtitle $index'),
                trailing: const Icon(Icons.chevron_right),
              );
            },
          ),
        ),
        
        // 🔹 ListView.separated - Ayırıcılı liste
        Expanded(
          child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(title: Text('Item $index'));
            },
          ),
        ),
        
        // 🔹 GridView.builder - Performanslı grid
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(child: Text('$index')),
              );
            },
          ),
        ),
        
        // 🔹 GridView.count - Sabit sütun sayısı
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(9, (index) {
            return Container(
              margin: const EdgeInsets.all(4),
              color: Colors.orange,
              child: Center(child: Text('$index')),
            );
          }),
        ),
      ],
    );
  }
}

// ============================================
// 📌 BÖLÜM 2: CUSTOM SCROLL VIEW & SLIVERS
// ============================================

class SliverExample extends StatelessWidget {
  const SliverExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 🔹 SliverAppBar - Kaydırılabilir app bar
        SliverAppBar(
          expandedHeight: 200,
          floating: false,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Sliver App Bar'),
            background: Image.network(
              'https://picsum.photos/400/200',
              fit: BoxFit.cover,
            ),
          ),
        ),
        
        // 🔹 SliverToBoxAdapter - Tek widget için
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('Header Section'),
          ),
        ),
        
        // 🔹 SliverList - Liste
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                title: Text('Sliver List Item $index'),
              );
            },
            childCount: 10,
          ),
        ),
        
        // 🔹 SliverGrid - Grid
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(child: Text('$index')),
              );
            },
            childCount: 20,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
        ),
        
        // 🔹 SliverPersistentHeader - Sticky header
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverHeaderDelegate(
            minHeight: 50,
            maxHeight: 100,
            child: Container(
              color: Colors.blue,
              child: const Center(child: Text('Sticky Header')),
            ),
          ),
        ),
        
        // 🔹 SliverFillRemaining - Kalan alanı doldur
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('Footer')),
        ),
      ],
    );
  }
}

// Sliver Persistent Header Delegate
class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

// ============================================
// 📌 BÖLÜM 3: RESPONSIVE DESIGN
// ============================================

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 🔹 Responsive breakpoints
          if (constraints.maxWidth >= 1200) {
            return _buildDesktopLayout();
          } else if (constraints.maxWidth >= 600) {
            return _buildTabletLayout();
          } else {
            return _buildMobileLayout();
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Sidebar
        Container(
          width: 250,
          color: Colors.grey[200],
          child: const _NavigationMenu(),
        ),
        // Main content
        Expanded(
          child: Container(
            color: Colors.white,
            child: const Center(child: Text('Desktop Content')),
          ),
        ),
        // Right panel
        Container(
          width: 300,
          color: Colors.grey[100],
          child: const Center(child: Text('Details Panel')),
        ),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        // Compact sidebar
        NavigationRail(
          selectedIndex: 0,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.search),
              label: Text('Search'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
          ],
          onDestinationSelected: (index) {},
        ),
        // Main content
        const Expanded(
          child: Center(child: Text('Tablet Content')),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      body: const Center(child: Text('Mobile Content')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) {},
      ),
    );
  }
}

class _NavigationMenu extends StatelessWidget {
  const _NavigationMenu();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text('Search'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
      ],
    );
  }
}

// 🔹 MediaQuery Kullanımı
class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final orientation = MediaQuery.of(context).orientation;
    final brightness = MediaQuery.of(context).platformBrightness;
    final textScale = MediaQuery.of(context).textScaler;
    
    return Column(
      children: [
        Text('Width: ${size.width}'),
        Text('Height: ${size.height}'),
        Text('Top Padding: ${padding.top}'), // SafeArea için
        Text('Bottom Padding: ${padding.bottom}'),
        Text('Orientation: $orientation'),
        Text('Brightness: $brightness'),
        Text('Text Scale: $textScale'),
      ],
    );
  }
}

// ============================================
// 📌 BÖLÜM 4: FORM & INPUT WIDGET'LARI
// ============================================

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String? _selectedCountry;
  bool _agreeTerms = false;
  double _sliderValue = 50;
  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔹 TextFormField - Email
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'ornek@email.com',
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email boş olamaz';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Geçerli bir email girin';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          // 🔹 TextFormField - Password
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Şifre',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Şifre boş olamaz';
              }
              if (value.length < 6) {
                return 'Şifre en az 6 karakter olmalı';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          // 🔹 DropdownButtonFormField
          DropdownButtonFormField<String>(
            value: _selectedCountry,
            decoration: InputDecoration(
              labelText: 'Ülke',
              prefixIcon: const Icon(Icons.flag),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'TR', child: Text('Türkiye')),
              DropdownMenuItem(value: 'US', child: Text('Amerika')),
              DropdownMenuItem(value: 'DE', child: Text('Almanya')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedCountry = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Lütfen bir ülke seçin';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          // 🔹 CheckboxListTile
          CheckboxListTile(
            title: const Text('Şartları kabul ediyorum'),
            value: _agreeTerms,
            onChanged: (value) {
              setState(() {
                _agreeTerms = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          
          // 🔹 Slider
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Değer: ${_sliderValue.round()}'),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 10,
                label: _sliderValue.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // 🔹 Submit Button
          ElevatedButton(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Gönder'),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!_agreeTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Şartları kabul etmelisiniz')),
        );
        return;
      }
      
      // Form geçerli
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form gönderildi!')),
      );
    }
  }
}

// ============================================
// 📌 BÖLÜM 5: NAVIGATION PATTERNS
// ============================================

// 🔹 Tab Navigation
class TabNavigationExample extends StatelessWidget {
  const TabNavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Navigation'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Home Tab')),
            Center(child: Text('Search Tab')),
            Center(child: Text('Profile Tab')),
          ],
        ),
      ),
    );
  }
}

// 🔹 Drawer Navigation
class DrawerNavigationExample extends StatelessWidget {
  const DrawerNavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Navigation')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            const UserAccountsDrawerHeader(
              accountName: Text('Emre Mert'),
              accountEmail: Text('emre@example.com'),
              currentAccountPicture: CircleAvatar(
                child: Text('E'),
              ),
            ),
            // Menu items
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Ana Sayfa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ayarlar'),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Çıkış'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Content')),
    );
  }
}

// ============================================
// 📌 BÖLÜM 6: DIALOG & BOTTOM SHEET
// ============================================

class DialogExamples extends StatelessWidget {
  const DialogExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 🔹 AlertDialog
        ElevatedButton(
          onPressed: () => _showAlertDialog(context),
          child: const Text('Alert Dialog'),
        ),
        
        // 🔹 SimpleDialog
        ElevatedButton(
          onPressed: () => _showSimpleDialog(context),
          child: const Text('Simple Dialog'),
        ),
        
        // 🔹 Bottom Sheet
        ElevatedButton(
          onPressed: () => _showBottomSheet(context),
          child: const Text('Bottom Sheet'),
        ),
        
        // 🔹 Modal Bottom Sheet
        ElevatedButton(
          onPressed: () => _showModalBottomSheet(context),
          child: const Text('Modal Bottom Sheet'),
        ),
        
        // 🔹 Custom Dialog
        ElevatedButton(
          onPressed: () => _showCustomDialog(context),
          child: const Text('Custom Dialog'),
        ),
      ],
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Başlık'),
        content: const Text('Bu bir alert dialog içeriğidir.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Seçiniz'),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'option1'),
            child: const Text('Seçenek 1'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'option2'),
            child: const Text('Seçenek 2'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'option3'),
            child: const Text('Seçenek 3'),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
      (context) => Container(
        height: 200,
        color: Colors.white,
        child: const Center(child: Text('Bottom Sheet')),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Full height için
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.25,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return ListView.builder(
            controller: scrollController,
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(title: Text('Item $index'));
            },
          );
        },
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 64,
              ),
              const SizedBox(height: 16),
              const Text(
                'Başarılı!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text('İşlem başarıyla tamamlandı.'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Tamam'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================
// 📌 BÖLÜM 7: ANİMASYONLAR
// ============================================

// 🔹 Implicit Animation (Kolay)
class ImplicitAnimationExample extends StatefulWidget {
  const ImplicitAnimationExample({super.key});

  @override
  State<ImplicitAnimationExample> createState() =>
      _ImplicitAnimationExampleState();
}

class _ImplicitAnimationExampleState extends State<ImplicitAnimationExample> {
  bool _expanded = false;
  double _opacity = 1.0;
  Color _color = Colors.blue;
  double _rotation = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 AnimatedContainer
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: _expanded ? 200 : 100,
          height: _expanded ? 200 : 100,
          color: _color,
          transform: Matrix4.rotationZ(_rotation),
          child: const Center(child: Text('Animated')),
        ),
        
        // 🔹 AnimatedOpacity
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _opacity,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
        
        // 🔹 AnimatedPositioned (Stack içinde)
        // 🔹 AnimatedAlign
        // 🔹 AnimatedPadding
        // 🔹 AnimatedDefaultTextStyle
        // 🔹 AnimatedCrossFade
        
        ElevatedButton(
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
              _opacity = _opacity == 1.0 ? 0.5 : 1.0;
              _color = _color == Colors.blue ? Colors.green : Colors.blue;
              _rotation = _rotation == 0 ? 0.5 : 0;
            });
          },
          child: const Text('Animate'),
        ),
      ],
    );
  }
}

// 🔹 Explicit Animation (Kontrollü)
class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({super.key});

  @override
  State<ExplicitAnimationExample> createState() =>
      _ExplicitAnimationExampleState();
}

class _ExplicitAnimationExampleState extends State<ExplicitAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(_controller);
    
    // Tekrarlayan animasyon
    // _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: 100,
                height: 100,
                color: _colorAnimation.value,
                child: child,
              ),
            );
          },
          child: const Center(child: Text('Explicit')),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _controller.forward(),
              child: const Text('Forward'),
            ),
            ElevatedButton(
              onPressed: () => _controller.reverse(),
              child: const Text('Reverse'),
            ),
            ElevatedButton(
              onPressed: () => _controller.reset(),
              child: const Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}

// 🔹 Hero Animation
class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const HeroDetailPage()),
        );
      },
      child: Hero(
        tag: 'hero-image',
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.star, color: Colors.white, size: 50),
        ),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Center(
        child: Hero(
          tag: 'hero-image',
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.star, color: Colors.white, size: 150),
          ),
        ),
      ),
    );
  }
}

// ============================================
// 📌 BÖLÜM 8: UI PATTERN'LERİ
// ============================================

/*
🔹 POPULAR UI PATTERNS:

1. Master-Detail Pattern
   - Liste -> Detay navigasyonu
   - Tablet'te yan yana gösterim
   
2. Infinite Scroll Pattern
   - Pagination ile lazy loading
   - ScrollController ile scroll dinleme
   
3. Pull-to-Refresh Pattern
   - RefreshIndicator widget
   
4. Search Pattern
   - SearchDelegate ile arama
   
5. Skeleton Loading Pattern
   - Shimmer efekti ile yükleme
   
6. Empty State Pattern
   - Liste boş iken gösterilecek UI
   
7. Error State Pattern
   - Hata durumu UI'ı
   - Retry butonu
*/

// 🔹 Pull to Refresh
class PullToRefreshExample extends StatefulWidget {
  const PullToRefreshExample({super.key});

  @override
  State<PullToRefreshExample> createState() => _PullToRefreshExampleState();
}

class _PullToRefreshExampleState extends State<PullToRefreshExample> {
  List<String> _items = List.generate(20, (i) => 'Item $i');

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _items = List.generate(20, (i) => 'Refreshed Item $i');
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_items[index]));
        },
      ),
    );
  }
}

// 🔹 Infinite Scroll (Pagination)
class InfiniteScrollExample extends StatefulWidget {
  const InfiniteScrollExample({super.key});

  @override
  State<InfiniteScrollExample> createState() => _InfiniteScrollExampleState();
}

class _InfiniteScrollExampleState extends State<InfiniteScrollExample> {
  final ScrollController _scrollController = ScrollController();
  List<String> _items = [];
  bool _isLoading = false;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _loadMore();
    
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMore() async {
    if (_isLoading) return;
    
    setState(() {
      _isLoading = true;
    });
    
    // API simülasyonu
    await Future.delayed(const Duration(seconds: 1));
    
    setState(() {
      _items.addAll(
        List.generate(20, (i) => 'Item ${_items.length + i}'),
      );
      _page++;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _items.length + 1,
      itemBuilder: (context, index) {
        if (index == _items.length) {
          return _isLoading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox();
        }
        return ListTile(title: Text(_items[index]));
      },
    );
  }
}

// ============================================
// 📌 BÖLÜM 9: MÜLAKAT SORULARI
// ============================================

/*
❓ SIKÇA SORULAN UI SORULARI:

1. StatelessWidget vs StatefulWidget farkı nedir?
   - Stateless: State yok, immutable, sadece build
   - Stateful: State var, mutable, lifecycle metodları

2. Widget, Element, RenderObject farkı nedir?
   - Widget: Yapılandırma (immutable blueprint)
   - Element: Widget instance (mutable, tree management)
   - RenderObject: Çizim ve layout (actual rendering)

3. Key nedir ve ne zaman kullanılır?
   - Widget'ları benzersiz tanımlar
   - Liste item'larında kullanılır
   - ValueKey, UniqueKey, GlobalKey türleri var

4. const constructor'ın avantajı nedir?
   - Widget yeniden build edilmez
   - Memory tasarrufu (tek instance)
   - Performans artışı

5. ListView vs ListView.builder farkı nedir?
   - ListView: Tüm child'ları oluşturur
   - ListView.builder: Lazy loading (görünür olanları oluşturur)

6. SafeArea ne işe yarar?
   - Notch, status bar, bottom indicator'dan korur
   - MediaQuery.of(context).padding değerlerini kullanır

7. MediaQuery vs LayoutBuilder farkı nedir?
   - MediaQuery: Tüm ekran boyutu
   - LayoutBuilder: Parent widget constraints

8. Sliver nedir?
   - CustomScrollView içinde kullanılan scrollable widget'lar
   - Daha fazla kontrol ve performans sağlar

9. AnimatedContainer vs TweenAnimationBuilder farkı?
   - AnimatedContainer: Implicit, basit
   - TweenAnimationBuilder: Daha fazla kontrol

10. Hero animation nedir?
    - Sayfa geçişlerinde widget animasyonu
    - Aynı tag ile eşleşen widget'lar arası
*/
