// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:project1/screens/contact_form.dart' as _i1;
import 'package:project1/screens/login_and_signup/login_page.dart' as _i2;
import 'package:project1/screens/login_and_signup/sign_up_page.dart' as _i3;
import 'package:project1/screens/ticket_info/ticket_details.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ContactForm.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ContactForm(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpPage(),
      );
    },
    TicketDetail.name: (routeData) {
      final args = routeData.argsAs<TicketDetailArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.TicketDetail(documentId: args.documentId),
      );
    },
  };
}

/// generated route for
/// [_i1.ContactForm]
class ContactForm extends _i5.PageRouteInfo<void> {
  const ContactForm({List<_i5.PageRouteInfo>? children})
      : super(
          ContactForm.name,
          initialChildren: children,
        );

  static const String name = 'ContactForm';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TicketDetail]
class TicketDetail extends _i5.PageRouteInfo<TicketDetailArgs> {
  TicketDetail({
    required String documentId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          TicketDetail.name,
          args: TicketDetailArgs(documentId: documentId),
          initialChildren: children,
        );

  static const String name = 'TicketDetail';

  static const _i5.PageInfo<TicketDetailArgs> page =
      _i5.PageInfo<TicketDetailArgs>(name);
}

class TicketDetailArgs {
  const TicketDetailArgs({required this.documentId});

  final String documentId;

  @override
  String toString() {
    return 'TicketDetailArgs{documentId: $documentId}';
  }
}
