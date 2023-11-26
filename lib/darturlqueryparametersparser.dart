/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

/*
Challenge 4: Extracting and Formatting Phone Numbers

Description: You are given a long text that contains various 
phone numbers formatted in different ways (e.g., 123-456-7890, 
(123) 456-7890, 123.456.7890, +1-123-456-7890). 
Write a Dart function to find all these phone numbers 
and reformat them into a standardized format: +1-XXX-XXX-XXXX. 
Implement this first using string methods like split and 
replaceAll, then try using regular expressions.

Expected Output: The function should return a List of strings, 
where each string is a reformatted phone number.

 */

List<String> standardizePhoneNumber(String phonenumber) {
  List<String> storeNumber = [];

  final cutOnluNumber = phonenumber.replaceAll(RegExp("[^0-9+]"), "");
  print(cutOnluNumber);

  if (cutOnluNumber.isEmpty) {
    return storeNumber;
  }

  StringBuffer numbersToSave = StringBuffer();
  for (var i = 0; i < cutOnluNumber.length; i++) {
    if (cutOnluNumber[i] == '+' ||
        numbersToSave.toString().startsWith("+") &&
            numbersToSave.length == 12 ||
        !numbersToSave.toString().startsWith("+") &&
            numbersToSave.length == 10) {
      storeNumber.add(numbersToSave.toString());
      numbersToSave.clear();
    }
    numbersToSave.write(cutOnluNumber[i]);
  }
  storeNumber.add(numbersToSave.toString());
  print(storeNumber);

  List<String> storeNumberModified = [];
  for (String cutOnluNumber in storeNumber) {
    if (cutOnluNumber.length == 10) {
      String subStringIn =
          "+1-${cutOnluNumber.substring(0, 3)}-${cutOnluNumber.substring(3, 6)}-${cutOnluNumber.substring(6, 10)}";
      storeNumberModified.add(subStringIn);
    }

    if (cutOnluNumber.length == 12 && cutOnluNumber.startsWith('+')) {
      String subString1 =
          "${cutOnluNumber.substring(0, 2)}-${cutOnluNumber.substring(2, 5)}-${cutOnluNumber.substring(5, 8)}-${cutOnluNumber.substring(8, 12)}";
      storeNumberModified.add(subString1);
    }
  }
  return storeNumberModified;
}

void main() {
  print(standardizePhoneNumber(
      'Call (123) 456-7890 or +1-123-456-7890. +1-123-456-7890+1-123-456-7890+1-123-456-7890+1-123-456-7890'));
}
