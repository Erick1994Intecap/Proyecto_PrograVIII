import 'package:flutter/widgets.dart';
import 'package:cartelera/widgets/widgets.dart';

class HomeSwippedScreen extends StatelessWidget {
  const HomeSwippedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [CardSwiper()],
    );
  }
}
