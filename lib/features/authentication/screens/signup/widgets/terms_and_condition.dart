import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(
          width: Sizes.spaceBtwItems,
        ),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${TTexts.isAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: TTexts.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: isDark ? MyColors.white : MyColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              isDark ? MyColors.white : MyColors.primary,
                        )),
                TextSpan(
                    text: ' ${TTexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: TTexts.termsofUse,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: isDark ? MyColors.white : MyColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              isDark ? MyColors.white : MyColors.primary,
                        )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
