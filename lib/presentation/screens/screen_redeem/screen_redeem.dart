import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';

import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/presentation/blocs/fetch_categories_bloc/fetch_categories_bloc.dart';
import 'package:e_naam/presentation/blocs/fetch_product_blac/fetch_product_bloc.dart';

import 'package:e_naam/presentation/screens/Screen_orderslist/screen_orderslistpage.dart';
import 'package:e_naam/presentation/screens/screen_categorypage/screen_categorypage.dart';
import 'package:e_naam/presentation/screens/screen_productdetailpage/product_detailpage.dart';
import 'package:e_naam/presentation/screens/screen_redeem/widgets/grid_shimmer%20widget.dart';
import 'package:e_naam/widgets/custom_navigator.dart';

import 'package:e_naam/widgets/custom_networkimage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ScreenRedeemPage extends StatefulWidget {
  const ScreenRedeemPage({super.key});

  @override
  State<ScreenRedeemPage> createState() => _ScreenHistoryPageState();
}

class _ScreenHistoryPageState extends State<ScreenRedeemPage> {
  String? selectedCategoryId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchCategoriesBloc>().add(FetchCategoriesInitialeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocListener(
      listeners: [
        BlocListener<FetchCategoriesBloc, FetchCategoriesState>(
          listener: (context, state) {
            if (state is FetchCategoriesSuccessState &&
                state.categories.isNotEmpty) {
              setState(() {
                selectedCategoryId = state.categories[0].categoryId;
              });
              // Automatically fetch products for the first category
              context.read<FetchProductBloc>().add(
                    FetchProductButtonClickEvent(
                        categoryId: state.categories[0].categoryId),
                  );
            }
          },
        ),
      ],
      child: SingleChildScrollView(
          child: Column(children: [
        Stack(clipBehavior: Clip.none, children: [
          Container(
            color: Appcolors.kprimarycolor,
            height: ResponsiveUtils.hp(25),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: const Text(
              textAlign: TextAlign.center,
              'Product List',
              style: TextStyle(
                  color: Appcolors.kwhiteColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              top: ResponsiveUtils.hp(15),
              left: ResponsiveUtils.screenWidth / 18,
              child: Container(
                width: ResponsiveUtils.wp(90),
                height: ResponsiveUtils.hp(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 62, 60, 99),
                      Color.fromARGB(255, 66, 74, 120),
                      Color.fromARGB(255, 113, 151, 220),
                    ],
                  ),
                ),
                child: CustomPaint(
                  painter: PointsCardPainter(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your Points',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // ResponsiveSizedBox.height10,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.emoji_events,
                                color: Colors.amber,
                                size: 30,
                              ),
                              SizedBox(width: 12),
                              Text(
                                '56',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          ResponsiveSizedBox.height5,
                          TextStyles.caption(
                            text: 'Your holding points 3000',
                            color: const Color.fromARGB(255, 255, 226, 137),
                          )
                        ],
                      ),
                      ResponsiveSizedBox.height5,
                      GestureDetector(
                        onTap: () {
                          CustomNavigation.pushWithTransition(
                              context, const OrdersListScreen());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: .5, color: Appcolors.ksecondrycolor)),
                          child: TextStyles.caption(
                              text: 'Redemptions',
                              weight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 226, 137)),
                        ),
                      ),
                      // ResponsiveSizedBox.width10
                    ],
                  ),
                ),
              ))
        ]),
        SizedBox(
          height: ResponsiveUtils.hp(7),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select by Category',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.kblackColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      CustomNavigation.pushWithTransition(
                          context, const CategoryPage());
                    },
                    child: Row(
                      children: [
                        const Text(
                          'VIEW ALL',
                          style: TextStyle(
                            color: Color.fromARGB(255, 67, 67, 67),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: ResponsiveUtils.hp(5),
                  child: BlocBuilder<FetchCategoriesBloc, FetchCategoriesState>(
                    builder: (context, state) {
                      if (state is FetchCategoriesLoadingState) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          //padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor:
                                  Appcolors.kprimarycolor.withOpacity(.2),
                              highlightColor:
                                  const Color.fromARGB(255, 255, 245, 245),
                              period: const Duration(seconds: 3),
                              enabled: true,
                              child: Container(
                                width: ResponsiveUtils.wp(30),
                                height: ResponsiveUtils.wp(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20)
                                 
                                ),
                              ),
                            );
                          },
                        );
                      }
                      if (state is FetchCategoriesSuccessState) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          //padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            final isSelected =
                                selectedCategoryId == category.categoryId;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategoryId = category.categoryId;
                                  });
                                  context.read<FetchProductBloc>().add(
                                      FetchProductButtonClickEvent(
                                          categoryId: category.categoryId));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    // Change background color based on selection
                                    color: isSelected
                                        ? const Color.fromARGB(
                                            255, 166, 232, 168)
                                        : Appcolors.ksecondrycolor
                                            .withOpacity(.4),
                                    borderRadius: BorderRadius.circular(25),
                                    // Optional: Add border for selected state
                                    border: isSelected
                                        ? Border.all(
                                            color: const Color.fromARGB(
                                                255, 38, 142, 42),
                                            width: 1)
                                        : null,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: ResponsiveUtils.wp(8),
                                        height: ResponsiveUtils.wp(8),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          shape: BoxShape.circle,
                                          // Optional: Add shadow for selected state
                                          boxShadow: isSelected
                                              ? [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 4,
                                                    offset: Offset(0, 2),
                                                  )
                                                ]
                                              : null,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: ImageWithFallback(
                                            imageUrl: category.categoryImage,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        category.categoryName,
                                        style: TextStyle(
                                          fontSize: ResponsiveUtils.wp(3),
                                          // Change text color based on selection
                                          color: isSelected
                                              ? Colors.white
                                              : Appcolors.kprimarycolor,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                  )),
              ResponsiveSizedBox.height10,
              const Text(
                'Products',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.kblackColor,
                ),
              ),
              ResponsiveSizedBox.height10,
              BlocBuilder<FetchProductBloc, FetchProductState>(
                builder: (context, state) {
                  if (state is FetchProductLoadingState) {
                    return GridloadingShimmerWidget();
                  }
                  if (state is FethchProductSuccessState) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                        childAspectRatio:
                            0.75, // Control aspect ratio instead of fixed height
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: .3, color: Appcolors.kprimarycolor),
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 600),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                       ProductDetailpage(product:state.products[index],),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(ResponsiveUtils.wp(2)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Hero(
                                        tag: state.products[index].productId,
                                        child: ImageWithFallback(
                                          imageUrl: state
                                              .products[index].productPicture,
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
                    return SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      ])),
    ));
  }
}

class PointsCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint for decorative elements
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Ensure all drawing stays within the canvas boundaries

    // Draw curved lines in top-right corner
    Path path1 = Path();
    path1.moveTo(size.width * 0.7, 0);
    path1.quadraticBezierTo(
        size.width * 0.85, size.height * 0.25, size.width, size.height * 0.2);
    canvas.drawPath(path1, paint);

    Path path2 = Path();
    path2.moveTo(size.width * 0.75, 0);
    path2.quadraticBezierTo(
        size.width * 0.9, size.height * 0.3, size.width, size.height * 0.35);
    canvas.drawPath(path2, paint);

    // Draw circles as accents
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.8),
      size.width * 0.05,
      Paint()
        ..color = Colors.white.withOpacity(0.08)
        ..style = PaintingStyle.fill,
    );

    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.3),
      size.width * 0.08,
      Paint()
        ..color = Colors.white.withOpacity(0.08)
        ..style = PaintingStyle.fill,
    );

    // Draw some diagonal lines in bottom-left
    for (int i = 0; i < 3; i++) {
      double startY = size.height * (0.5 + (i * 0.1));
      double endX = size.width * (0.15 + (i * 0.1));

      canvas.drawLine(
        Offset(0, startY),
        Offset(endX, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
