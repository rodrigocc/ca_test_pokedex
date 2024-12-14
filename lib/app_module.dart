import 'package:ca_test_pokedex/features/home/ui/home_page.dart';
import 'package:ca_test_pokedex/features/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (_) => const SplashPage());
    // r.child('/login')
    // r.child('/details')
    // r.child('/offnetwork')

    r.child('/home', child: (_) => const HomePage());
  }
}
