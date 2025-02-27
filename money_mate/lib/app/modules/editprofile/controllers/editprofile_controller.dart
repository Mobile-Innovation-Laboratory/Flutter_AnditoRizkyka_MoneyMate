import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class EditprofileController extends GetxController {
  //TODO: Implement EditprofileController

  Future<void> updateUser(String userId, String newName) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'name': newName,
    });
  }

  Future<void> deleteUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
// 72eed4269d1d3a4260e97c51bf867187
      if (user != null) {
        await user.delete();

        var box = await Hive.openBox('userBox');
        box.put('isLoggedIn', false);
      } else {
        print("Tidak ada pengguna yang sedang login");
      }
    } catch (e) {
      print("Error menghapus akun: $e");
    }
  }
}
