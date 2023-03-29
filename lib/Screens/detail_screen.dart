// import 'package:flutter/material.dart';
// import 'package:test_catalyst/Constant/assets_const.dart';
// import 'package:test_catalyst/Constant/colors_const.dart';
// import 'package:test_catalyst/ViewModels/home_provider.dart';
//
// class DetailScreen extends StatefulWidget {
//   const DetailScreen({Key? key}) : super(key: key);
//
//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }
//
// class _DetailScreenState extends State<DetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         HomeProvider homeProvider = Get.find();
//         homeProvider.update();
//         return true;
//       },
//       child: GetBuilder<MenuController>(
//           init: MenuController()..getMenu(menu.idMenu!),
//           builder: (value) {
//             return Scaffold(
//               floatingActionButton: value.isLoading.isFalse
//                   ? FloatingActionButton(
//                       onPressed: () {
//                         value.share();
//                       },
//                       child: const Icon(Icons.share),
//                     )
//                   : Container(),
//               body: SafeArea(
//                 child: LayoutBuilder(builder:
//                     (BuildContext context, BoxConstraints constraints) {
//                   return value.isLoading.isTrue
//                       ? Shimmer.fromColors(
//                           baseColor: Colors.grey[300]!,
//                           highlightColor: Colors.grey[100]!,
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(25.0),
//                                 child: Container(
//                                   width: 240,
//                                   height: 180,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               ConstrainedBox(
//                                 constraints: BoxConstraints(
//                                     minHeight: constraints.maxHeight - 230),
//                                 child: Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(30),
//                                       topRight: Radius.circular(30),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       : SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(25.0),
//                                 child: SizedBox(
//                                   width: 240,
//                                   height: 180,
//                                   child: Image.network(
//                                       value.menuDetailResponse?.data?.menu
//                                               ?.foto ??
//                                           "https://i.ibb.co/R9kJtny/1637916829.png",
//                                       fit: BoxFit.contain),
//                                 ),
//                               ),
//                               ConstrainedBox(
//                                 constraints: BoxConstraints(
//                                     minHeight: constraints.maxHeight - 230),
//                                 child: Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(30),
//                                       topRight: Radius.circular(30),
//                                     ),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 25,
//                                       vertical: 45,
//                                     ),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(
//                                               value.menuDetailResponse?.data
//                                                       ?.menu?.nama ??
//                                                   "Title of Menu",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w700,
//                                                 fontSize: 24,
//                                                 color:
//                                                     ColorsConst.secondaryColor,
//                                               ),
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     value.subtractAmount();
//                                                   },
//                                                   child: Container(
//                                                     width: 20,
//                                                     height: 20,
//                                                     decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                         width: 1,
//                                                         color: const Color
//                                                                 .fromRGBO(
//                                                             0, 154, 173, 1),
//                                                       ),
//                                                     ),
//                                                     alignment: Alignment.center,
//                                                     child: Icon(
//                                                       Icons.remove,
//                                                       size: 12,
//                                                       color: ColorsConst
//                                                           .secondaryColor,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 const SizedBox(width: 10),
//                                                 Text(value.menuHive.jumlah
//                                                     .toString()),
//                                                 const SizedBox(width: 10),
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     value.addAmount();
//                                                   },
//                                                   child: Container(
//                                                       width: 20,
//                                                       height: 20,
//                                                       decoration: BoxDecoration(
//                                                         color: ColorsConst
//                                                             .secondaryColor,
//                                                         border: Border.all(
//                                                           width: 1,
//                                                           color: const Color
//                                                                   .fromRGBO(
//                                                               0, 154, 173, 1),
//                                                         ),
//                                                       ),
//                                                       alignment:
//                                                           Alignment.center,
//                                                       child: const Icon(
//                                                         Icons.add,
//                                                         size: 12,
//                                                         color: Colors.white,
//                                                       )),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                           value.menuDetailResponse?.data?.menu
//                                                   ?.deskripsi ??
//                                               "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         const Divider(),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 18,
//                                                   height: 18,
//                                                   child: Image.asset(
//                                                     AssetsConst.imagesPath +
//                                                         AssetsConst.enterIcon,
//                                                     fit: BoxFit.contain,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 8,
//                                                 ),
//                                                 const Text(
//                                                   "price",
//                                                   style: TextStyle(
//                                                     fontSize: 20,
//                                                     fontWeight: FontWeight.w600,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Text(
//                                               "Rp. ${value.menuHive.harga ?? "0.00"}",
//                                               style: const TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.w800,
//                                                 color: Color.fromRGBO(
//                                                     0, 154, 173, 1),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         const Divider(),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         value.menuDetailResponse!.data!.level!
//                                                 .isNotEmpty
//                                             ? Column(
//                                                 children: [
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       showLevelBottomSheet(
//                                                           context, value);
//                                                     },
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Row(
//                                                           children: [
//                                                             SizedBox(
//                                                               width: 18,
//                                                               height: 18,
//                                                               child:
//                                                                   Image.asset(
//                                                                 AssetsConst
//                                                                         .imagesPath +
//                                                                     AssetsConst
//                                                                         .enterIcon,
//                                                                 fit: BoxFit
//                                                                     .contain,
//                                                               ),
//                                                             ),
//                                                             const SizedBox(
//                                                               width: 8,
//                                                             ),
//                                                             const Text(
//                                                               "Level",
//                                                               style: TextStyle(
//                                                                 fontSize: 20,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w600,
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         Row(
//                                                           children: [
//                                                             Text(
//                                                               value.menuHive
//                                                                   .keteranganLevel,
//                                                               style: TextStyle(
//                                                                   fontSize: 20,
//                                                                   color: ColorsConst
//                                                                       .textColor),
//                                                             ),
//                                                             const SizedBox(
//                                                               width: 12,
//                                                             ),
//                                                             Icon(
//                                                                 Icons
//                                                                     .chevron_right_rounded,
//                                                                 size: 18,
//                                                                 color: ColorsConst
//                                                                     .textColor)
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                   const Divider(),
//                                                   const SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                 ],
//                                               )
//                                             : Container(),
//                                         value.menuDetailResponse!.data!.topping!
//                                                 .isNotEmpty
//                                             ? Column(
//                                                 children: [
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       showTopingBottomSheet(
//                                                           context, value);
//                                                     },
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Row(
//                                                           children: [
//                                                             SizedBox(
//                                                               width: 18,
//                                                               height: 18,
//                                                               child:
//                                                                   Image.asset(
//                                                                 AssetsConst
//                                                                         .imagesPath +
//                                                                     AssetsConst
//                                                                         .enterIcon,
//                                                                 fit: BoxFit
//                                                                     .contain,
//                                                               ),
//                                                             ),
//                                                             const SizedBox(
//                                                               width: 8,
//                                                             ),
//                                                             const Text(
//                                                               "Topping",
//                                                               style: TextStyle(
//                                                                 fontSize: 20,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w600,
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         Row(
//                                                           children: [
//                                                             Text(
//                                                               value.getToppingName(value
//                                                                   .menuHive
//                                                                   .toppingDetail!
//                                                                   .map((e) => e
//                                                                       .keterangan)
//                                                                   .toList()),
//                                                               style: TextStyle(
//                                                                   fontSize: 20,
//                                                                   color: ColorsConst
//                                                                       .textColor),
//                                                             ),
//                                                             const SizedBox(
//                                                               width: 12,
//                                                             ),
//                                                             Icon(
//                                                                 Icons
//                                                                     .chevron_right_rounded,
//                                                                 size: 18,
//                                                                 color: ColorsConst
//                                                                     .textColor)
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                   const Divider(),
//                                                   const SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                 ],
//                                               )
//                                             : Container(),
//                                         GestureDetector(
//                                           onTap: () {
//                                             showNoteBottomSheet(context, value);
//                                           },
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   SizedBox(
//                                                     width: 18,
//                                                     height: 18,
//                                                     child: Image.asset(
//                                                       AssetsConst.imagesPath +
//                                                           AssetsConst.enterIcon,
//                                                       fit: BoxFit.contain,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 8,
//                                                   ),
//                                                   const Text(
//                                                     "note",
//                                                     style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     value.menuHive.catatan
//                                                             .isNotEmpty
//                                                         ? value.menuHive.catatan
//                                                                     .length >
//                                                                 20
//                                                             ? value.menuHive
//                                                                     .catatan
//                                                                     .substring(
//                                                                         0, 17) +
//                                                                 "..."
//                                                             : value.menuHive
//                                                                 .catatan
//                                                         : "",
//                                                     style: TextStyle(
//                                                         fontSize: 20,
//                                                         color: ColorsConst
//                                                             .textColor),
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 12,
//                                                   ),
//                                                   Icon(
//                                                       Icons
//                                                           .chevron_right_rounded,
//                                                       size: 18,
//                                                       color:
//                                                           ColorsConst.textColor)
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         const Divider(),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         GestureDetector(
//                                           onTap: () {
//                                             value.addMenu();
//                                           },
//                                           child: ButtonComponents(
//                                             buttonTitle: "add_to_cart",
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                 }),
//               ),
//             );
//           }),
//     );
//   }
// }
