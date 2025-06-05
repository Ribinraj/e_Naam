import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/main.dart';
import 'package:e_naam/presentation/blocs/fetch_categories_bloc/fetch_categories_bloc.dart';
import 'package:e_naam/presentation/screens/productlists/productslists.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_networkimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchCategoriesBloc>().add(FetchCategoriesInitialeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 247, 243),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Container(
            padding: const EdgeInsets.all(10),
            color: Appcolors.kprimarycolor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResponsiveSizedBox.height30,
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          CustomNavigation.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Appcolors.kwhiteColor,
                        )),
                    ResponsiveSizedBox.width20,
                    Text(
                      'Redeem Categories',
                      style: TextStyle(
                        fontSize: ResponsiveUtils.wp(6),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Explore our categories to find products of your choice',
                  style: TextStyle(
                    fontSize: ResponsiveUtils.wp(3.5),
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                ResponsiveSizedBox.height30
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<FetchCategoriesBloc, FetchCategoriesState>(
                builder: (context, state) {
                  if (state is FetchCategoriesLoadingState) {
                    return const Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Appcolors.ksecondrycolor,
                      ),
                    );
                  }
                  if (state is FetchCategoriesSuccessState) {
                    return GridView.builder(
                      padding: EdgeInsets.all(0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: .8,
                      ),
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return CategoryCard(
                          name: category.categoryName,
                          imageUrl: category.categoryImage,
                          onTap: () {
                            CustomNavigation.pushWithTransition(context, ProductslistsPage(categoryId: category.categoryId, categoryName: category.categoryName));
                          },
                        );
                      },
                    );
                  } else if (state is FetchCategoriesErrorState) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: ImageWithFallback(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Appcolors.kprimarycolor,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.wp(3.5),
                      fontWeight: FontWeight.w500,
                      color: Appcolors.ksecondrycolor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
