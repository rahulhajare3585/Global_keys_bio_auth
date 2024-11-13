// import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:vpn_detector/vpn_detector.dart';

// enum NetworkStatusType { Connected, Disconnected, VPN }

// bool _isVpnActive = false;
// final _vpnDetectorPlugin = VpnDetector();

// class NetworkStatus {
//   final Connectivity _connectivity = Connectivity();

//   /// Checks the current network status and returns [NetworkStatusType]
//   Future<NetworkStatusType> getNetworkStatus() async {
//     var connectivityResult = await _connectivity.checkConnectivity();

//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       return NetworkStatusType.Connected;
//     } else {
//       _isVpnActive = await _vpnDetectorPlugin.isVpnActive();
//       if (_isVpnActive) {
//         return NetworkStatusType.VPN;
//       }
//       return NetworkStatusType.Disconnected;
//     }
//   }

//   Stream<NetworkStatusType> get onNetworkStatusChanged {
//     return _connectivity.onConnectivityChanged
//         .asyncMap((connectivityResult) async {
//       if (connectivityResult == ConnectivityResult.mobile ||
//           connectivityResult == ConnectivityResult.wifi) {
//         return NetworkStatusType.Connected;
//       } else {
//         // The await expression needs to be inside an async function
//         _isVpnActive = await _vpnDetectorPlugin.isVpnActive();
//         if (_isVpnActive) {
//           return NetworkStatusType.VPN;
//         }
//         return NetworkStatusType.Disconnected;
//       }
//     });
//   }
// }
