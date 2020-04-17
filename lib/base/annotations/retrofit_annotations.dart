import 'package:appost/base/network/headers/network_headers.dart' as headers;
import 'package:retrofit/retrofit.dart';

const secured = const Headers(const {headers.securedKey: ''});

const baseAuth = const Headers(const {headers.authorizationKey: headers.basicKey});
