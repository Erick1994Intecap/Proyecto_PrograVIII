import 'package:cartelera/models/models.dart';
import 'package:flutter/material.dart';
import 'package:cartelera/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(
              title: args.title,
              originalTitle: args.originalTitle,
              voteAverage: args.voteAverage,
            ),
            _Overview(),
            _Overview(),
            _Overview(),
            CastingCards()
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key); //

  //

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: FadeInImage(
          placeholder: AssetImage('assets/no_image.jpeg'),
          image: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
          width: 130,
          height: 190,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final String title;
  final String originalTitle;
  final double voteAverage;

  _PosterAndTitle(
      {required this.title,
      required this.originalTitle,
      required this.voteAverage});
  //const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TEMA
    final TextTheme textTheme = Theme.of(context).textTheme;
    //MEDIA QUERY
    final size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Hero(
              tag: 'movie.horeId!',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no_image.jpeg'),
                  image: NetworkImage('https://via.placeholder.com/200x300'),
                  height: 150,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width - 190),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    originalTitle,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_outline,
                        size: 15,
                        color: Colors.cyan,
                      ),
                      SizedBox(width: 5),
                      Text(voteAverage.toStringAsPrecision(2),
                          style: textTheme.caption),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'movie.overview: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
