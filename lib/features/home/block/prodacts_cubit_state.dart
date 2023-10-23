abstract class ProdactsCubitState {
  String? name;
  String? imageUrl;
  String? price;
  String? desc;
  List? categories;

  ProdactsCubitState({
    this.name,
    this.imageUrl,
    this.price,
    this.desc,
    this.categories,
  });
}

class ProdactsCubitInitial extends ProdactsCubitState {
  ProdactsCubitInitial()
      : super(
          name: "",
          imageUrl: "",
          price: "",
          desc: "",
          categories: [],
        );
}

class GetProdactsCubit extends ProdactsCubitState {
  GetProdactsCubit(
    String namecubit,
    String imageUrlcubit,
    String pricecubit,
    String desccubit,
    List categoriescubit,
  ) : super(
          name: namecubit,
          imageUrl: imageUrlcubit,
          price: pricecubit,
          desc: desccubit,
          categories: categoriescubit,
        );
}
