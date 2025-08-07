import 'package:mekmotorclient/routing/menu_app_controller.dart';
import 'package:mekmotorclient/ui/F_AUTHENTICATION/widgets/authentication_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mekmotorclient/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuAppController()),
        ],
        child: AuthenticationScreen(),
      ),
    );
  }
}

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthenticationScreen();

    /**
    TODO Integrar ao MVVC de integração com o mekmotor-server 
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          AppLogger.info("Usuário logado");
          return InicioTela(user: snapshot.data!);
        } else {
          AppLogger.info("Usuário não logado");
          return const AutenticacaoTela();
        }
      },
    );
    */
  }
}
