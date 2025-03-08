import 'package:get/get.dart';

import '../modules/bottombar/bindings/bottombar_binding.dart';
import '../modules/bottombar/views/bottombar_view.dart';
import '../modules/business/bindings/business_binding.dart';
import '../modules/business/bindings/business_detail_binding.dart';
import '../modules/business/bindings/business_list_binding.dart';
import '../modules/business/views/list/business_detail_view.dart';
import '../modules/business/views/list/business_list_view.dart';
import '../modules/business/views/create/business_view.dart';
import '../modules/business/views/list/business_detail_view.dart';
import '../modules/business/views/list/business_list_view.dart';
import '../modules/events/bindings/events_binding.dart';
import '../modules/events/views/events_details_view.dart';
import '../modules/events/views/events_view.dart';
import '../modules/feeds/bindings/feeds_binding.dart';
import '../modules/feeds/views/feeds_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOMBAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBAR,
      page: () => const BottombarView(),
      binding: BottombarBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.EVENTS,
      page: () => const EventsView(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAILS,
      page: () => EventsDetailsView(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: _Paths.FEEDS,
      page: () => const FeedsView(),
      binding: FeedsBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.BUSINESS,
      page: () => const BusinessView(),
      binding: BusinessBinding(),
    ),
    GetPage(
      name: _Paths.BUSINESS_DETAIL,
      page: () => const BusinessDetailView(),
      binding: BusinessDetailBinding(),
    ),
    GetPage(
      name: _Paths.BUSINESS_LIST,
      page: () => const BusinessListView(),
      binding: BusinessListBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
