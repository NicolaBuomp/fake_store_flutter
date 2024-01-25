import 'package:fake_store_flutter/features/authentication/screens/widgets/onboarding_dot_navigation.dart';
import 'package:fake_store_flutter/features/authentication/screens/widgets/onboarding_next_button.dart';
import 'package:fake_store_flutter/features/authentication/screens/widgets/onboarding_page.dart';
import 'package:fake_store_flutter/features/authentication/screens/widgets/onboarding_skip.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/constants/text_string.dart';
import 'package:fake_store_flutter/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: const [
              OnBoardingPage(
                image: 'https://picsum.photos/200/300',
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: 'https://picsum.photos/200/300',
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: 'https://picsum.photos/200/300',
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
