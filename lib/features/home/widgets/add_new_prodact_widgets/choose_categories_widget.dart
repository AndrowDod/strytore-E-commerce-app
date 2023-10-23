import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/features/home/block/categories_cubit.dart';
import 'package:stytore/features/home/block/catrgories_cubit_state.dart';
import 'package:stytore/features/home/widgets/add_new_prodact_widgets/check_box_widget.dart';

// ignore: must_be_immutable
class ChooseCategoriesWigdet extends StatefulWidget {
  const ChooseCategoriesWigdet({super.key});

  @override
  State<ChooseCategoriesWigdet> createState() => ChooseCategoriesWigdetState();
}

class ChooseCategoriesWigdetState extends State<ChooseCategoriesWigdet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.h, left: 20.w),
          child: Text(
            "Choose  categories ",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(189, 0, 0, 0)),
          ),
        ),
        BlocBuilder<CategoriesCubit, CategoriesCubitState>(
            builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CheckBoxWidget(text: "Men"),
              CheckBoxWidget(text: "Women"),
              CheckBoxWidget(text: "Summer"),
            ],
          );
        }),
      ],
    );
  }
}
