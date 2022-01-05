import 'package:permission_handler/permission_handler.dart';

class LocationPermissionManager {
  final permission = Permission.locationWhenInUse;

  Future<void> request({
    required final OnPermanentlyDenied onPermanentlyDenied,
    required final OnGranted onGranted,
  }) async {
    PermissionStatus status = await permission.status;
    print("LocationPermissionManager status: $status");

    if (!status.isLimited && !status.isGranted) {
      final PermissionStatus result = await permission.request();
      if (result.isPermanentlyDenied) {
        onPermanentlyDenied.call();
        return;
      }
      if (!result.isGranted) {
        return;
      }
    }
    onGranted.call();
  }
}

typedef OnPermanentlyDenied = void Function();

typedef OnGranted = void Function();