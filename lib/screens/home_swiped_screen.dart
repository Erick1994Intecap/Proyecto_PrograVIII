import 'package:cartelera/models/models.dart';
import 'package:cartelera/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cartelera/widgets/widgets.dart';

class HomeSwippedScreen extends StatefulWidget {
  //const HomeSwippedScreen({Key? key}) : super(key: key);
  @override
  _HomeSwippedState createState() => _HomeSwippedState();
}

class _HomeSwippedState extends State<HomeSwippedScreen> {
  @override
  Widget build(BuildContext context) {
    late Future<NowPlayingResponse> np;
    np = MoviesProvider().getOnDisplayMovies();

    // TODO: implement build
    return SingleChildScrollView(
        child: Stack(
      children: [/*CardSwiper(),*/ getInfo(context, np)],
    ));
  }

  Widget getInfo(BuildContext context, Future<NowPlayingResponse> np) {
    return Center(
      child: FutureBuilder<NowPlayingResponse>(
        future: np,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.results.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data!.results[index].title),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('No hay datos');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
