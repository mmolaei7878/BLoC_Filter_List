import 'package:blocfilterlist/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              context.read<ProductBloc>().add(FilterProductEvent(query: value));
            },
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  child: Text('All'),
                  value: 'all',
                ),
                PopupMenuItem(
                  child: Text('MAN Clothing'),
                  value: 'men clothing',
                ),
                PopupMenuItem(
                  child: Text('WOMEN Clothing'),
                  value: 'women clothing',
                ),
                PopupMenuItem(
                  child: Text('Jewelery'),
                  value: 'jewelery',
                ),
                PopupMenuItem(
                  child: Text('Electronic'),
                  value: 'electronics',
                ),
              ];
            },
          )
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (ctx, state) {
          if (state is ProductInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductFailed) {
            return Center(
              child: Text('Failed'),
            );
          } else if (state is ProductSucceed) {
            return Container(
              width: deviceSize.width,
              height: deviceSize.height,
              child: ListView.builder(
                  key: ValueKey('TestingListView'),
                  itemCount: state.list.length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      width: 300,
                      height: 300,
                      child: GridTile(
                        child: Image.network(
                          state.list[i].image,
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        footer: Text(state.list[i].title),
                      ),
                    );
                  }),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
