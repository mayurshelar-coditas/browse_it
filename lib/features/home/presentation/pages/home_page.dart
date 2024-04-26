import 'package:browse_it/core/theme/app_pallete.dart';
import 'package:browse_it/features/home/domain/entities/category_entity.dart';
import 'package:browse_it/features/home/presentation/BLoC/bloc/home_bloc.dart';
import 'package:browse_it/features/home/presentation/pages/products_page.dart';
import 'package:browse_it/features/home/presentation/widgets/categories_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.loadCategories();
    return Scaffold(
      appBar: AppBar(
        title: const Text('BROWSEIT'),
        backgroundColor: AppPallete.neonBlueColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.dm),
        child: BlocConsumer<HomeBloc, HomeState>(
          listenWhen: ((previous, current) => current is HomeActionState),
          buildWhen: ((previous, current) => current is! HomeActionState),
          listener: (context, state) {
            if (state is NavigateToProductsPage) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductsPage(),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingCategoriesState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SuccessLoadingCategoriesState) {
              return Column(children: [
                Text(
                  'Categories',
                  style: GoogleFonts.roboto(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.h,
                    mainAxisSpacing: 10.w,
                    childAspectRatio: 1,
                    children: List.generate(
                      state.categories.length,
                      (index) => GestureDetector(
                        onTap: () => homeBloc.add(
                          OnCategoryClickedEvent(
                              categoryName: state.categories[index].name),
                        ),
                        child: CategoeriesCardWidget(
                            categoryEntity: state.categories[index]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                SizedBox(
                  height: 100.h,
                  child: GestureDetector(
                    onTap: () => homeBloc.add(
                      OnCategoryClickedEvent(categoryName: 'all'),
                    ),
                    child: CategoeriesCardWidget(
                      categoryEntity: CategoryEntity(name: 'All'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                )
              ]);
            } else if (state is FailureLoadingCategoriesState) {
              return const Center(
                child: Text('Something Went Wrong!'),
              );
            } else {
              
              return const Center(
                child: Text('Something Is Wrong!!!!'),
              );
            }
          },
        ),
      ),
    );
  }
}
