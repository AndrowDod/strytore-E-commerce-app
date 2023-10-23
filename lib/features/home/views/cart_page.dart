import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/features/auth/auth_bloc/sign_in/signin_controller_cubit.dart';
import 'package:stytore/features/auth/auth_bloc/sign_in/signin_controller_cubit_state.dart';
import 'package:stytore/features/home/block/cart_block/count_prodact_cubit.dart';
import 'package:stytore/features/home/block/cart_block/count_prodact_cubit_state.dart';
import 'package:stytore/features/home/block/cart_block/get_cart_list_cubit.dart';
import 'package:stytore/features/home/block/cart_block/get_cart_list_cubit_state.dart';
import 'package:stytore/features/home/widgets/cart_widgets/prodact_in_cart_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 0;
  //get cart list

  getCartList() {
    context.read<GetCartListDataCubit>().getCartList();
  }

  getSubtotalPrice(listLenght, cartList) {
    double subTotal = 0;
    for (var i = 0; i < listLenght; i++) {
      subTotal += double.parse(cartList[i]["price"]!);
    }
    return subTotal;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInControllerCubit, SingInControllerCubitState>(
      builder: (context, signinstate) {
        return Scaffold(
          //app bar

          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "My Cart",
              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 25.sp,
                ),
              )
            ],
          ),

          //body

          body: BlocBuilder<CountProdactCubit, CountProdactCubitState>(
            builder: (context, countstate) =>
                BlocBuilder<GetCartListDataCubit, GetCartListCubitState>(
              builder: (context, state) {
                total = getSubtotalPrice(state.cartList.length, state.cartList);
                return state.cartList.isEmpty
                    ? const Center(
                        child: Text('No items in your shopping cart'))
                    : Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: StreamBuilder(
                              stream: getCartList(),
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  itemCount: state.cartList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.w, bottom: 20.h),
                                      child: ProdactInCart(
                                        url: state.cartList[index]["image"],
                                        name: state.cartList[index]["name"],
                                        size: state.cartList[index]["size"],
                                        price: state.cartList[index]["price"],
                                        index: index,
                                        listLenght: state.cartList.length,
                                        id: state.cartList[index]["docId"],
                                        prodactId: state.cartList[index]["id"],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),

                          // the total price and check out

                          Expanded(
                            flex: 1,
                            child: Container(
                              // height: 100.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(99, 241, 228, 228),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.r),
                                  bottomRight: Radius.circular(20.r),
                                ),
                              ),
                              child: Column(
                                children: [
                                  // subtotal

                                  subtotalDeliveryTotal(
                                      getSubtotalPrice(state.cartList.length,
                                              state.cartList)
                                          .toString(),
                                      "Subtotal"),

                                  // fee & delivery

                                  subtotalDeliveryTotal("10", "Fee & Delivery"),

                                  // total

                                  subtotalDeliveryTotal(
                                      "${total += 10}", "Total"),

                                  // checkout button

                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 144, 99, 233),
                                        fixedSize: Size(300.w, 35.h),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Checkout",
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
              },
            ),
          ),
        );
      },
    );
  }

  subtotalDeliveryTotal(String price, text) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),

          // price

          SizedBox(
            width: 100.w,
            child: Row(
              children: [
                Text(
                  "\$ ",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 144, 99, 233)),
                ),
                Flexible(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    price,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromARGB(255, 64, 64, 64),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
