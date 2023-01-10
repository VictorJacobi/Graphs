import 'package:graph_implementation/ui/home_screen.dart';
import 'package:graph_implementation/ui/splash_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  // AdaptiveRoute(
  //   page: SplashScreen,
  //   // initial: true,
  // ),
  AdaptiveRoute(page: HomeScreen,initial: true,),
  AdaptiveRoute(
    page: SplashScreen,
    // initial: true,
  ),
  // AdaptiveRoute(page: SendToFounders),
  // AdaptiveRoute(page: SendMoney),
  // AdaptiveRoute(page: TransactionSummary),
  // AdaptiveRoute(page: AuthorizeTransaction),

], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
])
class AppSetup {
  // this serve no purpose other then using [StackedApp] notation.
}
///flutter pub run build_runner build --delete-conflicting-outputs
