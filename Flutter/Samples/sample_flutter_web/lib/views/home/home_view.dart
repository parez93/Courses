import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sample_flutter_web/views/home/home_content_desktop.dart';
import 'package:sample_flutter_web/views/home/home_content_mobile.dart';
import 'package:sample_flutter_web/widgets/call_to_action/call_to_action.dart';
import 'package:sample_flutter_web/widgets/centered_view/centered_view.dart';
import 'package:sample_flutter_web/widgets/course_details/course_details.dart';
import 'package:sample_flutter_web/widgets/nav_drawer/navigation_drawer.dart';
import 'package:sample_flutter_web/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: ScreenTypeLayout(
                  mobile: HomeContentMobile(),
                  desktop: HomeContentDesktop(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
