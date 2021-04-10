import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sample_flutter_web/widgets/navigation_bar/navbar_item.dart';
import 'package:sample_flutter_web/widgets/navigation_bar/navbar_logo.dart';
import 'package:sample_flutter_web/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:sample_flutter_web/widgets/navigation_bar/navigation_bar_tablet_desktop.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}
