import 'dart:io';

import 'package:whatsapp_unilink/whatsapp_unilink.dart';

Future<void> main() async {
  const number = '15551234567';
  const text = 'I\'m interested in in your "Ferrari" car for sale!';
  const withPhoneNumberAndText =
      WhatsAppUnilink(phoneNumber: number, text: text);
  const withPhoneNumber = WhatsAppUnilink(phoneNumber: number);
  const withText = WhatsAppUnilink(text: text);

  final html =
      '''<html><head><title>whatsapp unilink example</title></head><body><a href="$withPhoneNumberAndText">With phone number and text.</a><br><a href="$withPhoneNumber">With phone number.</a><br><a href="$withText">With text</a></body></html>''';

  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
  await for (final request in server) {
    request.response
      ..statusCode = HttpStatus.ok
      ..headers.contentType = ContentType.html
      ..write(html);
    await request.response.close();
  }
}
