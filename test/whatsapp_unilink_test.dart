import 'package:test/test.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

// Examples from:
// https://faq.whatsapp.com/en/android/26000030
// https://faq.whatsapp.com/en/iphone/23559013

void main() {
  group('$WhatsAppUnilink', () {
    group('toString()', () {
      test('phone number and text are both set', () {
        expect(
          WhatsAppUnilink(
            phoneNumber: '+001-(555)1234567',
            text: 'I\'m interested in in your "Ferrari" car for sale!',
          ).toString(),
          'https://wa.me/15551234567?text=I\'m%20interested%20in%20in%20your%20%22Ferrari%22%20car%20for%20sale!',
        );
      });

      test('only phone number is set: +, -, (, )', () {
        expect(
          WhatsAppUnilink(phoneNumber: '+001-(555)1230067').toString(),
          'https://wa.me/15551230067',
        );
      });

      test('only phone number is set: +, -, (, ) and spaces', () {
        expect(
          WhatsAppUnilink(phoneNumber: '+001 - (555) 1230067').toString(),
          'https://wa.me/15551230067',
        );
      });

      test('only phone number is set: already formatted', () {
        expect(
          WhatsAppUnilink(phoneNumber: '4911122233456').toString(),
          'https://wa.me/4911122233456',
        );
      });

      test('only phone number is set: starts with +', () {
        expect(
          WhatsAppUnilink(phoneNumber: '+4911122233456').toString(),
          'https://wa.me/4911122233456',
        );
      });

      test('only phone number is set: leading zero', () {
        expect(
          WhatsAppUnilink(phoneNumber: '004911122233456').toString(),
          'https://wa.me/4911122233456',
        );
      });

      test('only the text is set', () {
        expect(
          WhatsAppUnilink(text: 'I\'m interested in ur "Ferrari"!').toString(),
          'https://wa.me/?text=I\'m%20interested%20in%20ur%20%22Ferrari%22!',
        );
      });
    });
  });
}
