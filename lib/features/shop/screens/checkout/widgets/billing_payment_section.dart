import 'package:fake_store_flutter/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:fake_store_flutter/common/widgets/texts/section_heading.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(
          title: 'Metodo di Pagamento',
          buttonTitle: 'Cambia',
          onPressed: () {},
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 2),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 60,
              backgroundColor: isDark ? MyColors.light : MyColors.white,
              padding: const EdgeInsets.all(Sizes.sm),
              child: const Image(image: AssetImage(MyImages.vistaPay), fit: BoxFit.contain,),

            ),
            const SizedBox(width: Sizes.spaceBtwItems / 2),
            Text('Visa', style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}
