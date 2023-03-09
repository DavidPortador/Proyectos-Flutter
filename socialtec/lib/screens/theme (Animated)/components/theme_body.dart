import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:socialtec/settings/theme_config.dart';

class ThemeBody extends StatefulWidget {
  const ThemeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ThemeBody> createState() => _ThemeBodyState();
}

class _ThemeBodyState extends State<ThemeBody> {
  @override
  Widget build(BuildContext context) {

    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Default Themes',textAlign: TextAlign.center,),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThemeSwitcher(
              clipper: const ThemeSwitcherBoxClipper(),
              builder: (context) {
                return ElevatedButton.icon(
                  icon: Icon(Icons.brightness_high_rounded),
                  label: const Text('Light'),
                  onPressed: () {
                    var brightness =
                        ThemeModelInheritedNotifier.of(context)
                            .theme
                            .brightness;
                    ThemeSwitcher.of(context).changeTheme(
                      theme: lightTheme,
                      isReversed: true,
                    );
                    //themeNotifier.chooseTheme = 1;
                  },
                );
              },
            ),
            const SizedBox(width: 16),
            ThemeSwitcher(
              clipper: const ThemeSwitcherCircleClipper(),
              builder: (context) {
                return ElevatedButton.icon(
                  icon: Icon(Icons.brightness_2_sharp),
                  label: const Text('Dark'),
                  onPressed: () {
                    var brightness =
                        ThemeModelInheritedNotifier.of(context)
                            .theme
                            .brightness;
                    ThemeSwitcher.of(context).changeTheme(
                      theme: darkTheme,
                      isReversed: false,
                    );
                  },
                );
              },
            ),
          ],
        ),

        const SizedBox(height: 32),
        const Text('Custom Themes',textAlign: TextAlign.center,),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Box Animation', textAlign: TextAlign.center,),
                  const SizedBox(height: 16),
                  ThemeSwitcher(
                    clipper: const ThemeSwitcherBoxClipper(),
                    builder: (context) {
                      return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: pinkPrimaryColor,
                          //onPrimary: Colors.black,
                        ),
                        icon: Icon(Icons.brightness_7_outlined),
                        label: const Text('Pink'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: pinkTheme,
                            isReversed: true,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ThemeSwitcher(
                    clipper: const ThemeSwitcherBoxClipper(),
                    builder: (context) {
                      return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: bluePrimaryColor,
                          //onPrimary: Colors.black,
                        ),
                        icon: Icon(Icons.brightness_7_outlined),
                        label: const Text('Dark Blue'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: darkBlueTheme,
                            isReversed: true,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ThemeSwitcher(
                    clipper: const ThemeSwitcherBoxClipper(),
                    builder: (context) {
                      return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: purplePrimaryColor,
                          //onPrimary: Colors.black,
                        ),
                        icon: Icon(Icons.brightness_7_outlined),
                        label: const Text('Purple'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: purpleTheme,
                            isReversed: true,
                          );
                        },
                      );
                    },
                  ),
                ],
                
              ),
            ),

            const SizedBox(width: 16),
            
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Circle Animation', textAlign: TextAlign.center,),
                  const SizedBox(height: 16),
                  ThemeSwitcher(
                    clipper: const ThemeSwitcherCircleClipper(),
                    builder: (context) {
                      return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: pinkPrimaryColor,
                          //onPrimary: Colors.black,
                        ),
                        icon: Icon(Icons.brightness_7_outlined),
                        label: const Text('Pink'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: pinkTheme,
                            isReversed: false,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ThemeSwitcher(
                    clipper: const ThemeSwitcherCircleClipper(),
                    builder: (context) {
                      return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: bluePrimaryColor,
                          //onPrimary: Colors.black,
                        ),
                        icon: Icon(Icons.brightness_7_outlined),
                        label: const Text('Dark Blue'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: darkBlueTheme,
                            isReversed: false,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ThemeSwitcher(
                    clipper: const ThemeSwitcherCircleClipper(),
                    builder: (context) {
                      return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: purplePrimaryColor,
                          //onPrimary: Colors.black,
                        ),
                        icon: Icon(Icons.brightness_7_outlined),
                        label: const Text('Purple'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: purpleTheme,
                            isReversed: false,
                          );
                        },
                      );
                    },
                  ),
                ],
                
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
