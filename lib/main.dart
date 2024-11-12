import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/other': (context) => const Other(),
        '/login': (context) => const LoginPage(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: SafeArea(
          top: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'this is first page',
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, '/login'),
                          child: Text(
                            '跳转登录页',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, '/other'),
                          child: Text(
                            '跳转其他页',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    )),
                Container(
                  color: Colors.red,
                  height: 60,
                )
              ],
            ),
          )),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('登录页'),
        ),
        body: Center(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Expanded(
                child: Text(
                  'this is login page',
                ),
              ),
              Container(
                color: Colors.red,
                height: 60,
              )
            ])));
  }
}

class Other extends StatefulWidget {
  const Other({super.key});

  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Expanded(
                  child: Text(
                    'this is login page',
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 60,
                )
              ])),
        ));
  }
}
