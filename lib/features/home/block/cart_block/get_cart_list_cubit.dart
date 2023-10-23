import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/core/utils/constes.dart';
import 'package:stytore/features/home/block/cart_block/get_cart_list_cubit_state.dart';

class GetCartListDataCubit extends Cubit<GetCartListCubitState> {
  GetCartListDataCubit() : super(GetCartListInitialCubit());

  getCartList() async {
    QuerySnapshot cartListsnapshot = await FirebaseFirestore.instance
        .collection(usersCollectionName)
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection(cartCollectionName)
        .get();
    final List cartList = cartListsnapshot.docs.map((e) => e.data()).toList();

    emit(SetCartListData(cartList));
  }

  deleteItem(String id) async {
    await FirebaseFirestore.instance
        .collection(usersCollectionName)
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection(cartCollectionName)
        .doc(id)
        .delete();
  }

  updatePrice(String id, String price) async {
    await FirebaseFirestore.instance
        .collection(usersCollectionName)
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection(cartCollectionName)
        .doc(id)
        .update({"price": price});
  }
}
