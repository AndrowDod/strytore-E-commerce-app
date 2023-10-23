import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/features/home/block/categories_cubit.dart';
import 'package:stytore/features/home/block/catrgories_cubit_state.dart';

// ignore: must_be_immutable
class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({super.key, required this.text});

  String text;
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  ValueNotifier<int> isChickeddd = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesCubitState>(
        builder: (context, state) {
      return Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.sp, top: 10.sp, bottom: 10.sp),
            child: Transform.scale(
                scale: 1.5,
                child: ValueListenableBuilder(
                  valueListenable: isChickeddd,
                  builder: (context, value, child) => Checkbox(
                    value: widget.text == "Men"
                        ? state.isChicked1
                        : widget.text == "Women"
                            ? state.isChicked2
                            : state.isChicked3,
                    onChanged: (value) {
                      widget.text == "Men"
                          ? state.isChicked1 = value
                          : widget.text == "Women"
                              ? state.isChicked2 = value
                              : state.isChicked3 = value;
                      isChickeddd.value++;
                    },
                  ),
                )),
          ),
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 15.sp,
            ),
          )
        ],
      );
    });
  }
}
