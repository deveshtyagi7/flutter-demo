import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingbud/common/constants/locale_constants.dart';
import 'package:parkingbud/presentation/journey/controller/sign_up_controller.dart';
import 'package:parkingbud/presentation/journey/page/forget_password/forgetPassword.dart';
import 'package:parkingbud/presentation/journey/page/reset_password/passwordReset.dart';
import 'package:parkingbud/presentation/journey/page/reset_password/passwordResetSuccessful.dart';
import 'package:parkingbud/presentation/journey/page/sign_in/email_sign_in_screen.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:parkingbud/presentation/journey/page/sign_in/sign_in_screen.dart';
import 'package:parkingbud/presentation/journey/page/sign_up/sign_up_screen.dart';
import 'package:parkingbud/presentation/journey/page/verfication/verification_code.dart';
import 'package:parkingbud/presentation/journey/page/verfication/verification_sent.dart';
import 'package:parkingbud/presentation/journey/page/verfication/verify_by_email.dart';
import 'package:parkingbud/presentation/journey/page/verfication/verify_by_phone.dart';
import 'package:parkingbud/presentation/theme/theme.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  // debugPaintSizeEnabled = true;
  unawaited(getIt.init());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.kWhiteTheme,
      supportedLocales: localeList,
      localizationsDelegates: [
        CountryLocalizations.delegate,
      ],
      getPages: [
        GetPage(
          name: SignUpScreen.routeName,
          page: () => SignUpScreen(),
        ),
        GetPage(
          name: SignInScreen.routeName,
          page: () => SignInScreen(),
        ),
        GetPage(
          name: EmailSignInScreen.routeName,
          page: () => EmailSignInScreen(),
        ),
        GetPage(
          name: VerificationEmail.routeName,
          page: () => VerificationEmail(),
        ),
        GetPage(
          name: VerificationPhone.routeName,
          page: () => VerificationPhone(),
        ),
        GetPage(
          name: ResetPassword.routeName,
          page: () => ResetPassword(),
        ),
        GetPage(
          name: ForgetPassword.routeName,
          page: () => ForgetPassword(),
        ),
        GetPage(
          name: VerificationSent.routeName,
          page: () => VerificationSent(),
        ),
        GetPage(
          name: SuccessfulPasswordReset.routeName,
          page: () => SuccessfulPasswordReset(),
        ),
        GetPage(
          name: SplashScreen.routeName,
          page: () => SplashScreen(),
        ),
      ],
      initialRoute: SplashScreen.routeName,
      defaultTransition: Transition.downToUp,
    );
  }
}

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToSignUp();
  }

  goToSignUp() async {
    await Future.delayed(Duration(seconds: 1), () {
      Get.toNamed(SignUpScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage("assets/images/logo/Group 24062.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Slogan of App",
              style: Get.textTheme.headline6,
            ),
          )
        ],
      ),
    ));
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// enum UniLinksType { string, uri }

// class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
//   String _latestLink = 'Unknown';
//   Uri _latestUri;

//   StreamSubscription _sub;

//   TabController _tabController;
//   UniLinksType _type = UniLinksType.string;

//   final List<String> _cmds = getCmds();
//   final TextStyle _cmdStyle = const TextStyle(
//       fontFamily: 'Courier', fontSize: 12.0, fontWeight: FontWeight.w700);
//   final _scaffoldKey = new GlobalKey<ScaffoldState>();

//   @override
//   initState() {
//     super.initState();
//     _tabController = new TabController(vsync: this, length: 2);
//     _tabController.addListener(_handleTabChange);
//     initPlatformState();
//   }

//   @override
//   dispose() {
//     if (_sub != null) _sub.cancel();
//     _tabController.removeListener(_handleTabChange);
//     _tabController.dispose();
//     super.dispose();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   initPlatformState() async {
//     if (_type == UniLinksType.string) {
//       await initPlatformStateForStringUniLinks();
//     } else {
//       await initPlatformStateForUriUniLinks();
//     }
//   }

//   /// An implementation using a [String] link
//   initPlatformStateForStringUniLinks() async {
//     // Attach a listener to the links stream
//     _sub = getLinksStream().listen((String link) {
//       if (!mounted) return;
//       setState(() {
//         _latestLink = link ?? 'Unknown';
//         _latestUri = null;
//         try {
//           if (link != null) _latestUri = Uri.parse(link);
//         } on FormatException {}
//       });
//     }, onError: (err) {
//       if (!mounted) return;
//       setState(() {
//         _latestLink = 'Failed to get latest link: $err.';
//         _latestUri = null;
//       });
//     });

//     // Attach a second listener to the stream
//     getLinksStream().listen((String link) {
//       print('got link: $link');
//     }, onError: (err) {
//       print('got err: $err');
//     });

//     // Get the latest link
//     String initialLink;
//     Uri initialUri;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       initialLink = await getInitialLink();
//       print('initial link: $initialLink');
//       if (initialLink != null) initialUri = Uri.parse(initialLink);
//     } on PlatformException {
//       initialLink = 'Failed to get initial link.';
//       initialUri = null;
//     } on FormatException {
//       initialLink = 'Failed to parse the initial link as Uri.';
//       initialUri = null;
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _latestLink = initialLink;
//       _latestUri = initialUri;
//     });
//   }

