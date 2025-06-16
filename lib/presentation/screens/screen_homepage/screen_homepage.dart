import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/data/profile_model.dart';
import 'package:e_naam/data/update_profilemodel.dart';
import 'package:e_naam/presentation/blocs/fetch_banners/fetch_banners_bloc.dart';
import 'package:e_naam/presentation/blocs/fetch_categories_bloc/fetch_categories_bloc.dart';
import 'package:e_naam/presentation/blocs/fetch_latest_products/fetch_latest_product_bloc.dart';

import 'package:e_naam/presentation/blocs/fetch_profile/fetch_profile_bloc.dart';
import 'package:e_naam/presentation/screens/edit_profile/edit_profilepage.dart';
import 'package:e_naam/presentation/screens/productlists/productslists.dart';
import 'package:e_naam/presentation/screens/screen_categorypage/screen_categorypage.dart';
import 'package:e_naam/presentation/screens/screen_loginpage/screen_loginpage.dart';
import 'package:e_naam/presentation/screens/screen_notificationpage/notificationpage.dart';
import 'package:e_naam/presentation/screens/screen_productdetailpage/product_detailpage.dart';
import 'package:e_naam/presentation/screens/screen_redeem/widgets/grid_shimmer%20widget.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_networkimage.dart';
import 'package:e_naam/widgets/customdrawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shimmer/shimmer.dart';

class ScreenHomepage extends StatefulWidget {
  const ScreenHomepage({super.key});

  @override
  State<ScreenHomepage> createState() => _ScreenHomepageState();
}

