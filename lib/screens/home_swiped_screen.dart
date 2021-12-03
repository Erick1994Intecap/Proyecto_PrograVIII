import 'package:cartelera/models/models.dart';
import 'package:cartelera/models/top_rated_response.dart' show TopRatedResponse;
import 'package:cartelera/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSwippedScreen extends StatelessWidget {
  const HomeSwippedScreen({Key? key}) : super(key: key);
//   @override
//   _HomeSwippedState createState() => _HomeSwippedState();
// }

//class _HomeSwippedState extends State<HomeSwippedScreen> {

  @override
  Widget build(BuildContext context) {
    late Future<TopRatedResponse> np;
    np = MoviesProvider().getOnTopMovies();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([getInfo(context, np)]))
        ],
      ),
    );

    // TODO: implement build
    // return CustomScrollView(
    //   slivers: [
    //     SliverList(
    //         delegate: SliverChildListDelegate([
    //       SingleChildScrollView(
    //         child: Column(
    //           children: [getInfo(context, np)],
    //         ),
    //       )
    //     ]))
    //   ],
    // );
  }

  Widget getInfo(BuildContext context, Future<TopRatedResponse> np) {
    return Center(
      child: FutureBuilder<TopRatedResponse>(
        future: np,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.results.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            trailing: Image.network(
                                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2" +
                                    snapshot.data!.results[index]
                                        .posterPath), //posterPath),
                            title: Text(snapshot.data!.results[index].title),
                            subtitle: Text(snapshot
                                    .data!.results[index].voteAverage
                                    .toStringAsPrecision(2) +
                                ' ★'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('Detalles'),
                                onPressed: () {
                                  Navigator.pushNamed(context, 'details',
                                      arguments: Movie(
                                          adult: snapshot
                                              .data!.results[index].adult,
                                          backdropPath: snapshot.data!
                                              .results[index].backdropPath,
                                          id: snapshot.data!.results[index].id,
                                          originalTitle: snapshot.data!
                                              .results[index].originalTitle,
                                          overview: snapshot
                                              .data!.results[index].overview,
                                          popularity: snapshot
                                              .data!.results[index].popularity,
                                          posterPath: snapshot
                                              .data!.results[index].posterPath,
                                          releaseDate: snapshot
                                              .data!.results[index].releaseDate,
                                          title: snapshot
                                              .data!.results[index].title,
                                          video: snapshot
                                              .data!.results[index].video,
                                          voteAverage: snapshot
                                              .data!.results[index].voteAverage,
                                          voteCount: snapshot
                                              .data!.results[index].voteCount));
                                },
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('Similares'),
                                onPressed: () {/* ... */},
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
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
