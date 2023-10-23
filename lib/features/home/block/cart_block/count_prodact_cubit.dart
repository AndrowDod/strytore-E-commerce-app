import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/features/home/block/cart_block/count_prodact_cubit_state.dart';

class CountProdactCubit extends Cubit<CountProdactCubitState> {
  CountProdactCubit() : super(CountProdactInitialCubit());

  increment() {
    emit(SetCountProdact(state.count + 1));
  }

  decrement() {
    emit(SetCountProdact(state.count - 1));
  }
}
