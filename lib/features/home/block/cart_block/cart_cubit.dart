import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/features/home/block/cart_block/cart_cubit_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  CartCubit() : super(CartCubitInitial());

  getData(String id, String size) {
    emit(SetCartCubit(
      id,
      size,
    ));
  }

  test(String id) async {
    FirebaseFirestore.instance.doc(id);
  }
}
