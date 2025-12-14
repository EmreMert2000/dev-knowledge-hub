//SharedPrefenceses.dart

// shared_prefs_demo.dart
//
// ✅ Bu dosya SharedPreferences'ın ne olduğunu ve nasıl kullanıldığını pratik örneklerle gösterir.
// SharedPreferences: Cihazda küçük verileri (String, int, bool, double, List<String>) kalıcı saklamak için kullanılır.
// Örn: giriş durumu, tema seçimi, kullanıcı adı, onboarding tamamlandı mı gibi.
//
// ⚠️ Büyük veri / hassas veri (token vb.) için her zaman ideal olmayabilir.
// Daha güvenli saklama için: flutter_secure_storage tercih edilebilir.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ✅ SharedPreferences erişimini tek bir sınıfta toplamak iyi pratiktir.
/// Böylece her yerde key stringleriyle uğraşmazsın.
class PrefService {
  // ✅ Key'ler: Aynı isimle tekrar tekrar kullanacağız.
  static const _kIsLoggedIn = 'is_logged_in';
  static const _kUsername = 'username';
  static const _kCounter = 'counter';
  static const _kThemeDark = 'theme_dark';
  static const _kUserProfileJson = 'user_profile_json';
  static const _kFirstRun = 'first_run';

  /// ✅ SharedPreferences instance'ını alır.
  /// Not: Her çağrıda getInstance() çalışabilir, küçük projelerde sorun değil.
  static Future<SharedPreferences> _prefs() => SharedPreferences.getInstance();

  // ---------------------------
  // ✅ BASİT TİPLERİ KAYDET/OKU
  // ---------------------------

  /// ✅ Bool kaydetme örneği (Login durumu gibi)
  static Future<void> setLoggedIn(bool value) async {
    final p = await _prefs();
    await p.setBool(_kIsLoggedIn, value);
  }

  /// ✅ Bool okuma örneği
  static Future<bool> getLoggedIn() async {
    final p = await _prefs();
    return p.getBool(_kIsLoggedIn) ?? false; // yoksa false
  }

  /// ✅ String kaydetme örneği (kullanıcı adı gibi)
  static Future<void> setUsername(String value) async {
    final p = await _prefs();
    await p.setString(_kUsername, value);
  }

  /// ✅ String okuma örneği
  static Future<String?> getUsername() async {
    final p = await _prefs();
    return p.getString(_kUsername); // yoksa null
  }

  /// ✅ int kaydetme örneği (sayaç vb.)
  static Future<void> setCounter(int value) async {
    final p = await _prefs();
    await p.setInt(_kCounter, value);
  }

  /// ✅ int okuma örneği
  static Future<int> getCounter() async {
    final p = await _prefs();
    return p.getInt(_kCounter) ?? 0;
  }

  /// ✅ Sayaç artırma örneği (okuyup +1 yapıp tekrar kaydetme)
  static Future<int> incrementCounter() async {
    final current = await getCounter();
    final next = current + 1;
    await setCounter(next);
    return next;
  }

  /// ✅ Tema gibi bir ayar: bool saklama
  static Future<void> setDarkTheme(bool value) async {
    final p = await _prefs();
    await p.setBool(_kThemeDark, value);
  }

  static Future<bool> getDarkTheme() async {
    final p = await _prefs();
    return p.getBool(_kThemeDark) ?? false;
  }

  // ---------------------------
  // ✅ JSON / MAP SAKLAMA
  // ---------------------------

  /// ✅ SharedPreferences Map saklamaz, ama Map'i JSON string'e çevirip saklayabilirsin.
  static Future<void> setUserProfile(Map<String, dynamic> profile) async {
    final p = await _prefs();
    final jsonStr = jsonEncode(profile);
    await p.setString(_kUserProfileJson, jsonStr);
  }

  /// ✅ JSON string'i tekrar Map'e çevirerek okuruz.
  static Future<Map<String, dynamic>?> getUserProfile() async {
    final p = await _prefs();
    final jsonStr = p.getString(_kUserProfileJson);
    if (jsonStr == null) return null;
    return (jsonDecode(jsonStr) as Map).cast<String, dynamic>();
  }

  // ---------------------------
  // ✅ FIRST RUN / ONBOARDING
  // ---------------------------

