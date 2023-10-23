import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/features/home/block/size_order_cubit_state.dart';

class SizeOrderCubit extends Cubit<SizeOrderCubitState> {
  SizeOrderCubit() : super(SizeOrderCubitInitial());

  chooseSmall() {
    emit(SetOrderBarCubit(
      state.small = true,
      state.medium = false,
      state.large = false,
      state.xlarge = false,
      state.xxlarge = false,
    ));
  }

  chooseMadium() {
    emit(SetOrderBarCubit(
      state.small = false,
      state.medium = true,
      state.large = false,
      state.xlarge = false,
      state.xxlarge = false,
    ));
  }

  chooseLarge() {
    emit(SetOrderBarCubit(
      state.small = false,
      state.medium = false,
      state.large = true,
      state.xlarge = false,
      state.xxlarge = false,
    ));
  }

  chooseXlarge() {
    emit(SetOrderBarCubit(
      state.small = false,
      state.medium = false,
      state.large = false,
      state.xlarge = true,
      state.xxlarge = false,
    ));
  }

  chooseXxlarge() {
    emit(SetOrderBarCubit(
      state.small = false,
      state.medium = false,
      state.large = false,
      state.xlarge = false,
      state.xxlarge = true,
    ));
  }

  disposeSizes() {
    emit(SetOrderBarCubit(
      state.small = false,
      state.medium = false,
      state.large = false,
      state.xlarge = false,
      state.xxlarge = false,
    ));
  }
}
