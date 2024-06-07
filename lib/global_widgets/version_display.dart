import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';


class VersionDisplay extends StatefulWidget {
  @override
  _VersionDisplayState createState() => _VersionDisplayState();
}

class _VersionDisplayState extends State<VersionDisplay> {
  String version = '';
  String buildNumber = '';

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
      buildNumber = info.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Version $version + build $buildNumber');
  }
}
