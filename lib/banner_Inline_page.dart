// import 'package:flutter/material.dart';
// import 'package:flutter_nosmoking/ad_helper.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class BannerInlinePage extends StatefulWidget {
//   final List<Destination> entries;
//
//   BannerInlinePage({
//     required this.entries,
//   });
//
//   @override
//   State createState() => _BannerInlinePageState();
// }
//
// class _BannerInlinePageState extends State<BannerInlinePage> {
//   // COMPLETE: Add _kAdIndex
//   static final _kAdIndex = 4;
//
//   // COMPLETE: Add a BannerAd instance
//   late BannerAd _ad;
//
//   // COMPLETE: Add _isAdLoaded
//   bool _isAdLoaded = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // COMPLETE: Create a BannerAd instance
//     _ad = BannerAd(
//       adUnitId: AdManager.bannerAdUnitId,
//       size: AdSize.banner,
//       request: AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (_) {
//           setState(() {
//             _isAdLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (ad, error) {
//           // Releases an ad resource when it fails to load
//           ad.dispose();
//
//           print('Ad load failed (code=${error.code} message=${error.message})');
//         },
//       ),
//     );
//
//     // COMPLETE: Load an ad
//     _ad.load();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AdMob Banner Inline Ad'),
//       ),
//       body: ListView.builder(
//         // COMPLETE: Adjust itemCount based on the ad load state
//         itemCount: widget.entries.length + (_isAdLoaded ? 1 : 0),
//         itemBuilder: (context, index) {
//           // COMPLETE: Render a banner ad
//           if (_isAdLoaded && index == _kAdIndex) {
//             return Container(
//               child: AdWidget(ad: _ad),
//               width: _ad.size.width.toDouble(),
//               height: 72.0,
//               alignment: Alignment.center,
//             );
//           } else {
//             // COMPLETE: Get adjusted item index from _getDestinationItemIndex()
//             final item = widget.entries[_getDestinationItemIndex(index)];
//
//             return ListTile(
//               leading: Image.asset(
//                 item.asset,
//                 width: 48,
//                 height: 48,
//                 package: 'flutter_gallery_assets',
//                 fit: BoxFit.cover,
//               ),
//               title: Text(item.name),
//               subtitle: Text(item.duration),
//               onTap: () {
//                 print('Clicked ${item.name}');
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     // COMPLETE: Dispose a BannerAd object
//     _ad.dispose();
//     super.dispose();
//   }
//
//   // COMPLETE: Add _getDestinationItemIndex()
//   int _getDestinationItemIndex(int rawIndex) {
//     if (rawIndex >= _kAdIndex && _isAdLoaded) {
//       return rawIndex - 1;
//     }
//     return rawIndex;
//   }
// }
//
//
// class Destination {
//   static final List<Destination> samples = [
//     Destination(
//       name: 'Aspen, United States',
//       duration: '1 stop · 6h 15m',
//       asset: 'crane/destinations/fly_0.jpg',
//     ),
//     Destination(
//       name: 'Big Sur, United States',
//       duration: 'Nonstop · 13h 30m',
//       asset: 'crane/destinations/fly_1.jpg',
//     ),
//     Destination(
//       name: 'Khumbu Valley, Nepal',
//       duration: 'Nonstop · 5h 16m',
//       asset: 'crane/destinations/fly_2.jpg',
//     ),
//     Destination(
//       name: 'Machu Picchu, Peru',
//       duration: '2 stops · 19h 40m',
//       asset: 'crane/destinations/fly_3.jpg',
//     ),
//     Destination(
//       name: 'Malé, Maldives',
//       duration: 'Nonstop · 8h 24m',
//       asset: 'crane/destinations/fly_4.jpg',
//     ),
//     Destination(
//       name: 'Vitznau, Switzerland',
//       duration: '1 stop · 14h 12m',
//       asset: 'crane/destinations/fly_5.jpg',
//     ),
//     Destination(
//       name: 'Mexico City, Mexico',
//       duration: 'Nonstop · 5h 24m',
//       asset: 'crane/destinations/fly_6.jpg',
//     ),
//     Destination(
//       name: 'Mount Rushmore, United States',
//       duration: '1 stop · 5h 43m',
//       asset: 'crane/destinations/fly_7.jpg',
//     ),
//     Destination(
//       name: 'Singapore',
//       duration: 'Nonstop · 8h 25m',
//       asset: 'crane/destinations/fly_8.jpg',
//     ),
//     Destination(
//       name: 'Havana, Cuba',
//       duration: '1 stop · 15h 52m',
//       asset: 'crane/destinations/fly_9.jpg',
//     ),
//     Destination(
//       name: 'Cairo, Egypt',
//       duration: 'Nonstop · 5h 57m',
//       asset: 'crane/destinations/fly_10.jpg',
//     ),
//     Destination(
//       name: 'Lisbon, Portugal',
//       duration: '1 stop · 13h 24m',
//       asset: 'crane/destinations/fly_11.jpg',
//     ),
//   ];
//
//   final String name;
//
//   final String duration;
//
//   final String asset;
//
//   Destination({
//     required this.name,
//     required this.duration,
//     required this.asset,
//   });
// }