class _ScreenHomepageState extends State<ScreenHomepage> {
  bool _isAlertShown = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchBannersBloc>().add(FetchBannersInitialEvent());
    context.read<FetchProfileBloc>().add(FetchProfileInitialEvent());
    context.read<FetchCategoriesBloc>().add(FetchCategoriesInitialeEvent());
    context
        .read<FetchLatestProductBloc>()
        .add(FetchLatestProductInitialEvent());
  }

  void _showProfileIncompleteAlert({required ProfileModel profile}) {
    if (!_isAlertShown) {
      _isAlertShown = true;
      showDialog(
        context: context,
        barrierDismissible: false, // Prevents dismissing by tapping outside
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false, // Prevents back button dismissal
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 10,
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                content: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue.shade50,
                        Colors.white,
                        Colors.orange.shade50,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon Section
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.deepOrange.shade500,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person_outline_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Title
                      Text(
                        'Profile is incomplete',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                          letterSpacing: 0.5,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Content
                      Text(
                        'Please update your profile in order to gain the complete access to our reward system',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                          height: 1.5,
                          letterSpacing: 0.2,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Button
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade600,
                              Colors.blue.shade700,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenEditProfilepage(
                                  profile: UpdateProfilemodel(
                                    userFullName: profile.userFullName,
                                    userOccupation: profile.userOccupation,
                                    userUPIAddress: profile.userUPIAddress,
                                    panCardID: profile.panCardID,
                                    adharCardID: profile.adharCardID,
                                    address: profile.address,
                                    gst: profile.gst,
                                  ),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Update profile',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          color: Appcolors.kprimarycolor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      padding:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveSizedBox.height50,
                          Row(
                            children: [
                              BlocConsumer<FetchProfileBloc, FetchProfileState>(
                                listener: (context, state) async {
                                  if (state is FetchProfileSuccessState) {
                                    if (state.profile.profileStatus ==
                                        "Incomplete") {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        _showProfileIncompleteAlert(
                                            profile: state.profile);
                                      });
                                    }
                                  } else if (state is FetchProfileErrorState) {
                                    if (state.message == "Expired token") {
                                      SharedPreferences preferences =
                                          await SharedPreferences.getInstance();
                                      await preferences.remove('USER_TOKEN');
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ScreenLoginpage()),
                                        (Route<dynamic> route) => false,
                                      );
                                    }
                                  }
                                },
                                builder: (context, state) {
                                  if (state is FetchProfileSuccessState) {
                                    return TextStyles.subheadline(
                                        text:
                                            'Hello ${state.profile.userFullName}',
                                        color: Appcolors.kwhiteColor);
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  CustomNavigation.pushWithTransition(
                                      context, NotificationPage());
                                },
                                child: const Icon(
                                  Icons.notifications,
                                  size: 25,
                                  color: Appcolors.korangeColor,
                                ),
                              ),
                              ResponsiveSizedBox.width5,
                              Builder(builder: (context) {
                                return GestureDetector(
                                    onTap: () {
                                      Scaffold.of(context).openEndDrawer();
                                    },
                                    child: const Icon(
                                      Icons.menu,
                                      color: Appcolors.kwhiteColor,
                                    ));
                              }),
                            ],
                          ),
                          ResponsiveSizedBox.height30,
                          BlocBuilder<FetchProfileBloc, FetchProfileState>(
                            builder: (context, state) {
                              if (state is FetchProfileLoadingState) {
                                return Shimmer.fromColors(
                                  baseColor:
                                      Appcolors.kprimarycolor.withOpacity(.2),
                                  highlightColor:
                                      const Color.fromARGB(255, 255, 248, 244),
                                  period: const Duration(seconds: 3),
                                  enabled: true,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Appcolors.ksecondrycolor,
                                    ),
                                    height: ResponsiveUtils.hp(15),
                                    width: double.infinity,
                                  ),
                                );
                              }
                              if (state is FetchProfileSuccessState) {
                                return _buildPointsValueSection(
                                    state.profile.userPoints);
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                        ],
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveSizedBox.height20,
                        _buildFlyerOffersSection(),
                        ResponsiveSizedBox.height10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Redeem Categories",
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
                                          color:
                                              Color.fromARGB(255, 67, 67, 67),
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
                                child: BlocBuilder<FetchCategoriesBloc,
                                    FetchCategoriesState>(
                                  builder: (context, state) {
                                    if (state is FetchCategoriesLoadingState) {
                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        //padding: const EdgeInsets.symmetric(horizontal: 12),
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return Shimmer.fromColors(
                                            baseColor: Appcolors.kprimarycolor
                                                .withOpacity(.2),
                                            highlightColor:
                                                const Color.fromARGB(
                                                    255, 255, 245, 245),
                                            period: const Duration(seconds: 3),
                                            enabled: true,
                                            child: Container(
                                              margin: EdgeInsets.only(right: 5),
                                              width: ResponsiveUtils.wp(30),
                                              height: ResponsiveUtils.wp(8),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[100],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
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
                                          final category =
                                              state.categories[index];

                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: GestureDetector(
                                              onTap: () {
                                                CustomNavigation
                                                    .pushWithTransition(
                                                        context,
                                                        ProductslistsPage(
                                                          categoryId: category
                                                              .categoryId,
                                                          categoryName: category
                                                              .categoryName,
                                                        ));
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 8),
                                                decoration: BoxDecoration(
                                                  // Change background color based on selection
                                                  color: Appcolors
                                                      .ksecondrycolor
                                                      .withOpacity(.4),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width:
                                                          ResponsiveUtils.wp(8),
                                                      height:
                                                          ResponsiveUtils.wp(8),
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[100],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        child:
                                                            ImageWithFallback(
                                                          imageUrl: category
                                                              .categoryImage,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    ResponsiveSizedBox.width10,
                                                    Text(
                                                      category.categoryName,
                                                      style: TextStyle(
                                                          fontSize:
                                                              ResponsiveUtils
                                                                  .wp(3),
                                                          // Change text color based on selection
                                                          color: Appcolors
                                                              .kprimarycolor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else if (state
                                        is FetchCategoriesErrorState) {
                                      return Center(
                                        child: Text(state.message),
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  },
                                )),
                            ResponsiveSizedBox.height20,
                            const Text(
                              'Latest Products',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Appcolors.kblackColor,
                              ),
                            ),
                            ResponsiveSizedBox.height10,
                            BlocBuilder<FetchLatestProductBloc,
                                FetchLatestProductState>(
                              builder: (context, state) {
                                if (state is FetchLatestProductsLoadingState) {
                                  return const GridloadingShimmerWidget();
                                }
                                if (state is FetchLatestProductSuccessState) {
                                  return state.latestproducts.isEmpty
                                      ? Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.category_rounded,
                                                size: 80,
                                                color: Appcolors.ksecondrycolor,
                                              ),
                                              const SizedBox(height: 16),
                                              TextStyles.subheadline(
                                                text: 'Products not available',
                                                color: Appcolors.kprimarycolor,
                                              ),
                                            ],
                                          ),
                                        )
                                      : GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: const EdgeInsets.all(8),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 6,
                                            mainAxisSpacing: 6,
                                            childAspectRatio:
                                                0.7, // Control aspect ratio instead of fixed height
                                          ),
                                          itemCount:
                                              state.latestproducts.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                      width: .3,
                                                      color: Appcolors
                                                          .kprimarycolor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    PageRouteBuilder(
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  600),
                                                      pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) =>
                                                          ProductDetailpage(
                                                        product: state
                                                                .latestproducts[
                                                            index],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      ResponsiveUtils.wp(2)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AspectRatio(
                                                        aspectRatio: 1,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          child: Hero(
                                                            tag: state
                                                                .latestproducts[
                                                                    index]
                                                                .productId,
                                                            child:
                                                                ImageWithFallback(
                                                              imageUrl: state
                                                                  .latestproducts[
                                                                      index]
                                                                  .productPicture,
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height:
                                                              ResponsiveUtils
                                                                  .hp(1)),
                                                      // Product name with flexible height
                                                      Expanded(
                                                        child: Text(
                                                          state
                                                              .latestproducts[
                                                                  index]
                                                              .productName,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Appcolors
                                                                .kblackColor,
                                                            fontSize:
                                                                ResponsiveUtils
                                                                    .wp(3),
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      // SizedBox(height: ResponsiveUtils.hp(0.5)),

                                                      Text(
                                                        '${state.latestproducts[index].redeemPoints} pts',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Appcolors
                                                              .kprimarycolor,
                                                          fontSize:
                                                              ResponsiveUtils
                                                                  .wp(3.8),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                } else if (state
                                    is FetchLatestProductsErrorState) {
                                  return Center(
                                    child: Text('hompage${state.message}'),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveUtils.hp(10),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointsValueSection(String points) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 40, 37, 58),
            Color(0xFF242438),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: CustomPaint(
        painter: PointsBackgroundPainter(),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveSizedBox.height10,
                Row(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 141, 113, 74),
                          Color(0xFFFFC149),
                        ],
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.emoji_events_rounded,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    ResponsiveSizedBox.width10,
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 169, 141, 100),
                          Color(0xFFFFC149),
                        ],
                      ).createShader(bounds),
                      child: TextStyles.subheadline(
                        text: '$points Points',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ResponsiveSizedBox.height20,
                TextStyles.medium(
                  text: 'Your eNaam points',
                  color: Appcolors.kwhiteColor,
                ),
                ResponsiveSizedBox.height20
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                navigateToMainPage(context, 3);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: Appcolors.ksecondrycolor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextStyles.medium(
                  text: 'Redeem Now',
                  color: Appcolors.ksecondrycolor,
                  weight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFlyerOffersSection() {
    // // Sample data for carousel items
    // final List<Map<String, dynamic>> offerItems = List.generate(
    //   10,
    //   (index) => {
    //     'image':
    //         "https://c8.alamy.com/comp/F6NBD8/various-type-of-plumbing-tools-against-white-background-F6NBD8.jpg",
    //     'expiryText': index % 2 == 0 ? "Expires Today" : "Expires in 3 days",
    //     'isNew': index % 3 == 0,
    //   },
    // );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<FetchBannersBloc, FetchBannersState>(
          builder: (context, state) {
            if (state is FetchBannersLoadingState) {
              return Shimmer.fromColors(
                baseColor: Appcolors.kprimarycolor.withOpacity(.2),
                highlightColor: const Color.fromARGB(255, 255, 248, 244),
                period: const Duration(seconds: 3),
                enabled: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Appcolors.ksecondrycolor,
                  ),
                  height: ResponsiveUtils.hp(23),
                  width: double.infinity,
                ),
              );
            }
            if (state is FetchBannersSuccessState) {
              return CarouselSlider.builder(
                itemCount: state.banners.length,
                options: CarouselOptions(
                  height: 190,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (context, index, realIndex) {
                  return _buildOfferCard(
                    image: state.banners[index].bannerAddress,
                    // expiryText: offerItems[index]['expiryText'],
                    // isNew: offerItems[index]['isNew'],
                  );
                },
              );
            } else if (state is FetchBannersErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }

  Widget _buildOfferCard({
    required String image,
    // required String expiryText,
    // required bool isNew,
  }) {
    // Get screen width to make the card full width
    return Builder(
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(.3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey,
                  child: const Center(
                    child: Icon(Icons.error, color: Colors.white),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class PointsBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create a paint for drawing circles
    // final Paint circlePaint = Paint()
    //   ..color = Colors.white.withOpacity(0.05)
    //   ..style = PaintingStyle.fill;

    // Draw decorative circles
    // canvas.drawCircle(
    //   Offset(size.width * 0.1, size.height * 0.8),
    //   size.width * 0.15,
    //   circlePaint,
    // );

    // canvas.drawCircle(
    //   Offset(size.width * 0.85, size.height * 0.2),
    //   size.width * 0.1,
    //   circlePaint,
    // );

    // Draw dotted pattern
    final Paint dotPaint = Paint()
      ..color = Colors.white.withOpacity(0.07)
      ..style = PaintingStyle.fill;

    final double dotSize = 3;
    final double spacing = 15;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        if ((x + y) % (spacing * 2) == 0) {
          canvas.drawCircle(Offset(x, y), dotSize, dotPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
