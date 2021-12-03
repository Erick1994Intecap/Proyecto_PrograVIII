import 'package:cartelera/models/models.dart';
import 'package:cartelera/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cartelera/widgets/widgets.dart';

class HomeSwippedScreen extends StatelessWidget {
  const HomeSwippedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Future<NowPlayingResponse> np;
    np = MoviesProvider().getOnDisplayMovies();

    // TODO: implement build
    return Column(
      children: [CardSwiper(), getInfo(context, np)],
    );
  }

  Widget getInfo(BuildContext context, Future<NowPlayingResponse> np) {
    return Center(
      child: FutureBuilder<NowPlayingResponse>(
        future: np,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('Si hay datos');
          } else if (snapshot.hasError) {
            return Text('No hay datos');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
