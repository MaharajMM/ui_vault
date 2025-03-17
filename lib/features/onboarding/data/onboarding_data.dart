import 'package:ui_vault/const/resource.dart';

import 'model/onboarding_model.dart';

class OnboardingData {
  static List<OnboardingModel> items = [
    OnboardingModel(
      imageUrl: R.ASSETS_ILLUSTRATIONS_SEARCH_CATEGORY_SVG,
      headline: 'Explore UI Screens & Projects',
      description:
          'Discover a wide range of professionally designed authentication screens and complete app projects.',
    ),
    OnboardingModel(
      imageUrl: R.ASSETS_ILLUSTRATIONS_DISCOUNT_SVG,
      headline: 'Exclusive Deals & Offers',
      description:
          'Get amazing discounts on premium UI screens and full app projects. Save time and build faster!',
    ),
    OnboardingModel(
      imageUrl: R.ASSETS_ILLUSTRATIONS_DELIVERY_SVG,
      headline: 'Instant Download, Ready to Use',
      description:
          'Purchase and download your favorite UI screens or full projects instantly, with all assets included.',
    ),
  ];
}

//407BFF