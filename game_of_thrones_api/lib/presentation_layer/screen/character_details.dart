import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/characters/characters_bloc.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var data = context.read<CharactersBloc>().charactersModels;
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height * 0.75,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              pinned: true,
              floating: true,
              snap: true,
              stretch: true,
              expandedHeight: 160,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  data[index].fullName!,
                  style: TextStyle(color: Colors.grey),
                ),
                background: Image.network(
                  data[index].imageUrl!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemData(
                        part1: 'ID: ',
                        part2: data[index].id.toString(),
                      ),
                      ItemData(
                        part1: 'First Name:',
                        part2: data[index].firstName ?? 'N/A',
                      ),
                      ItemData(
                        part1: 'Last Name:',
                        part2: data[index].lastName ?? 'N/A',
                      ),
                      ItemData(
                        part1: 'Full Name:',
                        part2:
                            '${data[index].firstName ?? ''} ${data[index].lastName ?? ''}',
                      ),
                      ItemData(
                        part1: 'Title:',
                        part2: data[index].title ?? 'N/A',
                      ),
                      ItemData(
                        part1: 'Family:',
                        part2: data[index].family ?? 'N/A',
                      ),
                      ItemData(
                        part1: 'Image:',
                        part2: data[index].image ?? 'N/A',
                      ),
                      ItemData(
                        part1: 'Image URL:',
                        part2: data[index].imageUrl ?? 'N/A',
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemData extends StatelessWidget {
  const ItemData({super.key, required this.part1, required this.part2});
  final String part1;
  final String part2;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(part1),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              part2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
