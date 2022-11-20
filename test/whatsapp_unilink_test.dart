import 'package:test/test.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

// Examples were originally taken from:
// https://faq.whatsapp.com/en/android/26000030
// https://faq.whatsapp.com/en/iphone/23559013

void main() {
  group(WhatsAppUnilink, () {
    test('phone number and text are both set', () {
      expectLinkMatch(
        WhatsAppUnilink(
          phoneNumber: '+001-(555)1234567',
          text: 'I\'m interested in in your "Ferrari" car for sale!',
        ),
        'https://wa.me/15551234567?text=I%27m+interested+in+in+your+%22Ferrari%22+car+for+sale%21',
      );
    });

    test('only phone number is set: +, -, (, )', () {
      expectLinkMatch(
        WhatsAppUnilink(phoneNumber: '+001-(555)1230067'),
        'https://wa.me/15551230067',
      );
    });

    test('only phone number is set: +, -, (, ) and spaces', () {
      expectLinkMatch(
        WhatsAppUnilink(phoneNumber: '+001 - (555) 1230067'),
        'https://wa.me/15551230067',
      );
    });

    test('only phone number is set: already formatted', () {
      expectLinkMatch(
        WhatsAppUnilink(phoneNumber: '4911122233456'),
        'https://wa.me/4911122233456',
      );
    });

    test('only phone number is set: starts with +', () {
      expectLinkMatch(
        WhatsAppUnilink(phoneNumber: '+4911122233456'),
        'https://wa.me/4911122233456',
      );
    });

    test('only phone number is set: leading zero', () {
      expectLinkMatch(
        WhatsAppUnilink(phoneNumber: '004911122233456'),
        'https://wa.me/4911122233456',
      );
    });

    test('only the text is set', () {
      expectLinkMatch(
        WhatsAppUnilink(text: 'I\'m interested in ur "Ferrari"!'),
        'https://wa.me?text=I%27m+interested+in+ur+%22Ferrari%22%21',
      );
    });
  });
}

void expectLinkMatch(WhatsAppUnilink input, String output) {
  expect(
    input.toString(),
    output,
  );

  expect(
    input.asUri(),
    Uri.parse(output),
  );

  expect(
    input.asUri().toString(),
    input.toString(),
  );
}
