import 'package:go_router/go_router.dart';
import 'package:clean_go_vendor_app/features/auth/presentation/screens/login_screen.dart';
import 'package:clean_go_vendor_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:clean_go_vendor_app/features/home/presentation/screens/home_screen.dart';
import 'package:clean_go_vendor_app/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:clean_go_vendor_app/features/history/presentation/screens/history_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/pickup/pickup_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/pickup/pickup_otp_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/damage/damage_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/seal_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/processing/processign_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_checklist_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_otp_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_otp_verification_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_qr_verified_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_otp_verified_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_completed_screen.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/otp_verified_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) {
        final phoneNumber = state.extra as String? ?? '';
        return OtpScreen(phoneNumber: phoneNumber);
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final showPickupBanner = state.extra as bool? ?? false;
        return HomeScreen(showPickupBanner: showPickupBanner);
      },
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/pickup',
      builder: (context, state) => const PickupScreen(),
    ),
    GoRoute(
      path: '/pickup-otp',
      builder: (context, state) => const PickupOtpScreen(),
    ),
    GoRoute(
      path: '/damage',
      builder: (context, state) => const DamageScreen(),
    ),
    GoRoute(
      path: '/seal',
      builder: (context, state) => const SealScreen(),
    ),
    GoRoute(
      path: '/processing',
      builder: (context, state) => const ProcessingScreen(),
    ),
    GoRoute(
      path: '/delivery',
      builder: (context, state) => const DeliveryScreen(),
    ),
    GoRoute(
      path: '/delivery-checklist',
      builder: (context, state) => DeliveryChecklistScreen(),
    ),
    GoRoute(
      path: '/delivery-otp',
      builder: (context, state) => const DeliveryOtpScreen(),
    ),
    GoRoute(
      path: '/delivery-otp-verification',
      builder: (context, state) => const DeliveryOtpVerificationScreen(),
    ),
    GoRoute(
      path: '/delivery-qr-verified',
      builder: (context, state) => DeliveryQrVerifiedScreen(),
    ),
    GoRoute(
      path: '/delivery-otp-verified',
      builder: (context, state) => const DeliveryOtpVerifiedScreen(),
    ),
    GoRoute(
      path: '/delivery-completed',
      builder: (context, state) => const DeliveryCompletedScreen(),
    ),
    GoRoute(
      path: '/otp-verified',
      builder: (context, state) => const OtpVerifiedScreen(),
    ),
  ],
);
