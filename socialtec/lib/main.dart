import 'package:flutter/material.dart';
import 'package:socialtec/settings/theme_config.dart';
import 'package:socialtec/settings/model_theme.dart';
import 'package:socialtec/settings/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    ThemeData? getCurrentTheme(ModelTheme themeNotifier) {
      int nTheme = themeNotifier.chooseTheme;
      List<ThemeData> lista = [lightTheme, darkTheme, pinkTheme, darkBlueTheme,  purpleTheme];
      return lista[nTheme];
    }
    
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'S O C I A L T E C',
            theme: getCurrentTheme(themeNotifier),
            routes: getApplicationRoutes(),
          );
        }
      ),
    );

  }
}













/*
  final isPlatformDark = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  final initTheme = isPlatformDark ? darkTheme : lightTheme;
  return ThemeProvider(
    initTheme: initTheme,
    builder: (_, myTheme) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'S O C I A L T E C',
        theme: myTheme,
        routes: getApplicationRoutes(),
        //home: OnboardingScreen(),
      );
    },
  );
*/





/*
import 'package:flutter/material.dart';
import 'package:socialtec/settings/mytheme_preference.dart';
import 'package:socialtec/settings/theme_config.dart';
import 'package:socialtec/settings/model_theme.dart';
import 'package:socialtec/settings/routes.dart';
import 'package:provider/provider.dart';
//import 'package:socialtec/screens/onboarding/onboarding_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    // final isPlatformDark =
    //     WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    // final initTheme = isPlatformDark ? darkTheme : lightTheme;

    // En lugar de tomar el tema del sistema hay que usar uno seleccionado
    // return ThemeProvider(
    //   initTheme: initTheme,
    //   builder: (_, myTheme) {
    //     return MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       title: 'S O C I A L T E C',
    //       theme: myTheme,
    //       routes: getApplicationRoutes(),
    //       //home: OnboardingScreen(),
    //     );
    //   },
    // );

    Future<ThemeData> getCurrentTheme() async {
      MyThemePreferences obj = MyThemePreferences();
      int keyTheme = await obj.getTheme();
      print(keyTheme);
      List<ThemeData> lista = [
        lightTheme,
        darkTheme,
        pinkTheme,
        darkBlueTheme,
        purpleTheme
      ];
      return lista[keyTheme];
    }

    return FutureBuilder(
        future: getCurrentTheme(),
        builder: (context, AsyncSnapshot<ThemeData> snapshot) {
          if (snapshot.hasData) {
            return ChangeNotifierProvider(
              create: (_) => ModelTheme(),
              child: Consumer<ModelTheme>(
                  builder: (context, ModelTheme themeNotifier, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'S O C I A L T E C',
                  theme: snapshot.data,
                  routes: getApplicationRoutes(),
                );
              }),
            );
          } else if(snapshot.hasError){
          return const Center(
            child: Text('Ocurrió un error'),       );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        });
  }
}

 */
