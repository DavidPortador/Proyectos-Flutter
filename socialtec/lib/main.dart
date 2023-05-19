import 'package:flutter/material.dart';
import 'package:socialtec/settings/theme_config.dart';
import 'package:socialtec/settings/model_theme.dart';
import 'package:socialtec/settings/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