  /// ✅ Uygulama ilk kez açılıyor mu?
  /// Default: true (hiç set edilmediyse)
  static Future<bool> isFirstRun() async {
    final p = await _prefs();
    return p.getBool(_kFirstRun) ?? true;
  }

  /// ✅ İlk açılış bitti -> false yap
  static Future<void> setFirstRunDone() async {
    final p = await _prefs();
    await p.setBool(_kFirstRun, false);
  }

  // ---------------------------
  // ✅ SİLME / TEMİZLEME
  // ---------------------------

  /// ✅ Tek bir key silme
  static Future<void> remove(String key) async {
    final p = await _prefs();
    await p.remove(key);
  }

  /// ✅ Tüm kayıtları temizleme (dikkat!)
  static Future<void> clearAll() async {
    final p = await _prefs();
    await p.clear();
  }
}

// ------------------------------------------------------
// ✅ Aşağıdaki kısım: Ekranda butonlarla canlı demo
// ------------------------------------------------------

class SharedPrefsDemoPage extends StatefulWidget {
  const SharedPrefsDemoPage({super.key});

  @override
  State<SharedPrefsDemoPage> createState() => _SharedPrefsDemoPageState();
}

class _SharedPrefsDemoPageState extends State<SharedPrefsDemoPage> {
  String _log = '';
  bool _loading = false;

  void _setLog(String msg) => setState(() => _log = msg);

  Future<void> _run(Future<void> Function() task) async {
    setState(() => _loading = true);
    try {
      await task();
    } catch (e) {
      _setLog('❌ Hata: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SharedPreferences Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ String kaydetme örneği
                          await PrefService.setUsername('Emre');
                          _setLog('✅ username kaydedildi: Emre');
                        }),
                  child: const Text('Username Kaydet'),
                ),
                ElevatedButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ String okuma örneği
                          final u = await PrefService.getUsername();
                          _setLog('📌 username okundu: ${u ?? "(yok)"}');
                        }),
                  child: const Text('Username Oku'),
                ),
                ElevatedButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ Bool kaydetme (login)
                          await PrefService.setLoggedIn(true);
                          _setLog('✅ is_logged_in = true');
                        }),
                  child: const Text('Login = true'),
                ),
                ElevatedButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ Bool okuma
                          final v = await PrefService.getLoggedIn();
                          _setLog('📌 is_logged_in: $v');
                        }),
                  child: const Text('Login Oku'),
                ),
                ElevatedButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ Sayaç artırma
                          final next = await PrefService.incrementCounter();
                          _setLog('✅ counter artırıldı: $next');
                        }),
                  child: const Text('Counter +1'),
                ),
                ElevatedButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ JSON(Map) kaydetme
                          await PrefService.setUserProfile({
                            'name': 'Emre',
                            'age': 24,
                            'city': 'İstanbul',
                          });
                          _setLog('✅ user_profile_json kaydedildi (JSON)');
                        }),
                  child: const Text('Profil Kaydet (JSON)'),
                ),
                ElevatedButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ JSON(Map) okuma
                          final profile = await PrefService.getUserProfile();
                          _setLog('📌 profil okundu: ${profile ?? "(yok)"}');
                        }),
                  child: const Text('Profil Oku (JSON)'),
                ),
                OutlinedButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ First run kontrolü
                          final first = await PrefService.isFirstRun();
                          _setLog('📌 first_run: $first');
                        }),
                  child: const Text('First Run?'),
                ),
                OutlinedButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ İlk çalıştırma bitti işaretle
                          await PrefService.setFirstRunDone();
                          _setLog('✅ first_run = false yapıldı');
                        }),
                  child: const Text('First Run Done'),
                ),
                TextButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ Tek key silme örneği
                          await PrefService.remove('username');
                          _setLog('🧹 username silindi');
                        }),
                  child: const Text('Username Sil'),
                ),
                TextButton(
                  onPressed: _loading
                      ? null
                      : () => _run(() async {
                          // ✅ Hepsini temizle
                          await PrefService.clearAll();
                          _setLog('🧹 Tüm SharedPreferences temizlendi');
                        }),
                  child: const Text('Hepsini Temizle'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _loading ? '⏳ işlem yapılıyor...' : 'Log:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _log.isEmpty ? 'Henüz işlem yok.' : _log,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
