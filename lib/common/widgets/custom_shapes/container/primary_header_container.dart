import 'package:fake_store_flutter/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:fake_store_flutter/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: TColors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: TColors.white.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
