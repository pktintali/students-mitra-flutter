// import 'package:students_mitra_flutter/Test/TestPage.dart';
import 'package:students_mitra_flutter/providers/UserAnswers.dart';

import 'Test/TestPage.dart';
import 'index.dart';

bool _isSignedIn = true;
// bool _isSignedIn = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // final user = FirebaseAuth.instance.currentUser;
  // _isSignedIn = user != null ? true : false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyTheme()),
        ChangeNotifierProvider(create: (_) => UserData()),
        ChangeNotifierProvider(create: (_) => SheetSubjects()),
        ChangeNotifierProvider(create: (_) => SheetQuestions()),
        ChangeNotifierProvider(create: (_) => UserAnswers()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: _isSignedIn ? TestPage.id : LoginSignUp.id,
      routes: {
        LoginSignUp.id: (context) => LoginSignUp(),
        Graphs.id: (context) => Graphs(),
        HomePage.id: (context) => HomePage(),
        Profile.id: (context) => Profile(),
      },
      title: 'StudentMitra',
      theme: Theme.of(context).copyWith(primaryColor: Colors.red),
      home: TestPage(),
    );
  }
}
