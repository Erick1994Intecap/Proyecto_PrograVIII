import 'package:cartelera/models/models.dart';
import 'package:cartelera/models/top_rated_response.dart';
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
