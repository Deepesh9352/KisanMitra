import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'tcms8oz6': {
      'en': 'Kisaan',
      'hi': '',
    },
    's1rzrqwo': {
      'en': 'Email Address',
      'hi': '',
    },
    'n7ia4auz': {
      'en': 'Enter your email here...',
      'hi': '',
    },
    'kdsc8s26': {
      'en': 'Password',
      'hi': '',
    },
    'ltkbohqq': {
      'en': 'Enter your password here...',
      'hi': '',
    },
    '4pflj6bc': {
      'en': 'Forgot Password?',
      'hi': '',
    },
    '8w3bfj6q': {
      'en': 'Login',
      'hi': '',
    },
    '9owazym0': {
      'en': 'Don\'t have an account?',
      'hi': '',
    },
    'ou9uc8va': {
      'en': 'Create Account',
      'hi': '',
    },
    'dlfs8j48': {
      'en': 'Kisaan मित्र',
      'hi': '',
    },
    '7xrfwh9i': {
      'en': 'Customer',
      'hi': '',
    },
    '30jx458t': {
      'en': 'Email Address',
      'hi': '',
    },
    'xlnp0cas': {
      'en': 'Enter your email here...',
      'hi': '',
    },
    '5w7tfq6j': {
      'en': 'Password',
      'hi': '',
    },
    '06glymfo': {
      'en': 'Enter your password here...',
      'hi': '',
    },
    '0af0hwb9': {
      'en': 'Forgot Password?',
      'hi': '',
    },
    'b6plgy37': {
      'en': 'Login',
      'hi': '',
    },
    'o2vdec8b': {
      'en': 'Don\'t have an account?',
      'hi': '',
    },
    '0k5wyl3d': {
      'en': 'Create Account',
      'hi': '',
    },
    '1jp76po3': {
      'en': 'Kisaan मित्र',
      'hi': '',
    },
    '8r1b48y6': {
      'en': 'Home',
      'hi': '',
    },
  },
  // createAccount
  {
    '7mj2kt34': {
      'en': 'Get Started Below,',
      'hi': '',
    },
    '9tfzmzs8': {
      'en': 'Email Address',
      'hi': '',
    },
    'zysaeq0x': {
      'en': 'Enter your email here...',
      'hi': '',
    },
    'n7nkc3pa': {
      'en': 'Password',
      'hi': '',
    },
    'fxeudhqn': {
      'en': 'Enter your email here...',
      'hi': '',
    },
    '2mvlnxq6': {
      'en': 'Create Account',
      'hi': '',
    },
    '55y7ft0q': {
      'en': 'Already have an account?',
      'hi': '',
    },
    't3jtdnjm': {
      'en': 'Login',
      'hi': '',
    },
    'upcp8q9z': {
      'en': 'Home',
      'hi': '',
    },
  },
  // homePage_MAIN
  {
    'atacyu76': {
      'en': 'Kisaan मित्र',
      'hi': '',
    },
    'v7g8rrhf': {
      'en': 'Search your product here',
      'hi': '',
    },
    'tbffa5eg': {
      'en': 'Search',
      'hi': '',
    },
    'vxpo5fmn': {
      'en': '02 Mar, 2024',
      'hi': '',
    },
    'lqebkufl': {
      'en': 'Jaipur',
      'hi': '',
    },
    'wrhi7p0q': {
      'en': 'Today',
      'hi': '',
    },
    'q0wcn9tu': {
      'en': '20°C',
      'hi': '',
    },
    'k43fiu0t': {
      'en': '76 %',
      'hi': '',
    },
    'mc3uxyss': {
      'en': 'It is cloudy today',
      'hi': '',
    },
    'awo7pdzh': {
      'en': 'Market Place',
      'hi': '',
    },
    'd8twm216': {
      'en': 'Buy',
      'hi': '',
    },
    'gfj7f7me': {
      'en': 'Sell',
      'hi': '',
    },
    'qpk1kl2v': {
      'en': 'Mandi Prices',
      'hi': '',
    },
    'ocfg3jw7': {
      'en': 'Maize',
      'hi': '',
    },
    '5pdqrv8i': {
      'en': 'Paddy',
      'hi': '',
    },
    'kngvwbsg': {
      'en': 'Onion',
      'hi': '',
    },
    'tu9ppp41': {
      'en': 'Wheat',
      'hi': '',
    },
    '6gblrjmi': {
      'en': 'News',
      'hi': '',
    },
    'lv29au0c': {
      'en': 'The indian express',
      'hi': '',
    },
    '2nn21cph': {
      'en': 'Amit Shah bats for natural farming\n practices, local hiring',
      'hi': '',
    },
    '6k2fm5hy': {
      'en': 'The times of india',
      'hi': '',
    },
    'jiwu72bd': {
      'en': 'Cotton, soya rates upset farmers',
      'hi': '',
    },
    'ijc9apdn': {
      'en': 'News 18',
      'hi': '',
    },
    'rh6u8q2p': {
      'en':
          'Transforming India: How Agriculture \nSector & Farmers Are Getting Top Priority',
      'hi': '',
    },
    'hf9wwv1f': {
      'en': 'Kisaan 1',
      'hi': '',
    },
    'gxy8p6rs': {
      'en': 'test@gmail.com',
      'hi': '',
    },
    'dwvv3c4x': {
      'en': 'Account Details',
      'hi': '',
    },
    'gj0o34g4': {
      'en': 'Edit Profile',
      'hi': '',
    },
    'tpj8nv0z': {
      'en': 'Payment Information',
      'hi': '',
    },
    'bcns9c11': {
      'en': 'Change Password',
      'hi': '',
    },
    'vh4jjxf4': {
      'en': 'My Soil Test',
      'hi': '',
    },
    'gtzlq1kk': {
      'en': 'Log Out',
      'hi': '',
    },
    'iq2xbioq': {
      'en': 'Home',
      'hi': '',
    },
  },
  // changePassword
  {
    'wsi4hu1t': {
      'en': 'Email Address',
      'hi': '',
    },
    'srshkpqo': {
      'en': 'Your email..',
      'hi': '',
    },
    'idc12nyv': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'hi': '',
    },
    'cwca8z0j': {
      'en': 'Send Reset Link',
      'hi': '',
    },
    'r7gprc92': {
      'en': 'Change Password',
      'hi': '',
    },
    '58412nh5': {
      'en': 'Home',
      'hi': '',
    },
  },
  // MandiPrices
  {
    'pmii6il6': {
      'en': 'Soyabean',
      'hi': '',
    },
    'c2znkain': {
      'en': 'Jaipur',
      'hi': '',
    },
    'fxiwwouo': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    '7l58s5gr': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'f6rx2mbe': {
      'en': '↑₹192',
      'hi': '',
    },
    'izpue6qf': {
      'en': 'Soyabean',
      'hi': '',
    },
    'cyy6acq2': {
      'en': 'Jaipur',
      'hi': '',
    },
    'sc30k7ft': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    '5p5ladtr': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'hi7cbxaw': {
      'en': '↑₹192',
      'hi': '',
    },
    '9b70eanj': {
      'en': 'Soyabean',
      'hi': '',
    },
    'ucmsvyst': {
      'en': 'Jaipur',
      'hi': '',
    },
    'd4k1s4k2': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    'k4juyokz': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'xksxpppj': {
      'en': '↑₹192',
      'hi': '',
    },
    'uqotd409': {
      'en': 'Soyabean',
      'hi': '',
    },
    '2uejpkra': {
      'en': 'Jaipur',
      'hi': '',
    },
    'wtzphanr': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    'q5z6swhi': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'mtvv8qx3': {
      'en': '↑₹192',
      'hi': '',
    },
    'm87lj3ik': {
      'en': 'Soyabean',
      'hi': '',
    },
    'g5xgsg93': {
      'en': 'Jaipur',
      'hi': '',
    },
    '20kivbln': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    'ogtwslsx': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'g427kqgq': {
      'en': '↑₹192',
      'hi': '',
    },
    '4fqjqvrf': {
      'en': 'Mandi Prices',
      'hi': '',
    },
    'so8c5h70': {
      'en': 'Market Prices',
      'hi': '',
    },
  },
  // Charts
  {
    '40rgcvt4': {
      'en': 'Maize',
      'hi': '',
    },
    'pp2wftdz': {
      'en': 'Jaipur',
      'hi': '',
    },
    'qejcuhrq': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    'u0hrlza6': {
      'en': '₹ 1652/Q',
      'hi': '',
    },
    'oc6iinds': {
      'en': '↑₹192',
      'hi': '',
    },
    'nsw0h6hq': {
      'en': 'Dates',
      'hi': '',
    },
    'ishasvug': {
      'en': 'Prices',
      'hi': '',
    },
    'cf044mv4': {
      'en': 'Maize',
      'hi': '',
    },
    '4zgvhbwt': {
      'en': 'Past Prices',
      'hi': '',
    },
    '04je44fm': {
      'en': '26 Oct 2023',
      'hi': '',
    },
    'njz1h81k': {
      'en': '₹ 1642/Q',
      'hi': '',
    },
    'pbey8596': {
      'en': '23 Oct 2023',
      'hi': '',
    },
    'o2rhr2i1': {
      'en': '₹ 1700/Q',
      'hi': '',
    },
    '8sz0g1ft': {
      'en': '12 Oct 2023',
      'hi': '',
    },
    'awunddls': {
      'en': '₹ 1122/Q',
      'hi': '',
    },
    'zp82fod2': {
      'en': '11 Oct 2023',
      'hi': '',
    },
    'fkurovdz': {
      'en': '₹ 1864/Q',
      'hi': '',
    },
    'x2fb0sqs': {
      'en': '10 Oct 2023',
      'hi': '',
    },
    'kx5kpl4b': {
      'en': '₹ 1012/Q',
      'hi': '',
    },
    '6x3lcn4t': {
      'en': '9 Oct 2023',
      'hi': '',
    },
    'cpc9mj0t': {
      'en': '₹ 1851/Q',
      'hi': '',
    },
    'r62xf53k': {
      'en': 'Chart ',
      'hi': '',
    },
    'qtna1dbm': {
      'en': 'Home',
      'hi': '',
    },
  },
  // SellComodity
  {
    'gmn3zksz': {
      'en': 'Post commodity',
      'hi': '',
    },
    'jq61yqwa': {
      'en': 'My Posted Commodities',
      'hi': '',
    },
    '7xt6mmo7': {
      'en': 'Black Gram',
      'hi': '',
    },
    '62af0kvc': {
      'en': 'Asking price: 60/kg',
      'hi': '',
    },
    '35d0xx9x': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    '1lspde51': {
      'en': 'Call Now',
      'hi': '',
    },
    'l0qtwgo6': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '8y061ji4': {
      'en': 'Mustard',
      'hi': '',
    },
    'w1bnyrjz': {
      'en': 'Asking price: 40/kg',
      'hi': '',
    },
    'i6cjzlg8': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'z684k3gd': {
      'en': 'Call Now',
      'hi': '',
    },
    '98w2dtbw': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '8h58ckmz': {
      'en': 'Sell',
      'hi': '',
    },
    '88xcb3c3': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Sell_new_commodity
  {
    'fo32823a': {
      'en': 'Crop Name',
      'hi': '',
    },
    'r68ojadu': {
      'en': 'Enter Here',
      'hi': '',
    },
    '0sod3ros': {
      'en': 'Quality',
      'hi': '',
    },
    'ua9v9jf5': {
      'en': 'High',
      'hi': '',
    },
    'dmwjx5uk': {
      'en': 'Medium',
      'hi': '',
    },
    '12nyxfmg': {
      'en': 'Low',
      'hi': '',
    },
    'e07ttujy': {
      'en': 'Please select...',
      'hi': '',
    },
    '4er6f94o': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '2zdnpaut': {
      'en': 'Variant',
      'hi': '',
    },
    'bpzdugbx': {
      'en': 'Enter Here',
      'hi': '',
    },
    '4bwwfp3v': {
      'en': 'Quantity',
      'hi': '',
    },
    'w0pacu99': {
      'en': 'Enter Here',
      'hi': '',
    },
    'dxn7fzl0': {
      'en': 'Price',
      'hi': '',
    },
    'z0w61bjz': {
      'en': 'Enter Here',
      'hi': '',
    },
    'p9rm7ldy': {
      'en': 'Phone No',
      'hi': '',
    },
    'mc7wv9ht': {
      'en': 'Enter Here',
      'hi': '',
    },
    '01ee2xae': {
      'en': 'Pin Code',
      'hi': '',
    },
    '6cturm2m': {
      'en': 'Enter Here',
      'hi': '',
    },
    'pon0mrj7': {
      'en': 'Post commodity',
      'hi': '',
    },
    'ltd1j3m8': {
      'en': 'Sell Commodity',
      'hi': '',
    },
    'fy0ykh7p': {
      'en': 'Home',
      'hi': '',
    },
  },
  // buyCommodity
  {
    '68ylx79w': {
      'en': 'Sell your produce',
      'hi': '',
    },
    'kp597kwk': {
      'en': 'Mustard',
      'hi': '',
    },
    'cacyezm1': {
      'en': 'Asking price: 40/kg',
      'hi': '',
    },
    '8rkr4tj1': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'tjyhcn0i': {
      'en': 'Call Now',
      'hi': '',
    },
    'h2bnzrrp': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '8ve1708g': {
      'en': 'Sugarcane',
      'hi': '',
    },
    'j40zl67c': {
      'en': 'Asking price: 4/kg',
      'hi': '',
    },
    'jmjg5o5s': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'xgltt2gq': {
      'en': 'Call Now',
      'hi': '',
    },
    '0lhn0exr': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '59uemxrs': {
      'en': 'Drumstick',
      'hi': '',
    },
    'jmdll8v6': {
      'en': 'Asking price: 2500/kg',
      'hi': '',
    },
    '57qssnkx': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'fipl5ih1': {
      'en': 'Call Now',
      'hi': '',
    },
    '9tjrn5kg': {
      'en': 'Whatsapp',
      'hi': '',
    },
    'c2fgk7nn': {
      'en': 'Mariegold',
      'hi': '',
    },
    'r6rfkblw': {
      'en': 'Asking price: 45/kg',
      'hi': '',
    },
    'v2fphx4e': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'upjqupot': {
      'en': 'Call Now',
      'hi': '',
    },
    '8gk11p4q': {
      'en': 'Whatsapp',
      'hi': '',
    },
    'fnijq9bz': {
      'en': 'Paddy',
      'hi': '',
    },
    '1bfn3fx3': {
      'en': 'Asking price: 40/kg',
      'hi': '',
    },
    'dapg2ovq': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'pa5tfwi2': {
      'en': 'Call Now',
      'hi': '',
    },
    'xlby1ugl': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '3k0ajncy': {
      'en': 'Potato',
      'hi': '',
    },
    'w8sry6b4': {
      'en': 'Asking price: 12/kg',
      'hi': '',
    },
    'nm4yi3gx': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'r7btg0lb': {
      'en': 'Call Now',
      'hi': '',
    },
    'g2pvwsmf': {
      'en': 'Whatsapp',
      'hi': '',
    },
    'dl0yprii': {
      'en': 'Buy Commodities',
      'hi': '',
    },
    'l3663vsi': {
      'en': 'Marketplace',
      'hi': '',
    },
  },
  // Community
  {
    'qpzuje6n': {
      'en': 'Blogs',
      'hi': '',
    },
    'babvpejn': {
      'en': 'Today\'s Blogs',
      'hi': '',
    },
    'h7tmcvai': {
      'en': 'Rising deamnd of wheat, right time to sell?',
      'hi': '',
    },
    'ctalsjah': {
      'en':
          'We are  analyzing the surging demand for wheat. Uncover market trends, global influences, and crucial indicators that might signal the perfect moment to sell your wheat harvest.',
      'hi': '',
    },
    '5kfkmnet': {
      'en':
          'Empowering Farmers: The Role of Mobile Apps in Agricultural Development',
      'hi': '',
    },
    'ogbyh6js': {
      'en':
          'Navigate the landscape of agricultural mobile applications. From weather forecasting to market information, discover how mobile technology is empowering farmers and reshaping traditional farming practices.',
      'hi': '',
    },
    'q44jno5i': {
      'en': 'Weathering the Storm: How Climate Change Affects Agriculture',
      'hi': '',
    },
    'zz5e269a': {
      'en':
          'Examine the intersection of climate change and agriculture. Learn about the challenges farmers face due to shifting weather patterns and explore innovative solutions to adapt to and mitigate the impact of climate change.',
      'hi': '',
    },
    'r90ple64': {
      'en':
          'The Digital Frontier: Transforming Agriculture with Smart Technology',
      'hi': '',
    },
    '5s221nbo': {
      'en':
          'Explore the cutting-edge technologies shaping modern agriculture. From precision farming to IoT-enabled machinery, discover how agritech is revolutionizing the way we cultivate and harvest crops.',
      'hi': '',
    },
    '4mxpf5zs': {
      'en': 'Expert Advice',
      'hi': '',
    },
    'j54gkoxm': {
      'en': 'Premium Plan',
      'hi': '',
    },
    '80pbhmui': {
      'en': 'This Plan includes',
      'hi': '',
    },
    'ni0niva5': {
      'en':
          '◈ Chat with expert\n◈ Phone calls with Expert\n◈ Priority in Marketplace\n◈ 24*7 Helpline\n◈ Expret Advice',
      'hi': '',
    },
    'xxeerjhf': {
      'en': 'Buy To Unlock',
      'hi': '',
    },
    'hbrylor0': {
      'en': 'Community',
      'hi': '',
    },
    'ts7z29q2': {
      'en': 'Community',
      'hi': '',
    },
  },
  // MandiPricesMaize
  {
    'rli35mc0': {
      'en': 'Maize',
      'hi': '',
    },
    'mos0ie4l': {
      'en': 'Location',
      'hi': '',
    },
    '2elb6yb3': {
      'en': 'Rate/Quiltal',
      'hi': '',
    },
    'm4ncne5u': {
      'en': '₹1000',
      'hi': '',
    },
    'klzmoa16': {
      'en': 'Search your mandi here',
      'hi': '',
    },
    'qjku5f1l': {
      'en': 'Search',
      'hi': '',
    },
    '0nnrk1a5': {
      'en': 'Jaipur F and V Muhana',
      'hi': '',
    },
    'v4p3zm3v': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'pmjssqa6': {
      'en': '₹1500/Quiltal',
      'hi': '',
    },
    '69v5slzu': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'khcc3dkg': {
      'en': 'Bagru',
      'hi': '',
    },
    'e5k69nkm': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'w51he8d5': {
      'en': '₹1650/Quiltal',
      'hi': '',
    },
    'w489vfm5': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'g1kjuqmg': {
      'en': 'Chomu Grain',
      'hi': '',
    },
    'p6xg4x0k': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    '4ifngek7': {
      'en': '₹1800/Quiltal',
      'hi': '',
    },
    'iohnhqpa': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'b371v7k9': {
      'en': 'Chaksu',
      'hi': '',
    },
    'zji5nn7e': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'k0la3xk7': {
      'en': '₹1200/Quiltal',
      'hi': '',
    },
    'hs9t6ecu': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    '5oruda6y': {
      'en': 'Charts',
      'hi': '',
    },
    '8qlbqt87': {
      'en': 'Mandi Price',
      'hi': '',
    },
    '6fxic9ri': {
      'en': 'Market Prices',
      'hi': '',
    },
  },
  // MandiPricesWheat
  {
    'nmu2b69t': {
      'en': 'Wheat',
      'hi': '',
    },
    'lxsjkav9': {
      'en': 'Location',
      'hi': '',
    },
    'dmot8enm': {
      'en': 'Rate/Quiltal',
      'hi': '',
    },
    't54rq23u': {
      'en': '₹1000',
      'hi': '',
    },
    'ec2c7g3p': {
      'en': 'Search your mandi here',
      'hi': '',
    },
    'e7etsccu': {
      'en': 'Search',
      'hi': '',
    },
    'hudhzp93': {
      'en': 'Jaipur F and V Muhana',
      'hi': '',
    },
    'q147efhq': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'j3snqlnh': {
      'en': '₹2600/Quiltal',
      'hi': '',
    },
    'u6jdpamv': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'k8eeg13i': {
      'en': 'Bagru',
      'hi': '',
    },
    'obvarj12': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'acjfni4n': {
      'en': '₹2500/Quiltal',
      'hi': '',
    },
    'kl515n0i': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'x9exjr0r': {
      'en': 'Chomu Grain',
      'hi': '',
    },
    'd5kmqr14': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'yaq96awd': {
      'en': '₹2700/Quiltal',
      'hi': '',
    },
    '6tqspvhe': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'lo925eew': {
      'en': 'Chaksu',
      'hi': '',
    },
    'wf9eu4in': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'tpvx4y6e': {
      'en': '₹1900/Quiltal',
      'hi': '',
    },
    'p5pxazz5': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'r2u7p3d8': {
      'en': 'Charts',
      'hi': '',
    },
    'xp5d2cvp': {
      'en': 'Mandi Prices',
      'hi': '',
    },
    'xxtzwh6a': {
      'en': 'Home',
      'hi': '',
    },
  },
  // MandiPricesOnion
  {
    't88k2d3e': {
      'en': 'Onion',
      'hi': '',
    },
    'g1tcf9ja': {
      'en': 'Location',
      'hi': '',
    },
    'hlrefsw7': {
      'en': 'Rate/Quiltal',
      'hi': '',
    },
    'hwb0bpng': {
      'en': '₹1000',
      'hi': '',
    },
    'byhao59n': {
      'en': 'Search your mandi here',
      'hi': '',
    },
    'ewh29omv': {
      'en': 'Search',
      'hi': '',
    },
    'w6dvoto5': {
      'en': 'Jaipur F and V Muhana',
      'hi': '',
    },
    's5gwz5nq': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'i04mgo76': {
      'en': '₹1800/Quiltal',
      'hi': '',
    },
    '4hx3s2eb': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    '1om74pzm': {
      'en': 'Bagru',
      'hi': '',
    },
    'ms9dl0y2': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    '51zhtg9e': {
      'en': '₹2300/Quiltal',
      'hi': '',
    },
    '2ds1gj9f': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'z8wf71lp': {
      'en': 'Chomu Grain',
      'hi': '',
    },
    'g1gmfq0q': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'h2hfbm8o': {
      'en': '₹2300/Quiltal',
      'hi': '',
    },
    'ui9a59ge': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'm0zerv25': {
      'en': 'Chaksu',
      'hi': '',
    },
    'bz3k16tt': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    '4xmgiabj': {
      'en': '₹1740/Quiltal',
      'hi': '',
    },
    'b3h3al44': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'c7q85muq': {
      'en': 'Charts',
      'hi': '',
    },
    'ahpv2akw': {
      'en': 'Mandi Price',
      'hi': '',
    },
    'zfjzb3vl': {
      'en': 'Home',
      'hi': '',
    },
  },
  // MandiPricesPaddy
  {
    '035tvxc9': {
      'en': 'Paddy',
      'hi': '',
    },
    'muqf0mng': {
      'en': 'Location',
      'hi': '',
    },
    'arl4jsaj': {
      'en': 'Rate/Quiltal',
      'hi': '',
    },
    '56gdxhuh': {
      'en': '₹1000',
      'hi': '',
    },
    'hmddap0l': {
      'en': 'Search your mandi here',
      'hi': '',
    },
    'iaspjchu': {
      'en': 'Search',
      'hi': '',
    },
    'iwcgzfe7': {
      'en': 'Jaipur F and V Muhana',
      'hi': '',
    },
    '09i7763z': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'etxf49cr': {
      'en': '₹2360/Quiltal',
      'hi': '',
    },
    'gzyw807w': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'eodf4mes': {
      'en': 'Bagru',
      'hi': '',
    },
    'hlu9mv91': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'ozfnunta': {
      'en': '₹3300/Quiltal',
      'hi': '',
    },
    'wyhzrgfj': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    'lbbgpr9m': {
      'en': 'Chomu Grain',
      'hi': '',
    },
    '0ojf4m3r': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'vcwgv04x': {
      'en': '₹3760/Quiltal',
      'hi': '',
    },
    'z9a5yqaj': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    '1ewj9vs6': {
      'en': 'Chaksu',
      'hi': '',
    },
    'jn46pki3': {
      'en': 'Rate on 1/Feb/2024',
      'hi': '',
    },
    'antdcgp0': {
      'en': '₹3680/Quiltal',
      'hi': '',
    },
    'aidf2wu7': {
      'en': 'Min ₹1500',
      'hi': '',
    },
    '0830ky5j': {
      'en': 'Charts',
      'hi': '',
    },
    'g100pqxh': {
      'en': 'Mandi Price',
      'hi': '',
    },
    '095rcp00': {
      'en': 'Home',
      'hi': '',
    },
  },
  // testing
  {
    'k2e77gfw': {
      'en': 'Comodities',
      'hi': '',
    },
    'nl48dnpu': {
      'en': 'Maize',
      'hi': '',
    },
    'kzvoynyu': {
      'en': 'Paddy',
      'hi': '',
    },
    'bqkbsiry': {
      'en': 'Onion',
      'hi': '',
    },
    'zzjq7sd1': {
      'en': 'Wheat',
      'hi': '',
    },
    'b3x7ejax': {
      'en': 'Mandi',
      'hi': '',
    },
  },
  // Weather
  {
    'dwaiaph9': {
      'en': 'search',
      'hi': '',
    },
    'zptdsi48': {
      'en': '19°',
      'hi': '',
    },
    'b280imq4': {
      'en': 'H;24° L:18°',
      'hi': '',
    },
    '1mbcut9z': {
      'en': 'Bengaluru,India',
      'hi': '',
    },
    'orx00edy': {
      'en': '29°',
      'hi': '',
    },
    'cl5mrx2c': {
      'en': 'H;26° L:18°',
      'hi': '',
    },
    'm0ac386k': {
      'en': 'Chennai,India',
      'hi': '',
    },
    '1jerqaz0': {
      'en': '22°',
      'hi': '',
    },
    'dh3x97p5': {
      'en': 'H;32° L:27°',
      'hi': '',
    },
    'bm1ce7p7': {
      'en': 'Delhi,India',
      'hi': '',
    },
    'vhw970v7': {
      'en': 'Weather',
      'hi': '',
    },
    'i8edntxm': {
      'en': 'Home',
      'hi': '',
    },
  },
  // EquipmenRental
  {
    'yw9yyopf': {
      'en': 'Equipment Rental',
      'hi': '',
    },
    'udkaxlm4': {
      'en': 'Equipment',
      'hi': '',
    },
    'uv85vqow': {
      'en': 'Search equipments...',
      'hi': '',
    },
    'nyzpiiuf': {
      'en': 'Earth Moving Eqipments',
      'hi': '',
    },
    '9knrikea': {
      'en': '4 categories items',
      'hi': '',
    },
    '6axgxmvj': {
      'en': 'Aerial Equipment',
      'hi': '',
    },
    'ya1jpft0': {
      'en': '3 categories items',
      'hi': '',
    },
    '5qqny8ca': {
      'en': 'Small Eqipments',
      'hi': '',
    },
    'ionyb15c': {
      'en': '9 categories items',
      'hi': '',
    },
    'v5nvfgvk': {
      'en': 'Cultivator',
      'hi': '',
    },
    '4kzah3ap': {
      'en': '15 categories items',
      'hi': '',
    },
    '6f2s1q3r': {
      'en': 'Rotavator',
      'hi': '',
    },
    'c675prvr': {
      'en': '7 categories items',
      'hi': '',
    },
    'j1s97ura': {
      'en': 'Storage',
      'hi': '',
    },
    'y5ic594u': {
      'en': 'Location',
      'hi': '',
    },
    'p72cdzqd': {
      'en': 'Your Location',
      'hi': '',
    },
    'n7k4sm06': {
      'en': 'Item',
      'hi': '',
    },
    'r8twh8iy': {
      'en': 'What do you want to store',
      'hi': '',
    },
    'hb8c302a': {
      'en': 'Quantity in Kg',
      'hi': '',
    },
    '4m4wnyu9': {
      'en': 'Amount ',
      'hi': '',
    },
    '17bxtrr2': {
      'en': 'Time',
      'hi': '',
    },
    'irpjn669': {
      'en': 'No. of days',
      'hi': '',
    },
    '7ed20b6y': {
      'en': 'Type',
      'hi': '',
    },
    '2z3j5wb0': {
      'en': 'Type of storage you want',
      'hi': '',
    },
    '4yxsh60q': {
      'en': 'Checkout',
      'hi': '',
    },
    'd4q73u63': {
      'en': 'Rent',
      'hi': '',
    },
  },
  // EarthMovingEquipment
  {
    'x37afpqv': {
      'en': 'Compact Track Loaders ',
      'hi': '',
    },
    'ys00z4f4': {
      'en': '317G Compact Track Loader',
      'hi': '',
    },
    '219zd64q': {
      'en': 'Rated Operating Capacity:',
      'hi': '',
    },
    'tdh4860s': {
      'en': '965 kg (2,125 lb.)',
      'hi': '',
    },
    'rghkct81': {
      'en': '325G Compact Track Loader',
      'hi': '',
    },
    'ftjqgzru': {
      'en': 'Rated Operating Capacity:',
      'hi': '',
    },
    '69wj97py': {
      'en': '1176 kg (2,590 lb.)',
      'hi': '',
    },
    'nffk5mwp': {
      'en': '331G Compact Track Loader',
      'hi': '',
    },
    '1b8ztn9z': {
      'en': 'Rated Operating Capacity:',
      'hi': '',
    },
    'hsbgu8wh': {
      'en': '1407 kg (3,100 lb.)',
      'hi': '',
    },
    '1u7gm8nd': {
      'en': '333G Compact Track Loader',
      'hi': '',
    },
    'pdgs07fl': {
      'en': 'Rated Operating Capacity:',
      'hi': '',
    },
    '7b2qg84t': {
      'en': '1680 kg (3,700lb.)',
      'hi': '',
    },
    'l4kzxql0': {
      'en': 'Excavators',
      'hi': '',
    },
    'rlx3wc7q': {
      'en': '17G Compact Excavator',
      'hi': '',
    },
    'uptjss4u': {
      'en': 'Net Power:',
      'hi': '',
    },
    'a1pbq62g': {
      'en': '10.8 kw (14.5 hp)',
      'hi': '',
    },
    'ap5fqbgq': {
      'en': 'Earth Moving Equipment',
      'hi': '',
    },
    'fojp3iqx': {
      'en': 'Home',
      'hi': '',
    },
  },
  // SmallEquipment
  {
    '2o30t32v': {
      'en': 'Compact Track Loaders ',
      'hi': '',
    },
    '9vrw1iug': {
      'en': 'Axe',
      'hi': '',
    },
    'ftn4rcwt': {
      'en': 'Rake',
      'hi': '',
    },
    'ppifniiv': {
      'en': 'Shovel',
      'hi': '',
    },
    'k2tc17pn': {
      'en': 'Gardening Folk',
      'hi': '',
    },
    '4k9h2uwd': {
      'en': 'Excavators',
      'hi': '',
    },
    'xnf9m8rh': {
      'en': 'Pruning Saw',
      'hi': '',
    },
    '5yzfqd4n': {
      'en': 'Small Equipments',
      'hi': '',
    },
    'fmxslcrt': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Cultivators
  {
    'npoi0du2': {
      'en': 'Compact Track Loaders ',
      'hi': '',
    },
    'iapi7gch': {
      'en': 'Bar Point Cultivator',
      'hi': '',
    },
    'mbuvqy5b': {
      'en': 'Rated Operating Capacity:',
      'hi': '',
    },
    'byb8uw8k': {
      'en': '965 kg (2,125 lb.)',
      'hi': '',
    },
    'rb1pd7ee': {
      'en': 'Spring Loaded Cultivator',
      'hi': '',
    },
    'buosvdkt': {
      'en': 'Rated Operating Capacity:',
      'hi': '',
    },
    'wdf0n12v': {
      'en': '1176 kg (2,590 lb.)',
      'hi': '',
    },
    'muzekryi': {
      'en': 'Power Cultivator',
      'hi': '',
    },
    'nqtif6ff': {
      'en': 'Rated Operating Capacity:',
      'hi': '',
    },
    '6d3zmcmy': {
      'en': '1407 kg (3,100 lb.)',
      'hi': '',
    },
    'gbam48yf': {
      'en': 'Hand Cultivator',
      'hi': '',
    },
    'uui8gp71': {
      'en': 'Rated Operating Capacity:',
      'hi': '',
    },
    'vld6kg2v': {
      'en': '1680 kg (3,700lb.)',
      'hi': '',
    },
    '8wq353e7': {
      'en': 'Excavators',
      'hi': '',
    },
    'f6tz5mpc': {
      'en': 'Disc Harrow Cultivator',
      'hi': '',
    },
    'z31uw4ne': {
      'en': 'Net Power:',
      'hi': '',
    },
    'uwdsazzs': {
      'en': '10.8 kw (14.5 hp)',
      'hi': '',
    },
    '14ej3mnt': {
      'en': 'Cultivators',
      'hi': '',
    },
    '211w5mxa': {
      'en': 'Home',
      'hi': '',
    },
  },
  // SoilTest
  {
    'ib3zbc7j': {
      'en': 'Phosphorus',
      'hi': '',
    },
    '3tx66ozv': {
      'en': 'Insights',
      'hi': '',
    },
    'o67v0211': {
      'en': 'See all',
      'hi': '',
    },
    'zjct1z7g': {
      'en': '55%',
      'hi': '',
    },
    'jedgxomo': {
      'en': 'Of fields could greatly benefit from VRX',
      'hi': '',
    },
    'hg3dvx8j': {
      'en':
          'VRA is a filler of a precise farming. You will greatly \nbenefits from it by having better soil condition.',
      'hi': '',
    },
    '3dvlyran': {
      'en': '80%',
      'hi': '',
    },
    '5vkk4o05': {
      'en': 'High Value of magnesium ',
      'hi': '',
    },
    'me97s065': {
      'en':
          '80% of fields have high amount of magnesuim. you \ncan save up to \$2,000 for reducing spraying of magnesium.',
      'hi': '',
    },
    '95j7wcn7': {
      'en': '85%',
      'hi': '',
    },
    'a4ur9mos': {
      'en': 'Average and low amount of potassium ',
      'hi': '',
    },
    'iltf0seg': {
      'en':
          '85% need a better care in terms of potassium. Learn \nhow low potassium is harming your fields.',
      'hi': '',
    },
    'vigelq9i': {
      'en': 'Soil Analysis (per hectare)',
      'hi': '',
    },
    'w2moi7we': {
      'en': 'Phosphorus ',
      'hi': '',
    },
    'pnmu1spl': {
      'en': '24.2',
      'hi': '',
    },
    'wbzyg52p': {
      'en': '21.6',
      'hi': '',
    },
    '8l5cr9jx': {
      'en': 'Magnesium',
      'hi': '',
    },
    '8m98yh1d': {
      'en': '8.1',
      'hi': '',
    },
    'g159c6zd': {
      'en': '7.4',
      'hi': '',
    },
    'xmde12cu': {
      'en': 'Potassium',
      'hi': '',
    },
    'nsnqm9o1': {
      'en': '10.4',
      'hi': '',
    },
    'bmtj9pt6': {
      'en': '10.2',
      'hi': '',
    },
    '6k5k8aju': {
      'en': 'Acidity         ',
      'hi': '',
    },
    '0ytoqknx': {
      'en': '7.1',
      'hi': '',
    },
    'q458fg7s': {
      'en': '6.6',
      'hi': '',
    },
    'p4ovl5tx': {
      'en': 'Humidity',
      'hi': '',
    },
    '5xbwmw4k': {
      'en': '41%',
      'hi': '',
    },
    'e0zxv1c3': {
      'en': '43%',
      'hi': '',
    },
    '48uv7nch': {
      'en': 'Soil Rating',
      'hi': '',
    },
    'tjvijw1m': {
      'en': '6.3',
      'hi': '',
    },
    '874446wh': {
      'en': '5.4',
      'hi': '',
    },
    'ummpkqgk': {
      'en': 'My Soil Test',
      'hi': '',
    },
    'ypag6zrf': {
      'en': 'Home',
      'hi': '',
    },
  },
  // customerBuyCommodity
  {
    'dchz40ok': {
      'en': 'Mustard',
      'hi': '',
    },
    'bo4ey8dq': {
      'en': 'Asking price: 40/kg',
      'hi': '',
    },
    'h4064rbs': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'iy8pgcgw': {
      'en': 'Call Now',
      'hi': '',
    },
    'p4w1rjfy': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '5a1j3ktd': {
      'en': 'Sugarcane',
      'hi': '',
    },
    'fc1phkww': {
      'en': 'Asking price: 4/kg',
      'hi': '',
    },
    'vqkshjbh': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    '788ol5d1': {
      'en': 'Call Now',
      'hi': '',
    },
    '6o3d45gn': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '2jri9ia3': {
      'en': 'Drumstick',
      'hi': '',
    },
    '47wt1huw': {
      'en': 'Asking price: 2500/kg',
      'hi': '',
    },
    '246r2rxo': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'psz5rjqq': {
      'en': 'Call Now',
      'hi': '',
    },
    '2iaws747': {
      'en': 'Whatsapp',
      'hi': '',
    },
    'ct7zjsbl': {
      'en': 'Mariegold',
      'hi': '',
    },
    'ndy1bncp': {
      'en': 'Asking price: 45/kg',
      'hi': '',
    },
    '3sug69sl': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    '1xr3021f': {
      'en': 'Call Now',
      'hi': '',
    },
    '1v98e7pj': {
      'en': 'Whatsapp',
      'hi': '',
    },
    'd3sfzgc1': {
      'en': 'Paddy',
      'hi': '',
    },
    '6v6450zm': {
      'en': 'Asking price: 40/kg',
      'hi': '',
    },
    'x5qz9d7q': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    '7dni1lbe': {
      'en': 'Call Now',
      'hi': '',
    },
    'mdcsutv5': {
      'en': 'Whatsapp',
      'hi': '',
    },
    'zvnga4c2': {
      'en': 'Potato',
      'hi': '',
    },
    '4aqx0mbq': {
      'en': 'Asking price: 12/kg',
      'hi': '',
    },
    'r6icaubt': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    '5ju9qbr5': {
      'en': 'Call Now',
      'hi': '',
    },
    'l5uy07x7': {
      'en': 'Whatsapp',
      'hi': '',
    },
    'qy9bvjlb': {
      'en': 'Buy Commodities',
      'hi': '',
    },
    '727o5p48': {
      'en': 'Marketplace',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'jmg0fkm4': {
      'en': '',
      'hi': '',
    },
    'nhldtsmz': {
      'en': '',
      'hi': '',
    },
    '8gmfzjjx': {
      'en': '',
      'hi': '',
    },
    'uaqzykq5': {
      'en': '',
      'hi': '',
    },
    '9bm5abxh': {
      'en': '',
      'hi': '',
    },
    'mb3q85s8': {
      'en': '',
      'hi': '',
    },
    'kjnxuojq': {
      'en': '',
      'hi': '',
    },
    'q357pxvy': {
      'en': '',
      'hi': '',
    },
    'nfnhvkxm': {
      'en': '',
      'hi': '',
    },
    'rn0ykpv1': {
      'en': '',
      'hi': '',
    },
    'y5z1pjzn': {
      'en': '',
      'hi': '',
    },
    'tdkmgl6h': {
      'en': '',
      'hi': '',
    },
    'm7shlbvs': {
      'en': '',
      'hi': '',
    },
    '6dsqvzq4': {
      'en': '',
      'hi': '',
    },
    'zqghyupv': {
      'en': '',
      'hi': '',
    },
    'r5dlp1yu': {
      'en': '',
      'hi': '',
    },
    'k74mrd50': {
      'en': '',
      'hi': '',
    },
    'dgqmm4bb': {
      'en': '',
      'hi': '',
    },
    'kwiism4k': {
      'en': '',
      'hi': '',
    },
    'xbpa84zh': {
      'en': '',
      'hi': '',
    },
    '0h16y1j7': {
      'en': '',
      'hi': '',
    },
    'nvbt9z05': {
      'en': '',
      'hi': '',
    },
    '5cdq795p': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
