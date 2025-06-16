import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';

import 'package:e_naam/presentation/blocs/fetch_categories_bloc/fetch_categories_bloc.dart';
import 'package:e_naam/presentation/blocs/fetch_product_blac/fetch_product_bloc.dart';
import 'package:e_naam/presentation/screens/screen_productdetailpage/product_detailpage.dart';
import 'package:e_naam/presentation/screens/screen_redeem/widgets/grid_shimmer%20widget.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_networkimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductslistsPage extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  const ProductslistsPage(
      {super.key, required this.categoryId, required this.categoryName});

  @override
  State<ProductslistsPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<ProductslistsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<FetchProductBloc>()
        .add(FetchProductButtonClickEvent(categoryId: widget.categoryId));
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
                    ResponsiveSizedBox.width(10),
                    Flexible(
                      child: Text(
                        widget.categoryName,
                        style: TextStyle(
                          fontSize: ResponsiveUtils.wp(5),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Find products of your choice',
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
              child: BlocBuilder<FetchProductBloc, FetchProductState>(
                builder: (context, state) {
                  if (state is FetchProductLoadingState) {
                    return const GridloadingShimmerWidget();
                  }
                  if (state is FethchProductSuccessState) {
                    return state.products.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 80,
                                  color: Appcolors.ksecondrycolor,
                                ),
                                const SizedBox(height: 16),
                                TextStyles.subheadline(
                                  text: 'Product not available',
                                  color: Appcolors.kprimarycolor,
                                ),
                              ],
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 6,
                              childAspectRatio:
                                  0.7, // Control aspect ratio instead of fixed height
                            ),
                            itemCount: state.products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        width: .3,
                                        color: Appcolors.kprimarycolor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(milliseconds: 600),
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            ProductDetailpage(
                                          product: state.products[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(ResponsiveUtils.wp(2)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Hero(
                                              tag: state
                                                  .products[index].productId,
                                              child: ImageWithFallback(
                                                imageUrl: state.products[index]
                                                    .productPicture,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: ResponsiveUtils.hp(1)),
                                        // Product name with flexible height
                                        Expanded(
                                          child: Text(
                                            state.products[index].productName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Appcolors.kblackColor,
                                              fontSize: ResponsiveUtils.wp(3),
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        // SizedBox(height: ResponsiveUtils.hp(0.5)),

                                        Text(
                                          '${state.products[index].redeemPoints} pts',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Appcolors.kprimarycolor,
                                            fontSize: ResponsiveUtils.wp(3.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                  } else if (state is FetchProductErrorState) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return const SizedBox.shrink();
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
