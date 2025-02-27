import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddcontentController extends GetxController {
  //TODO: Implement AddcontentController
  var selectedDate = "Pilih Tanggal".obs;
  var priority = 0.obs;

  var selectedExpense = "Barang".obs; // State yang bisa berubah

  final List<String> expenses = ["Barang", "Pendidikan", "Travel"];

  void setSelectedExpense(String value) {
    selectedExpense.value = value;
  }

  Future<void> addData(name, type, date, priority, cost, desc) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("users") // Ambil koleksi users
          .doc(userId) // Pilih user tertentu
          .collection("activity")
          .add({
        "name": name,
        "type": type,
        "date": date,
        "priority": priority,
        "cost": cost,
        "desc": desc
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateCost(cost) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection("users").doc(userId).update({
      'cost': FieldValue.increment(
        int.parse(
          cost,
        ),
      ),
    });
  }
}
