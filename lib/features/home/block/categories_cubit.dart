import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/features/home/block/catrgories_cubit_state.dart';

class CategoriesCubit extends Cubit<CategoriesCubitState> {
  CategoriesCubit() : super(CategoriesCubitInitial());

  chickIsClicked(chicked1, chicked2, chicked3) {
    emit(GetCategoriesCubit(
      state.isChicked1 = chicked1,
      state.isChicked2 = chicked2,
      state.isChicked3 = chicked3,
    ));
  }
}
