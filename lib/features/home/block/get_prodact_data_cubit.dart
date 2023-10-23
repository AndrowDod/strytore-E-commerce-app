import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/core/utils/constes.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit_state.dart';

class GetProdactDataCubit extends Cubit<GetProdactDataCubitState> {
  GetProdactDataCubit() : super(GetProdactInitialCubit());

  List cartList = [];
  getCartList(String email) async {
    QuerySnapshot cartListsnapshot = await FirebaseFirestore.instance
        .collection(usersCollectionName)
        .doc(email)
        .collection(cartCollectionName)
        .get();
    cartList = cartListsnapshot.docs.map((e) => e.data()).toList();
  }

  Future getData() async {
    //get all data
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();
    final List allData = querySnapshot.docs.map((e) => e.data()).toList();

    // get summer data
    List summerProdact = [];
    for (var i = 0; i < allData.length; i++) {
      if (allData[i]["categories"][2] == true) {
        summerProdact.add(allData[i]);
      }
    }

    // get men data
    List menProdact = [];
    for (var i = 0; i < allData.length; i++) {
      if (allData[i]["categories"][0] == true) {
        menProdact.add(allData[i]);
      }
    }

    // get wommen data
    List wommenProdact = [];
    for (var i = 0; i < allData.length; i++) {
      if (allData[i]["categories"][1] == true) {
        wommenProdact.add(allData[i]);
      }
    }

    //get cart list

    emit(SetProdactData(summerProdact, menProdact, wommenProdact, allData));
  }
}
