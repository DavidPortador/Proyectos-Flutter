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
      mainAxisAlignment: MainAxisAlignment.center,
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
                  label: const Text('Light Theme'),
                  onPressed: () {
                    var brightness =
                        ThemeModelInheritedNotifier.of(context)
                            .theme
                            .brightness;
                    ThemeSwitcher.of(context).changeTheme(
                      theme: brightness == Brightness.light
                          ? darkTheme
                          : lightTheme,
                      isReversed:
                          brightness == Brightness.dark ? true : false,
                    );
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
                  label: const Text('Dark Theme'),
                  onPressed: () {
                    var brightness =
                        ThemeModelInheritedNotifier.of(context)
                            .theme
                            .brightness;
                    ThemeSwitcher.of(context).changeTheme(
                      theme: brightness == Brightness.light
                          ? darkTheme
                          : lightTheme,
                      isReversed:
                          brightness == Brightness.dark ? true : false,
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
                        label: const Text('Pink Theme'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: brightness == Brightness.light
                                ? darkTheme
                                : pinkTheme,
                            isReversed:
                                brightness == Brightness.dark ? true : false,
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
                        label: const Text('Dark Blue Theme'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: brightness == Brightness.light
                                ? darkBlueTheme
                                : lightTheme,
                            isReversed:
                                brightness == Brightness.dark ? true : false,
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
                        label: const Text('Purple Theme'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: brightness == Brightness.light
                                ? darkTheme
                                : purpleTheme,
                            isReversed:
                                brightness == Brightness.dark ? true : false,
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
                        label: const Text('Pink Theme'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: brightness == Brightness.light
                                ? darkTheme
                                : pinkTheme,
                            isReversed:
                                brightness == Brightness.dark ? true : false,
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
                        label: const Text('Dark Blue Theme'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: brightness == Brightness.light
                                ? darkBlueTheme
                                : lightTheme,
                            isReversed:
                                brightness == Brightness.dark ? true : false,
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
                        label: const Text('Purple Theme'),
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(
                            theme: brightness == Brightness.light
                                ? darkTheme
                                : purpleTheme,
                            isReversed:
                                brightness == Brightness.dark ? true : false,
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
