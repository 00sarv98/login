// تابع تبدیل کننده اعداد فارسی به انگلیسی
String convertFarsiToEnglishNumbers(String input) {
  const Map<String, String> farsiToEnglish = {
    '۰': '0',
    '۱': '1',
    '۲': '2',
    '۳': '3',
    '۴': '4',
    '۵': '5',
    '۶': '6',
    '۷': '7',
    '۸': '8',
    '۹': '9',
  };

  String output = input;
  farsiToEnglish.forEach((farsiNum, englishNum) {
    output = output.replaceAll(farsiNum, englishNum);
  });

  return output;
}
