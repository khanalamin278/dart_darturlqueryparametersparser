import 'package:darturlqueryparametersparser/darturlqueryparametersparser.dart';
import 'package:test/test.dart';

void main() {
  group('Phone Number Extraction and Formatting Tests', () {
    test('Standardize phone number with dashes', () {
      expect(standardizePhoneNumber('The number is 123-456-7890 today.'),
          contains('+1-123-456-7890'));
    });

    test('Standardize phone number with parentheses and dashes', () {
      expect(standardizePhoneNumber('Call me at (123) 456-7890.'),
          contains('+1-123-456-7890'));
    });

    test('Standardize phone number with dots', () {
      expect(standardizePhoneNumber('My number is 123.456.7890.'),
          contains('+1-123-456-7890'));
    });

    test('Standardize international format phone number', () {
      expect(standardizePhoneNumber('Reach me on +1-123-456-7890.'),
          contains('+1-123-456-7890'));
    });

    test('Handle text with multiple phone numbers', () {
      var result =
          standardizePhoneNumber('Call 123-456-7890 or (123) 456-7890.');
      expect(result, containsAll(['+1-123-456-7890', '+1-123-456-7890']));
    });

    test('Handle text with no phone numbers', () {
      expect(standardizePhoneNumber('Just a regular text.'), isEmpty);
    });

    test('Handle empty string', () {
      expect(standardizePhoneNumber(''), isEmpty);
    });

    // Add more tests for edge cases, like invalid phone numbers, mixed formats in a single text, etc.
  });
}
