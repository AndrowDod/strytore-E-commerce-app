import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/features/home/block/prodacts_cubit_state.dart';
import 'package:stytore/features/home/widgets/add_new_prodact_widgets/add_decription_widget.dart';
import 'package:stytore/features/home/widgets/add_new_prodact_widgets/add_name_of_prodact_widget.dart';
import 'package:stytore/features/home/widgets/add_new_prodact_widgets/add_price_widget.dart';
import '../../../core/utils/constes.dart';

class ProdactsCubit extends Cubit<ProdactsCubitState> {
  ProdactsCubit() : super(ProdactsCubitInitial());

  setData(List categories, String url) async {
    FirebaseFirestore.instance.collection(collectionName).add({
      "name": AddNameWidgetState.nameController.text,
      "image": url,
      "desc": AddDecriptionWidgetState.descController.text,
      "categories": categories,
      "price": AddPriceWidgetState.priceController.text,
      "id": "",
    }).then((value) => FirebaseFirestore.instance
        .collection(collectionName)
        .doc(value.id)
        .update({"id": value.id}));
  }
}
