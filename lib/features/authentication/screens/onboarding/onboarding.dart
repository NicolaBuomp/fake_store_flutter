
import 'package:fake_store_flutter/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:fake_store_flutter/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:fake_store_flutter/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:fake_store_flutter/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:fake_store_flutter/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: MyImages.imageProductCard1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: MyImages.imageProductCard2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: MyImages.imageProductCard3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              )
            ],
          ),

          // Skip Button

          const OnBoardingSkip(),

          const OnBoardingDotNavigation(),

          const OnBordingNextButton(),
        ],
      ),
    );
  }
}
