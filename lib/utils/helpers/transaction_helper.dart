import 'dart:math';

class TransactionHelper {
  String generateRandomString(int length) {
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    const numbers = '0123456789';
    final random = Random();
    final stringBuffer = StringBuffer();

    final adjustedLength = length.isEven ? length : length + 1;

    for (var i = 0; i < adjustedLength; i++) {
      if (i % 2 == 0) {
        stringBuffer.write(letters[random.nextInt(letters.length)]);
      } else {
        stringBuffer.write(numbers[random.nextInt(numbers.length)]);
      }
    }

    return stringBuffer.toString();
  }
}
