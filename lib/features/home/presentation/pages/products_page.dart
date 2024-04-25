import 'package:browse_it/core/theme/app_pallete.dart';
import 'package:browse_it/features/home/data/models/product_model.dart';
import 'package:browse_it/features/home/presentation/BLoC/bloc/home_bloc.dart';
import 'package:browse_it/features/home/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BROWSEIT',
        ),
        backgroundColor: AppPallete.neonBlueColor,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingProductsListPage) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SuccessLoadingProductsListPage) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.all(10.dm),
                  child: Padding(
                    padding: EdgeInsets.all(10.dm),
                    child: ProductCardWidget(
                        product: state.products[index] as ProductModel),
                  ),
                ),
              );
            } else if (state is FailureLoadingProductsListPage) {
              return const Center(
                child: Text('Something Went Wrong!'),
              );
            } else {
              homeBloc.loadCategories();
              return const Center(
                child: Text('Something Is Wrong!'),
              );
            }
          }),
    );
  }
}
