import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stytore/core/utils/constes.dart';
import 'package:stytore/core/widgets/custom_dialog_widget.dart';

//get size functions

getSize(bool small, bool medium, bool large, bool xlarge) {
  return small == true
      ? "S"
      : medium == true
          ? "M"
          : large == true
              ? "L"
              : xlarge == true
                  ? "XL"
                  : "XXl";
}

//get id function

getId(prodactsstate, tabBarState, index) {
  return tabBarState.cont1 == true
      ? prodactsstate.prodactsList[index]["id"]
      : tabBarState.cont2 == true
          ? prodactsstate.summerList[index]["id"]
          : tabBarState.cont3 == true
              ? prodactsstate.menList[index]["id"]
              : prodactsstate.womenList[index]["id"];
}

// get image url function

getImageUrl(prodactsstate, tabBarState, index) {
  return tabBarState.cont1 == true
      ? prodactsstate.prodactsList[index]["image"]
      : tabBarState.cont2 == true
          ? prodactsstate.summerList[index]["image"]
          : tabBarState.cont3 == true
              ? prodactsstate.menList[index]["image"]
              : prodactsstate.womenList[index]["image"];
}

// get price function

getprice(prodactsstate, tabBarState, index) {
  return tabBarState.cont1 == true
      ? prodactsstate.prodactsList[index]["price"]
      : tabBarState.cont2 == true
          ? prodactsstate.summerList[index]["price"]
          : tabBarState.cont3 == true
              ? prodactsstate.menList[index]["price"]
              : prodactsstate.womenList[index]["price"];
}

// get name function

getName(prodactsstate, tabBarState, index) {
  return tabBarState.cont1 == true
      ? prodactsstate.prodactsList[index]["name"]
      : tabBarState.cont2 == true
          ? prodactsstate.summerList[index]["name"]
          : tabBarState.cont3 == true
              ? prodactsstate.menList[index]["name"]
              : prodactsstate.womenList[index]["name"];
}

//check if is in cart

Future<bool?> checkIfIsALreadyAdded(
    prodactsstate, tabBarState, state, index, context) async {
  bool? isAdded;
  QuerySnapshot<Map<String, dynamic>> documents = await FirebaseFirestore
      .instance
      .collection(usersCollectionName)
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection(cartCollectionName)
      .get();

  for (var i = 0; i < documents.docs.length; i++) {
    if (getId(prodactsstate, tabBarState, index) == documents.docs[i]["id"]) {
      // custom dialog

      showDialog(
        context: context,
        builder: (context) => const CustomDialogWidget(
          isSuccess: false,
          text: "this prodact is already in cart",
        ),
      );
      isAdded = false;
    }
  }
  return isAdded;
}

//check if is not in cart

checkIfIsNotAdded(prodactsstate, tabBarState, state, index, context) async {
  CollectionReference<Map<String, dynamic>> refrence = FirebaseFirestore
      .instance
      .collection(usersCollectionName)
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection(cartCollectionName);

  await refrence.add({
    "id": getId(prodactsstate, tabBarState, index),
    "size": getSize(state.small, state.medium, state.large, state.xlarge),
    "image": getImageUrl(prodactsstate, tabBarState, index),
    "price": getprice(prodactsstate, tabBarState, index),
    "name": getName(prodactsstate, tabBarState, index),
    "docId": "",
  }).then(
    (value) => refrence.doc(value.id).update(
      {"docId": value.id},
    ),
  );

  //custom dialog

  showDialog(
    context: context,
    builder: (context) => const CustomDialogWidget(
      isSuccess: true,
      text: "added to cart ✅",
    ),
  );
}
