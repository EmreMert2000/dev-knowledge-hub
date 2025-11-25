//Firebase Entegrasyonu için gerekli fonksiyonlar burada tanımlanır.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';
import 'package:path/path.dart' as path;

//Firebase Başlatma Fonksiyonu
Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
}

//Firebase Authentication - Kullanıcı Kaydı
Future<User?> registerWithEmailAndPassword(
  String email,
  String password,
) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  } catch (e) {
    print('Kayıt Hatası: $e');
    return null;
  }
}

//Firebase Authentication - Kullanıcı Girişi
Future<User?> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  } catch (e) {
    print('Giriş Hatası: $e');
    return null;
  }
}

//Firebase Firestore - Veri Ekleme
Future<void> addDataToFirestore(
  String collection,
  Map<String, dynamic> data,
) async {
  try {
    await FirebaseFirestore.instance.collection(collection).add(data);
  } catch (e) {
    print('Veri Ekleme Hatası: $e');
  }
}

//Firebase Firestore - Veri Okuma
Future<QuerySnapshot> getDataFromFirestore(String collection) async {
  try {
    return await FirebaseFirestore.instance.collection(collection).get();
  } catch (e) {
    print('Veri Okuma Hatası: $e');
    rethrow;
  }
}

//Firebase Storage - Dosya Yükleme
Future<String?> uploadFileToFirebaseStorage(
  File file,
  String storagePath,
) async {
  try {
    String fileName = path.basename(file.path);
    Reference storageRef = FirebaseStorage.instance.ref().child(
      '$storagePath/$fileName',
    );
    UploadTask uploadTask = storageRef.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print('Dosya Yükleme Hatası: $e');
    return null;
  }
}

//Firebase Storage - Dosya İndirme URL'si Alma
Future<String?> getFileDownloadUrl(String storagePath) async {
  try {
    Reference storageRef = FirebaseStorage.instance.ref().child(storagePath);
    String downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print('Dosya İndirme URL Alma Hatası: $e');
    return null;
  }
}

//Firebase Authentication - Kullanıcı Çıkışı
Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print('Çıkış Hatası: $e');
  }
}

//Firebase Firestore - Veri Güncelleme
Future<void> updateDataInFirestore(
  String collection,
  String docId,
  Map<String, dynamic> data,
) async {
  try {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(docId)
        .update(data);
  } catch (e) {
    print('Veri Güncelleme Hatası: $e');
  }
}

//Firebase Firestore - Veri Silme
Future<void> deleteDataFromFirestore(String collection, String docId) async {
  try {
    await FirebaseFirestore.instance.collection(collection).doc(docId).delete();
  } catch (e) {
    print('Veri Silme Hatası: $e');
  }
}

//Firebase giriş yapma durumunu dinleme
Stream<User?> authStateChanges() {
  return FirebaseAuth.instance.authStateChanges();
}

//Mevcut kullanıcıyı alma
User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}
