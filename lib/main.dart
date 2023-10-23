import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/core/utils/constes.dart';
import 'package:stytore/features/home/block/cart_block/cart_cubit.dart';
import 'package:stytore/features/home/block/cart_block/count_prodact_cubit.dart';
import 'package:stytore/features/home/block/categories_cubit.dart';
import 'package:stytore/features/home/block/cart_block/get_cart_list_cubit.dart';
import 'package:stytore/features/home/block/get_prodact_data_cubit.dart';
import 'package:stytore/features/home/block/prodacts_cubit.dart';
import 'package:stytore/features/home/block/size_order_cubit.dart';
import 'package:stytore/features/home/block/tab_bar_cubit.dart';
import 'package:stytore/features/home/views/add_new_prodact.dart';
import 'package:stytore/features/home/views/home_page.dart';
import 'package:stytore/features/auth/views/signup_page.dart';
import 'package:stytore/features/home/views/prodact_details_page.dart';
import 'package:stytore/core/widgets/bottom_navigation_bar.dart';
import 'features/auth/auth_bloc/sign_in/signin_controller_cubit.dart';
import 'features/auth/auth_bloc/sign_up/signup_controller_cubit.dart';
import 'firebase_options.dart';
import 'features/auth/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpControllerCubit>(
          create: (context) => SignUpControllerCubit(),
        ),
        BlocProvider<SignInControllerCubit>(
          create: (context) => SignInControllerCubit(),
        ),
        BlocProvider<TabBarCubit>(
          create: (context) => TabBarCubit(),
        ),
        BlocProvider<ProdactsCubit>(
          create: (context) => ProdactsCubit(),
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider<GetProdactDataCubit>(
          create: (context) => GetProdactDataCubit(),
        ),
        BlocProvider<SizeOrderCubit>(
          create: (context) => SizeOrderCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
        BlocProvider<GetCartListDataCubit>(
          create: (context) => GetCartListDataCubit(),
        ),
        BlocProvider<CountProdactCubit>(
          create: (context) => CountProdactCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          routes: {
            signUpRouteName: (context) => const SignUpPage(),
            signInRouteName: (context) => const LoginPage(),
            homePageRouteName: (context) => const HomePage(),
            bottomBarRouteName: (context) => const CustomNavigationBar(),
            prodactDetailsRouteName: (context) => const ProdactDetailsPage(),
            addNewProdactRouteName: (context) => const AddNewProdact(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FirebaseAuth.instance.currentUser != null
              ? const CustomNavigationBar()
              : const LoginPage(),
        ),
      ),
    );
  }
}
