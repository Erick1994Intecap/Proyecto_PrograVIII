import 'package:cartelera/providers/movies_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:cartelera/widgets/widgets.dart';

class HomeSwippedScreen extends StatelessWidget {
  const HomeSwippedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesProvider().getNowMovies();
    // TODO: implement build
    return Column(
      children: [CardSwiper()],
    );
  }
}
