import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:notehub_app/core/injectable.config.dart';

@InjectableInit()
Future<void> setUpInjectable() async {
  final getIt = GetIt.I;
  getIt.init();
}
