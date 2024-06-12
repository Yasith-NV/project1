

import 'package:auto_route/auto_route.dart';
import 'package:project1/routes/app_router.gr.dart';




@AutoRouterConfig()
class AppRouter extends $AppRouter{
  @override

  List <AutoRoute> get routes => [

    AutoRoute(page: LoginRoute.page,initial: true),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ContactForm.page),
    AutoRoute(page: TicketDetail.page),
    AutoRoute(page: TicketDetail.page),


  ];
}






// part 'app_router.gr.dart';


