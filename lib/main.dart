import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/database/db_controller.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/screens/app/about_screen.dart';
import 'package:smart_store/screens/app/add_card.dart';
import 'package:smart_store/screens/app/address_screen.dart';
import 'package:smart_store/screens/app/cards_screen.dart';
import 'package:smart_store/screens/app/cart_screen.dart';
import 'package:smart_store/screens/app/change_mobile.dart';
import 'package:smart_store/screens/app/contact_us.dart';
import 'package:smart_store/screens/app/home_screen.dart';
import 'package:smart_store/screens/app/notifications_screen.dart';
import 'package:smart_store/screens/app/order_details.dart';
import 'package:smart_store/screens/app/orders_screen.dart';
import 'package:smart_store/screens/app/payment_methods.dart';
import 'package:smart_store/screens/app/profile_screen.dart';
import 'package:smart_store/screens/app/show_addresses.dart';
import 'package:smart_store/screens/auth/forgot_password_screen.dart';
import 'package:smart_store/screens/auth/login_screen.dart';
import 'package:smart_store/screens/auth/new_password.dart';
import 'package:smart_store/screens/auth/register_screen.dart';
import 'package:smart_store/screens/launch_screen.dart';
import 'package:smart_store/screens/on_boarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  await DbController().initDatabase();

  runApp(const MyApp());
}
//////

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/launch_screen',
          routes: {
            '/launch_screen': ((context) => const LaunchScreen()),
            '/on_boarding_screens': ((context) => const OnBoardingScreen()),
            '/login_screen': ((context) => const LoginScreen()),
            '/register_screen': ((context) => const RegisterScreen()),
            '/forgot_password_screen': ((context) =>
                const ForgotPasswordScreen()),
            // '/otp_screen': ((context) => const OtpScreen()),
            '/new_password_screen': ((context) => const NewPassword()),
            '/home_screen': ((context) => const HomeScreen()),
            // '/categories_screen': ((context) => const CategoriesScreen()),
            // '/product_info_screen': ((context) => const ProductInfoScreen()),
            '/cart_screen': ((context) => const CartScreen()),
            '/address_screen': ((context) => const AddressScreen()),
            '/show_addresses_screen': ((context) => const ShowAddresses()),
            '/payment_methods_screen': ((context) => const PaymentMethods()),
            '/order_screen': ((context) => const OrdersScreen()),
            '/card_screen': ((context) => const CardsScreen()),
            '/add_card_screen': ((context) => const AddCard()),
            '/notifications_screen': ((context) => const NotificationsScreen()),
            '/profile_screen': ((context) => const ProfileScreen()),
            '/change_mobile_screen': ((context) => const ChangeMobile()),
            '/contact_us_screen': ((context) => const ContactUs()),
            '/about_screen': ((context) => const AboutScreen()),
            '/order_details_screen': ((context) => const OrderDetails()),
          },
        );
      },
    );
  }
}
