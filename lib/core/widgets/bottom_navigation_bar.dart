import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit.dart';
import 'package:stytore/features/home/views/home_page.dart';
import '../../features/home/views/cart_page.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  void initState() {
    context.read<GetProdactDataCubit>().getData();
    log("get data ======================================");
    super.initState();
  }

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 10,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        height: 55.h,
        animationDuration: const Duration(milliseconds: 500),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: <Widget>[
          // home icon

          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              size: 25.sp,
            ),
            icon: Icon(
              size: 25.sp,
              Icons.home_outlined,
              color: Colors.black26,
            ),
            label: 'Home',
          ),

          // cart icon

          NavigationDestination(
            selectedIcon: Icon(
              Icons.shopping_cart,
              size: 25.sp,
            ),
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black26,
              size: 25.sp,
            ),
            label: 'Business',
          ),
        ],
      ),
      body: const <Widget>[
        HomePage(),
        CartPage(),
      ][currentPageIndex],
    );
  }
}
