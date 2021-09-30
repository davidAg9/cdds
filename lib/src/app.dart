import 'package:cdds/src/drugsearch/drug_search_view.dart';
import 'package:cdds/src/home/home.dart';
import 'package:cdds/src/model/drug.dart';
import 'package:cdds/src/model/user.dart';
import 'package:cdds/src/profile/profile.dart';
import 'package:cdds/src/registration/sign_in.dart';
import 'package:cdds/src/scanned_Drugs/scan_history.dart';
import 'package:cdds/src/scanned_Drugs/scan_history_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class CDDSAPP extends StatelessWidget {
  const CDDSAPP({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'cdds',
            debugShowCheckedModeBanner: false,

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: Colors.red,
              primarySwatch: Colors.red,
            ),
            darkTheme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: Colors.red,
              primarySwatch: Colors.red,
            ),
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case HomeView.routeName:
                      return HomeView(
                        user: routeSettings.arguments as CDDSUSER,
                      );
                    case DrugSearchView.routeName:
                      return DrugSearchView();
                    case ScanHistoryDetails.routeName:
                      return const ScanHistoryDetails();
                    case ScanHistory.routeName:
                      return ScanHistory(drugs: routeSettings.arguments as List<Drug>);
                    case ProfileView.routeName:
                      return ProfileView(user: routeSettings.arguments as CDDSUSER);
                    case SignInView.routeName:
                      return const SignInView();

                    default:
                      return const SignInView();
                  }
                },
              );
            },
          );
        });
      },
    );
  }
}
