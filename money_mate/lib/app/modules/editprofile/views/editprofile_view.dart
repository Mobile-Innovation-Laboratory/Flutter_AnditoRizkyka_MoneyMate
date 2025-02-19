import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_mate/app/widget/buttonApp.dart';
import 'package:money_mate/constant/constant.dart';

import '../controllers/editprofile_controller.dart';

class EditprofileView extends GetView<EditprofileController> {
  const EditprofileView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Edit Profile ',
            style: TypographyApp.titleField,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.h24,
            Center(
              child: Container(
                // padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Warna lebih soft
                  shape: BoxShape.circle, // Agar otomatis menjadi lingkaran
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      100), // Untuk menghindari sudut kasar
                  child: Image.asset(
                    'assets/images/cat.png',
                    width: 130, // Pastikan ukuran proporsional
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Gap.h20,
            Center(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return Column(
                      children: [
                        Text(
                          snapshot.data!['name'],
                          style: TypographyApp.mdblack.copyWith(
                            fontSize: 25,
                          ),
                        ),
                        Gap.h4,
                        Text(
                          snapshot.data!['email'],
                          style: TypographyApp.mdblack
                              .copyWith(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    );
                  }),
            ),
            Gap.h24,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                children: [
                  Text(
                    "Anda tidak bisa mengganti data lain selain nama panjang anda!",
                    style: TypographyApp.desc.copyWith(color: Colors.grey),
                  ),
                  Gap.h12,
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Ganti nama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Gap.h12,
                  Container(
                    width: double.infinity,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }
                          return Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Text(
                              snapshot.data!['email'],
                              style: TypographyApp.desc
                                  .copyWith(color: Colors.grey, fontSize: 16),
                            ),
                          );
                        }),
                  ),
                  Gap.h12,
                  ButtonApp(
                      action: "Update",
                      onTap: () {
                        controller.updateUser(
                          FirebaseAuth.instance.currentUser!.uid,
                          nameController.text,
                        );
                      }),
                  Gap.h12,
                  GestureDetector(
                    onDoubleTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadowColor: Colors.white,
                            title: Text("Delete Account",
                                style: TypographyApp.mdblack),
                            content: Text(
                                "Are you sure want to delete this account?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child:
                                    Text("Back", style: TypographyApp.mdblack),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: ColorApp.mainColor,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await controller.deleteUser();
                                  Get.offAllNamed('/signin');
                                },
                                child: Text("Confirm",
                                    style: TypographyApp.buttonText
                                        .copyWith(color: Colors.white)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      // alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red, // Warna background
                        borderRadius:
                            BorderRadius.circular(15), // Radius border
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Warna bayangan
                            blurRadius: 5, // Blur bayangan
                            offset: Offset(2, 2), // Arah bayangan
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.white,
                          ),
                          Gap.w12,
                          Text("Delete Account",
                              style: TypographyApp.mdblack
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
