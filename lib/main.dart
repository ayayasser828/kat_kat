import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kat_kat/models/cart_product.dart';
import 'package:kat_kat/providers/cart_item_card_provider.dart';
import 'package:kat_kat/providers/product_details_service.dart';
import 'package:kat_kat/providers/products_render.dart';
import 'package:kat_kat/providers/user_provider.dart';
import 'package:kat_kat/screens/account_login_screen.dart';
import 'package:kat_kat/screens/code_screen.dart';
import 'package:kat_kat/screens/main_screen.dart';
import 'package:kat_kat/screens/phone_screen.dart';
import 'package:kat_kat/screens/product_order.dart';
import 'package:kat_kat/screens/product_pge.dart';
import 'package:kat_kat/screens/profile_setting.dart';
import 'package:kat_kat/screens/signin_screen.dart';
import 'package:kat_kat/screens/signup_screen.dart';
import 'package:kat_kat/screens/splash_screen.dart';
import 'package:kat_kat/widgets/bottom_nav_bar.dart';
import 'package:kat_kat/widgets/order_card.dart';
import 'package:provider/provider.dart';

import 'constant/constant.dart';
import 'models/product-render.dart';
import 'models/user.dart';
import 'models/user_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data:  (brightness) {
        if (brightness == Brightness.light) {
          return ThemeData(
              accentColor: color1,
              fontFamily: 'DINNEXTLTARABIC',
          );
        } else {
          return ThemeData(
              accentColor: color1

          );
        }
      },
        themedWidgetBuilder: (context, theme) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_)=> CartProduct(),
              ),
              ChangeNotifierProvider(
                create: (_)=> CartProducts(),
              ),
              ChangeNotifierProvider(
                  create: (_)=> User()
              ),

              ChangeNotifierProvider(
                create: (_)=> ProductRender(),
              ),
              ChangeNotifierProvider(
                create: (_)=> ProductsRender(),
              ),
              ChangeNotifierProvider(
                create: (_)=> ProductDetailsService(),
              ),
              ChangeNotifierProvider(
                create: (_)=> UserProvider(),
              ),
              ChangeNotifierProvider(
                create: (_)=> UserData(),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'KitKat | كتكت',
              theme: theme,
              home: SplashScreen(),
              routes: {
                AccountLoginScreen.routeName: (context) => AccountLoginScreen(),
                SignInScreen.routeName: (context) => SignInScreen(),
                SignUpScreen.routeName: (context) => SignUpScreen(),
                BottomNav.routeName: (context) => BottomNav(),
                ProductPge.routeName: (context) => ProductPge(),
                MainScreen.routeName: (context) => MainScreen(),
                PhoneScreen.routeName: (context) => PhoneScreen(),
                CodeScreen.routeName: (context) => CodeScreen(),
                ProfileSetting.routeName: (context) => ProfileSetting(),
                ProductOrderScreen.routeName: (context) => ProductOrderScreen(),
                OrderCard.routeName: (context) => OrderCard(),
              },
            ),
          );
        }
    );
  }
}


