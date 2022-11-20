/// The `whatsapp_unilink` library helps you create WhatsApp URLs.
library whatsapp_unilink;

/// The WhatsAppUnilink class helps you create WhatsApp URLs.
///
/// It cleans the phone number input and encodes the text.
class WhatsAppUnilink {
  /// Creates a [WhatsAppUnilink] instance.
  ///
  /// Call the [toString] method to get the WhatsApp URL.
  const WhatsAppUnilink({
    this.phoneNumber,
    this.text,
  });

  /// Destination phone number.
  ///
  /// The [phoneNumber] string will be internally converted to a format that the
  /// WhatsApp API expect: any brackets, dashes, plus signs, and leading zeros
  /// or any other non-digit characters will be removed.
  final String? phoneNumber;

  /// The message to the user.
  ///
  /// WhatsApp will include your message in [text], and it will automatically
  /// appear in the text field of a chat.
  ///
  /// [text] is encoded using percent-encoding to make it safe for literal use
  /// as a URI component.
  final String? text;

  /// Create a WhatsApp URL link.
  @override
  String toString() {
    final sb = StringBuffer('https://wa.me/');
    if (phoneNumber != null) sb.write(_formatPhoneNumber(phoneNumber!));
    if (text != null) sb.write('?text=${Uri.encodeComponent(text!)}');
    return sb.toString();
  }

  /// Keep only the numbers and remove any leading zeros
  static String _formatPhoneNumber(String s) {
    return s.replaceAll(RegExp(r'\D'), '').replaceAll(RegExp('^0+'), '');
  }
}
