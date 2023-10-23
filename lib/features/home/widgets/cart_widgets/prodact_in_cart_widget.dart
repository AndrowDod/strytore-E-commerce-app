import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/core/utils/constes.dart';
import 'package:stytore/features/home/block/cart_block/count_prodact_cubit.dart';
import 'package:stytore/features/home/block/cart_block/count_prodact_cubit_state.dart';
import 'package:stytore/features/home/block/cart_block/get_cart_list_cubit.dart';

class ProdactInCart extends StatefulWidget {
  const ProdactInCart({
    super.key,
    required this.url,
    required this.name,
    required this.size,
    required this.price,
    required this.listLenght,
    required this.index,
    required this.id,
    required this.prodactId,
  });

  final String url;
  final String name;
  final String size;
  final String price;
  final int listLenght;
  final int index;
  final String id;
  final String prodactId;

  @override
  State<ProdactInCart> createState() => _ProdactInCartState();
}

final List countCubit = [];
late String basePrice;

// create cubits

void createCubits(listLenght, countCubit) {
  for (var i = 0; i < listLenght; i++) {
    countCubit.add(CountProdactCubit());
  }
}

getBasePrice(id) async {
  await FirebaseFirestore.instance
      .collection(collectionName)
      .doc(id)
      .get()
      .then((value) => basePrice = value["price"]);
}

class _ProdactInCartState extends State<ProdactInCart> {
  @override
  void initState() {
    createCubits(widget.listLenght, countCubit);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getBasePrice(widget.prodactId);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
          height: 180.h,
          width: 150.w,
          child: Image.network(
            widget.url,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 180.h,
          width: 180.w,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 64, 64, 64)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7.h, bottom: 7.h),
                  child: Text(
                    "Size : ${widget.size}",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$ ",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 144, 99, 233)),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 80.w,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          widget.price,
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w900,
                            color: const Color.fromARGB(255, 64, 64, 64),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // count items
                    Row(
                      children: [
                        // minus
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Material(
                              color: const Color.fromARGB(69, 144, 99, 233),
                              child: InkWell(
                                onTap: () async {
                                  countCubit[widget.index].decrement();

                                  //decrement price
                                  await context
                                      .read<GetCartListDataCubit>()
                                      .updatePrice(
                                        widget.id,
                                        (double.parse(widget.price) -
                                                double.parse(basePrice))
                                            .toString(),
                                      );
                                },
                                child: SizedBox(
                                  width: 25.w,
                                  height: 25.h,
                                  child: Center(
                                      child: Text(
                                    " - ",
                                    style: TextStyle(fontSize: 20.sp),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // count

                        BlocBuilder<CountProdactCubit, CountProdactCubitState>(
                          bloc: countCubit[widget.index],
                          builder: (context, state) => Text(
                            "${state.count}",
                          ),
                        ),

                        // add

                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Material(
                              color: const Color.fromARGB(69, 144, 99, 233),
                              child: InkWell(
                                onTap: () async {
                                  countCubit[widget.index].increment();
                                  // increment price
                                  await context
                                      .read<GetCartListDataCubit>()
                                      .updatePrice(
                                        widget.id,
                                        (double.parse(widget.price) +
                                                double.parse(basePrice))
                                            .toString(),
                                      );
                                },
                                child: SizedBox(
                                  width: 25.w,
                                  height: 25.h,
                                  child: Center(
                                      child: Text(
                                    " + ",
                                    style: TextStyle(fontSize: 15.sp),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // delete item
                    IconButton(
                        onPressed: () async {
                          await context
                              .read<GetCartListDataCubit>()
                              .deleteItem(widget.id);
                        },
                        icon: Icon(
                          Icons.close,
                          size: 20.sp,
                        ))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