//   /// An implementation using the [Uri] convenience helpers
//   initPlatformStateForUriUniLinks() async {
//     // Attach a listener to the Uri links stream
//     _sub = getUriLinksStream().listen((Uri uri) {
//       if (!mounted) return;
//       setState(() {
//         _latestUri = uri;
//         _latestLink = uri?.toString() ?? 'Unknown';
//       });
//     }, onError: (err) {
//       if (!mounted) return;
//       setState(() {
//         _latestUri = null;
//         _latestLink = 'Failed to get latest link: $err.';
//       });
//     });

//     // Attach a second listener to the stream
//     getUriLinksStream().listen((Uri uri) {
//       print('got uri: ${uri?.path} ${uri?.queryParametersAll}');
//     }, onError: (err) {
//       print('got err: $err');
//     });

//     // Get the latest Uri
//     Uri initialUri;
//     String initialLink;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       initialUri = await getInitialUri();
//       print('initial uri: ${initialUri?.path}'
//           ' ${initialUri?.queryParametersAll}');
//       initialLink = initialUri?.toString();
//     } on PlatformException {
//       initialUri = null;
//       initialLink = 'Failed to get initial uri.';
//     } on FormatException {
//       initialUri = null;
//       initialLink = 'Bad parse the initial link as Uri.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _latestUri = initialUri;
//       _latestLink = initialLink;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final queryParams = _latestUri?.queryParametersAll?.entries?.toList();

//     return new MaterialApp(
//       home: new Scaffold(
//         key: _scaffoldKey,
//         appBar: new AppBar(
//           title: new Text('Plugin example app'),
//           bottom: new TabBar(
//             controller: _tabController,
//             tabs: <Widget>[
//               new Tab(text: 'STRING LINK'),
//               new Tab(text: 'URI'),
//             ],
//           ),
//         ),
//         body: new ListView(
//           shrinkWrap: true,
//           padding: const EdgeInsets.all(8.0),
//           children: <Widget>[
//             new ListTile(
//               title: const Text('Link'),
//               subtitle: new Text('$_latestLink'),
//             ),
//             new ListTile(
//               title: const Text('Uri Path'),
//               subtitle: new Text('${_latestUri?.path}'),
//             ),
//             new ExpansionTile(
//               initiallyExpanded: true,
//               title: const Text('Query params'),
//               children: queryParams?.map((item) {
//                     return new ListTile(
//                       title: new Text('${item.key}'),
//                     );
//                   })?.toList() ??
//                   <Widget>[
//                     new ListTile(
//                       dense: true,
//                       title: const Text('null'),
//                     ),
//                   ],
//             ),
//             _cmdsCard(_cmds),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _cmdsCard(commands) {
//     Widget platformCmds;

//     if (commands == null) {
//       platformCmds = const Center(child: const Text('Unsupported platform'));
//     } else {
//       platformCmds = new Column(
//         children: <List<Widget>>[
//           [
//             const Text(
//                 'To populate above fields open a terminal shell and run:\n')
//           ],
//           intersperse(
//               commands.map<Widget>((cmd) => new InkWell(
//                     onTap: () => _printAndCopy(cmd),
//                     child: new Text('\n$cmd\n', style: _cmdStyle),
//                   )),
//               const Text('or')),
//           [
//             new Text(
//                 '(tap on any of the above commands to print it to'
//                 ' the console/logger and copy to the device clipboard.)',
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.caption),
//           ]
//         ].expand((el) => el).toList(),
//       );
//     }

//     return new Card(
//       margin: const EdgeInsets.only(top: 20.0),
//       child: new Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: platformCmds,
//       ),
//     );
//   }

//   _handleTabChange() {
//     if (_tabController.indexIsChanging) {
//       setState(() {
//         _type = UniLinksType.values[_tabController.index];
//       });
//       initPlatformState();
//     }
//   }

//   _printAndCopy(String cmd) async {
//     print(cmd);

//     await Clipboard.setData(new ClipboardData(text: cmd));
//     _scaffoldKey.currentState.showSnackBar(new SnackBar(
//       content: const Text('Copied to Clipboard'),
//     ));
//   }
// }

// List<String> getCmds() {
//   String cmd;
//   String cmdSuffix = '';

//   if (Platform.isIOS) {
//     cmd = '/usr/bin/xcrun simctl openurl booted';
//   } else if (Platform.isAndroid) {
//     cmd = '\$ANDROID_HOME/platform-tools/adb shell \'am start'
//         ' -a android.intent.action.VIEW'
//         ' -c android.intent.category.BROWSABLE -d';
//     cmdSuffix = "'";
//   } else {
//     return null;
//   }

//   // https://orchid-forgery.glitch.me/mobile/redirect/
//   return [
//     '$cmd "unilinks://dev.parkingbuddy/path/subpath"$cmdSuffix',
//     '$cmd "unilinks://dev.parkingbuddy/path/portion/?uid=123&token=abc"$cmdSuffix',
//     '$cmd "unilinks://example.com/?arr%5b%5d=123&arr%5b%5d=abc'
//         '&addr=1%20Nowhere%20Rd&addr=Rand%20City%F0%9F%98%82"$cmdSuffix',
//   ];
// }

// List<Widget> intersperse(Iterable<Widget> list, Widget item) {
//   List<Widget> initialValue = [];
//   return list.fold(initialValue, (all, el) {
//     if (all.length != 0) all.add(item);
//     all.add(el);
//     return all;
//   });
// }
