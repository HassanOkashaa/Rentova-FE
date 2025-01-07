import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Explore
  {
    's33wpfjl': {
      'en': 'Where to ?',
      'ar': '',
    },
    '1l7py28k': {
      'en': 'Any Where . Any week . Add guestes',
      'ar': '',
    },
    'hbvcy358': {
      'en': 'Trending',
      'ar': '',
    },
    '288bwcr4': {
      'en': 'Villas',
      'ar': '',
    },
    'ziq3yndd': {
      'en': 'Apartments',
      'ar': '',
    },
    '1pymt8qh': {
      'en': 'Chalets',
      'ar': '',
    },
    'tb5oomxp': {
      'en': 'Explore',
      'ar': '',
    },
  },
  // Profile
  {
    'x9nlwte7': {
      'en': 'Profile',
      'ar': '',
    },
    'reje8g6y': {
      'en': 'Name',
      'ar': '',
    },
    'r0e02gvx': {
      'en': 'Show profile',
      'ar': '',
    },
    '9sngcx56': {
      'en': 'Account setting',
      'ar': '',
    },
    'r2xzwih1': {
      'en': 'Housting',
      'ar': '',
    },
    '86egjt01': {
      'en': 'Referrals & credits',
      'ar': '',
    },
    'fld81ovg': {
      'en': 'Tools',
      'ar': '',
    },
    'ffqz8748': {
      'en': 'Support',
      'ar': '',
    },
    'p6blfv9k': {
      'en': 'Tools',
      'ar': '',
    },
    'pdvpov6b': {
      'en': 'Log out',
      'ar': '',
    },
    'c7ty9mma': {
      'en': 'VERSION 14 JUly 2023',
      'ar': '',
    },
    'r1r0200x': {
      'en': 'Profile',
      'ar': '',
    },
  },
  // TripsLoged
  {
    'a3q23q9b': {
      'en': 'Trips',
      'ar': '',
    },
    '3bw7u029': {
      'en': 'Upcoming reservations',
      'ar': '',
    },
    'rqgyzsu2': {
      'en': 'In 2 weeks',
      'ar': '',
    },
    '2gk4a42t': {
      'en': 'Maadi Apt',
      'ar': '',
    },
    'fldbb1fn': {
      'en': 'Apartment rented by Abdullah ',
      'ar': '',
    },
    'd6vyq6yl': {
      'en': 'Feb 17-18',
      'ar': '',
    },
    'phumzxa3': {
      'en': 'Apt. 6, Building 24, Street ',
      'ar': '',
    },
    'frgw5sy1': {
      'en': ' ',
      'ar': '',
    },
    '34nny95f': {
      'en': 'Maadi, Cairo',
      'ar': '',
    },
    '3a0gjxsm': {
      'en': 'Can\'t find your reservation here?',
      'ar': '',
    },
    '0pyiok2c': {
      'en': ' ',
      'ar': '',
    },
    'u605mj5k': {
      'en': 'visit the Help Center',
      'ar': '',
    },
    '5dnidkq6': {
      'en': 'Review your stay',
      'ar': '',
    },
    'sx0k3avr': {
      'en': 'Maadi Apt',
      'ar': '',
    },
    'cq2wvege': {
      'en': ' . ',
      'ar': '',
    },
    'vj6hzrwp': {
      'en': 'Feb 17-18, 2023',
      'ar': '',
    },
    'qyjrk9zj': {
      'en': 'Where you\'ve been',
      'ar': '',
    },
    '2q45d7cy': {
      'en': 'Maadi Apt',
      'ar': '',
    },
    'u5u577aw': {
      'en': 'Hosted by Abdullah',
      'ar': '',
    },
    'v2hlpls5': {
      'en': 'Feb 17 - 18, 2023',
      'ar': '',
    },
    '9sce2055': {
      'en': 'Can\'t find your reservation here?',
      'ar': '',
    },
    'gbofa3q3': {
      'en': ' ',
      'ar': '',
    },
    '28ucux3a': {
      'en': 'visit the Help Center',
      'ar': '',
    },
    '3x1wwo8o': {
      'en': 'Trips',
      'ar': '',
    },
  },
  // ReviewFive
  {
    '3cr3hwyw': {
      'en': 'Save and exit',
      'ar': '',
    },
    'fv2gb8ft': {
      'en': 'How accurately did Abdullah describe their place? ',
      'ar': '',
    },
    'sv7xcrbn': {
      'en':
          'Did Abdullah\'s place meet your expectations based on the listing?',
      'ar': '',
    },
    '9for4665': {
      'en': 'Select a rating',
      'ar': '',
    },
    'y2wmofar': {
      'en': 'Tell us what stood out',
      'ar': '',
    },
    'ilkl80m8': {
      'en': 'Looked like the photos',
      'ar': '',
    },
    'ee0srll3': {
      'en': 'Matched the description',
      'ar': '',
    },
    'nf3qyeo6': {
      'en': 'Had listed amenities & services',
      'ar': '',
    },
    'y9ljx3gy': {
      'en': 'Something else',
      'ar': '',
    },
    '7m5qj6rw': {
      'en': 'Next',
      'ar': '',
    },
    'i98i434l': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Login
  {
    'hlw7qh8v': {
      'en': 'Welcome Back',
      'ar': '',
    },
    '1n7gqgd6': {
      'en': 'Login to start planning your next trip.',
      'ar': '',
    },
    '143u5bpw': {
      'en': 'Email',
      'ar': '',
    },
    'jdw6oz0e': {
      'en': 'Password',
      'ar': '',
    },
    'zgkz8bup': {
      'en': 'Sign In',
      'ar': '',
    },
    'lcbkfvbq': {
      'en': 'Don\'t have an account? ',
      'ar': '',
    },
    '5qjyteqc': {
      'en': ' Sign Up here',
      'ar': '',
    },
    'ktb75mwt': {
      'en': 'Home',
      'ar': '',
    },
  },
  // GuestProfile
  {
    '2r7pzw8w': {
      'en': 'Profile',
      'ar': '',
    },
    'srac3stl': {
      'en': 'Log in to start renting.',
      'ar': '',
    },
    'e7u4hn9d': {
      'en': 'Once you login, you\'ll find your profile here.',
      'ar': '',
    },
    'd8p9d61d': {
      'en': 'Log in',
      'ar': '',
    },
    'w8unl4cj': {
      'en': 'Profile',
      'ar': '',
    },
  },
  // noLoginMessages
  {
    'r4yormlx': {
      'en': 'Inbox',
      'ar': '',
    },
    'sp64q9hh': {
      'en': 'Log in to see messages',
      'ar': '',
    },
    '37ek5rja': {
      'en': 'Once you login, you\'ll find messages from hosts here.',
      'ar': '',
    },
    'qg4axgtq': {
      'en': 'Log in',
      'ar': '',
    },
    '8ijolh70': {
      'en': 'Inbox',
      'ar': '',
    },
  },
  // noLoginTrips
  {
    'r5lnnb4v': {
      'en': 'Trips',
      'ar': '',
    },
    'imzu2plx': {
      'en': 'No trips yet',
      'ar': '',
    },
    'fqp7xb9e': {
      'en': 'When you\'re ready to plan your next trip, we\'re here to help.',
      'ar': '',
    },
    '69pdk8rm': {
      'en': 'Log in',
      'ar': '',
    },
    'f1dfyurl': {
      'en': 'Trips',
      'ar': '',
    },
  },
  // noLoginWishlists
  {
    '96057iz8': {
      'en': 'Wishlists',
      'ar': '',
    },
    'sv9ivte4': {
      'en': 'No wishlists yet',
      'ar': '',
    },
    'zg75l389': {
      'en': 'Login to create your wishlists.',
      'ar': '',
    },
    'daghnvfp': {
      'en': 'Log in',
      'ar': '',
    },
    'qpq72edz': {
      'en': 'Wishlists',
      'ar': '',
    },
  },
  // ExploreCopy
  {
    'lm2fnh10': {
      'en': 'Where to ?',
      'ar': '',
    },
    '5nr6o5fr': {
      'en': 'Any Where . Any week . Add guestes',
      'ar': '',
    },
    'wfw8lqr8': {
      'en': 'Trending',
      'ar': '',
    },
    'aupfz8n4': {
      'en': 'Villas',
      'ar': '',
    },
    'z4faji1z': {
      'en': 'Apartments',
      'ar': '',
    },
    '48hw9kji': {
      'en': 'Chalets',
      'ar': '',
    },
    'vdvy0tj0': {
      'en': 'Explore',
      'ar': '',
    },
  },
  // CardDisplayItem
  {
    'lb7zt7f3': {
      'en': 'Marrasi, North Coast',
      'ar': '',
    },
    'lwzgyam2': {
      'en': '4.91',
      'ar': '',
    },
    'mjqnmetk': {
      'en': 'Marassi',
      'ar': '',
    },
    '0f7lzx8n': {
      'en': 'Oct 23 - 28',
      'ar': '',
    },
    'tohwzdn9': {
      'en': 'EGP 10,000',
      'ar': '',
    },
    'y7xa8gcq': {
      'en': ' / night',
      'ar': '',
    },
  },
  // navBar
  {
    'cski5ox4': {
      'en': 'Explore',
      'ar': '',
    },
    'yiu47mnh': {
      'en': 'Wishlists',
      'ar': '',
    },
    'ha8dt308': {
      'en': 'Trips',
      'ar': '',
    },
    '26jufwgo': {
      'en': 'Inbox',
      'ar': '',
    },
    'ia51lwbc': {
      'en': 'Profile',
      'ar': '',
    },
  },
  // FiltersModal
  {
    '66a3n93k': {
      'en': 'Filters',
      'ar': '',
    },
    's8yh4psa': {
      'en': 'Price Range',
      'ar': '',
    },
    'q8vc9qhf': {
      'en': 'The average nightly price is \$50',
      'ar': '',
    },
    'ci0gumn8': {
      'en': 'Minimum',
      'ar': '',
    },
    'unpim25v': {
      'en': 'Minimum',
      'ar': '',
    },
    'klnoo7hw': {
      'en': 'Type of place',
      'ar': '',
    },
    '4m4s2ie5': {
      'en': 'Entire place',
      'ar': '',
    },
    '3lpks543': {
      'en': 'A place all to yourself',
      'ar': '',
    },
    'eqndzkhe': {
      'en': 'Private room',
      'ar': '',
    },
    '5h1gs6ag': {
      'en': 'A place all to yourself',
      'ar': '',
    },
    '7wonjjap': {
      'en': 'Rooms and beds',
      'ar': '',
    },
    '1hrfdo5w': {
      'en': 'Bedrooms',
      'ar': '',
    },
    'qfm2jtu8': {
      'en': 'Any',
      'ar': '',
    },
    '1gc2tfr1': {
      'en': '1',
      'ar': '',
    },
    'q566ld0b': {
      'en': '2',
      'ar': '',
    },
    'kxg2puny': {
      'en': '3',
      'ar': '',
    },
    '8lzjx88b': {
      'en': '4',
      'ar': '',
    },
    'g7sgivhy': {
      'en': '5',
      'ar': '',
    },
    'x3949amo': {
      'en': 'Beds',
      'ar': '',
    },
    '7hb93wza': {
      'en': 'Any',
      'ar': '',
    },
    'd6c3rufd': {
      'en': '1',
      'ar': '',
    },
    'h5x6aa75': {
      'en': '2',
      'ar': '',
    },
    'qf242x67': {
      'en': '3',
      'ar': '',
    },
    'p4gy8tfp': {
      'en': '4',
      'ar': '',
    },
    'ar1gn98m': {
      'en': '5',
      'ar': '',
    },
    'suahunv7': {
      'en': 'Bathrooms',
      'ar': '',
    },
    '36ey8iyy': {
      'en': 'Any',
      'ar': '',
    },
    'v63mb94a': {
      'en': '1',
      'ar': '',
    },
    '8o4n52ko': {
      'en': '2',
      'ar': '',
    },
    'p4ota731': {
      'en': '3',
      'ar': '',
    },
    'nxxtmxia': {
      'en': '4',
      'ar': '',
    },
    'u3mb8fuq': {
      'en': '5',
      'ar': '',
    },
    'v047z1d9': {
      'en': 'Property type',
      'ar': '',
    },
    'ny0t1cqe': {
      'en': 'Villa',
      'ar': '',
    },
    'ajjsqpwk': {
      'en': 'Apartment',
      'ar': '',
    },
    'cpghn9r4': {
      'en': 'Studio',
      'ar': '',
    },
    'srqy7tei': {
      'en': 'Chalet',
      'ar': '',
    },
    '6b20vgx7': {
      'en': 'Amenities',
      'ar': '',
    },
    '9cx2bihs': {
      'en': 'Wifi',
      'ar': '',
    },
    'k6uf64ek': {
      'en': 'Kitchen',
      'ar': '',
    },
    '2zj0w2r8': {
      'en': 'Show more',
      'ar': '',
    },
    'xcfq8gof': {
      'en': 'Booking options',
      'ar': '',
    },
    '2ady6qsj': {
      'en': 'Instant Book',
      'ar': '',
    },
    'bg2bm72q': {
      'en': 'Book without waiting for the host to respond',
      'ar': '',
    },
    '25mj7egd': {
      'en': 'Self check-in',
      'ar': '',
    },
    'bhmfunjn': {
      'en': 'Easy access to the property once you arrive',
      'ar': '',
    },
    'zyn2juuj': {
      'en': 'Accessibility features',
      'ar': '',
    },
    'hglwr7c7': {
      'en': 'Step-free guest entrance',
      'ar': '',
    },
    'dxfse6ju': {
      'en': 'Guest entrance wider than 32 inches',
      'ar': '',
    },
    'fsumjyoa': {
      'en': 'Step-free path to the guest entrance',
      'ar': '',
    },
    'le3pkalz': {
      'en': 'Show more',
      'ar': '',
    },
    'ondcpyd7': {
      'en': 'Top tier stays',
      'ar': '',
    },
    'r4okbjux': {
      'en': 'Superhost',
      'ar': '',
    },
    '191dmtq4': {
      'en': 'Stay with recognized Hosts',
      'ar': '',
    },
    'xyf38fti': {
      'en': 'Host language',
      'ar': '',
    },
    '64z51ywf': {
      'en': 'English',
      'ar': '',
    },
    '4xww3gdf': {
      'en': 'French',
      'ar': '',
    },
    'bozef3zc': {
      'en': 'German',
      'ar': '',
    },
    '4ss2n6bf': {
      'en': 'Show more',
      'ar': '',
    },
    'nd0agc3h': {
      'en': 'Clear all',
      'ar': '',
    },
    'boyhobnl': {
      'en': 'Show 642 homes',
      'ar': '',
    },
  },
  // NoTripBookedModal
  {
    'ulzp4nc8': {
      'en': 'No trips booked .. yet!',
      'ar': '',
    },
    'ln6v0l3q': {
      'en': 'Time to dust off your bags and start planning your next adventure',
      'ar': '',
    },
    '7vxlgjg1': {
      'en': 'Start searching',
      'ar': '',
    },
  },
  // GuestsModal
  {
    'bew8wli1': {
      'en': 'Guests',
      'ar': '',
    },
    'ph5oo2h6': {
      'en': 'Adults',
      'ar': '',
    },
    'dl52i0m9': {
      'en': 'Age 13 or above',
      'ar': '',
    },
    'rgaylwrp': {
      'en': 'Clear',
      'ar': '',
    },
    'm9192ldz': {
      'en': 'Save',
      'ar': '',
    },
  },
  // TaxesModal
  {
    'rm33yg7m': {
      'en': 'Account',
      'ar': '',
    },
    '813ka2au': {
      'en': 'Taxes',
      'ar': '',
    },
    'yrv6esxt': {
      'en': 'Taxes',
      'ar': '',
    },
    'x46qyomd': {
      'en': 'Taxpayers',
      'ar': '',
    },
    'up6cdgg7': {
      'en': 'Taxpayer information',
      'ar': '',
    },
    'c5ce7b26': {
      'en':
          'Tax info is required in most countries where the taxpayer is a resident, Host or Co-Host, or both.',
      'ar': '',
    },
    'so89tun8': {
      'en': 'Learn more ',
      'ar': '',
    },
    '7wasat3e': {
      'en': 'Add tax info',
      'ar': '',
    },
    '35jrpoe9': {
      'en': 'Value Added Tax (VAT)',
      'ar': '',
    },
    '5kfl1maq': {
      'en':
          'If you are registered for VAT or your stay is for business, you may not be charged VAT on Appartment Rental service fee. VAT does not apply to US Hosts. ',
      'ar': '',
    },
    't24il638': {
      'en': 'Learn about VAT requirements by country or region',
      'ar': '',
    },
    'bvhx2qmb': {
      'en': 'Add VAT ID Number',
      'ar': '',
    },
    'sntujqb5': {
      'en': 'Need help?',
      'ar': '',
    },
    'muea64lj': {
      'en': 'Get answers to questions about taxes in our ',
      'ar': '',
    },
    '64zvgiaq': {
      'en': 'Help Center',
      'ar': '',
    },
    'tuevzcs8': {
      'en': 'Tax documents',
      'ar': '',
    },
    '5hue6byh': {
      'en':
          'Tax documents required for filing taxes are available to review and download here. ',
      'ar': '',
    },
    's5xjs713': {
      'en':
          'You can also file taxes using detailed earnings info, available in the ',
      'ar': '',
    },
    '4wkine2p': {
      'en': 'earnings summary.',
      'ar': '',
    },
    '5vt2zcdi': {
      'en': '2022',
      'ar': '',
    },
    '2q3vr4x0': {
      'en': 'No tax document issued',
      'ar': '',
    },
    '91jb6vk2': {
      'en': '2021',
      'ar': '',
    },
    '9givbyp1': {
      'en': 'No tax document issued',
      'ar': '',
    },
    'ts0jyfla': {
      'en': 'For tax documents issued prior to 2019, ',
      'ar': '',
    },
    'p8ettnsu': {
      'en': 'contact us',
      'ar': '',
    },
    'z9y4py59': {
      'en': 'Need help?',
      'ar': '',
    },
    'bwy10bta': {
      'en': 'Get answers to questions about taxes in our ',
      'ar': '',
    },
    'p4iwj8os': {
      'en': 'Help Center',
      'ar': '',
    },
  },
  // StayModal
  {
    'hhr6pfts': {
      'en': 'Stays',
      'ar': '',
    },
    'drm9u8hd': {
      'en': 'Where to?',
      'ar': '',
    },
    '2mk44gw0': {
      'en': 'I\'m flexible',
      'ar': '',
    },
    'rb05mhr7': {
      'en': 'I\'m flexible',
      'ar': '',
    },
    'nvis5pxs': {
      'en': 'Europe',
      'ar': '',
    },
    'gfd5claz': {
      'en': 'Japan',
      'ar': '',
    },
    'kp8loy5s': {
      'en': 'I\'m flexible',
      'ar': '',
    },
    '4jhxs49i': {
      'en': 'When',
      'ar': '',
    },
    'bapen9ot': {
      'en': 'Any week',
      'ar': '',
    },
    'ilw06qz7': {
      'en': 'Who',
      'ar': '',
    },
    'toe0vooc': {
      'en': 'Add guests',
      'ar': '',
    },
    'cqc70xe4': {
      'en': 'Experiences',
      'ar': '',
    },
    'skzboy0v': {
      'en': 'Clear all',
      'ar': '',
    },
    'to57y0mf': {
      'en': 'Search',
      'ar': '',
    },
  },
  // RentovaYourHome
  {
    'vmgzod1v': {
      'en': 'Rentova your home',
      'ar': '',
    },
    'tncd0xqt': {
      'en': 'It\'s easy to start hosting and earn extra income.',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'kj8v1cqb': {
      'en': 'Log in',
      'ar': '',
    },
    '9g9u6p3w': {
      'en': 'Continue',
      'ar': '',
    },
    'qvwhcsxy': {
      'en': 'Continue with email',
      'ar': '',
    },
    'auoniwuo': {
      'en': 'Get the badge',
      'ar': '',
    },
    '0ptdg0ks': {
      'en': 'First name',
      'ar': '',
    },
    'w6leraxn': {
      'en': 'Entire place',
      'ar': '',
    },
    'qll7ju3b': {
      'en': 'A place all to yourself',
      'ar': '',
    },
    'qsob293r': {
      'en': 'Instant Book',
      'ar': '',
    },
    'hgixkrm8': {
      'en': 'Book without waiting for the host to respond',
      'ar': '',
    },
    'vkdzi449': {
      'en': 'Get started',
      'ar': '',
    },
    'xrsn8c2p': {
      'en': 'Minimum',
      'ar': '',
    },
    '9g76zbg7': {
      'en': 'Next',
      'ar': '',
    },
    '0nzmv31a': {
      'en': 'Responsive host',
      'ar': '',
    },
    't51qn1cs': {
      'en': 'Responsive host',
      'ar': '',
    },
    '9iogzcm4': {
      'en': 'Option 1',
      'ar': '',
    },
    'aijkjwia': {
      'en': 'Create',
      'ar': '',
    },
    'hqos7r8o': {
      'en': 'Your earnings',
      'ar': '',
    },
    'j9qpg8wh': {
      'en': 'Option 1',
      'ar': '',
    },
    'uavdcbnj': {
      'en': 'Please select...',
      'ar': '',
    },
    '88ls6i45': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '8x4kirqs': {
      'en': 'Airbnb Setup',
      'ar': '',
    },
    '10nr4kyt': {
      'en': 'Search',
      'ar': '',
    },
    '7afmekqi': {
      'en': 'Instant Book',
      'ar': '',
    },
    'psgxgpxh': {
      'en': 'Book without waiting for the host to respond',
      'ar': '',
    },
    'tm5456on': {
      'en': '',
      'ar': '',
    },
    '2g8ak97f': {
      'en': '',
      'ar': '',
    },
    'pujuuilv': {
      'en': '',
      'ar': '',
    },
    'q5af5xr1': {
      'en': '',
      'ar': '',
    },
    '0nhc9dk6': {
      'en': '',
      'ar': '',
    },
    'k7kbj780': {
      'en': '',
      'ar': '',
    },
    'e0e9b25y': {
      'en': '',
      'ar': '',
    },
    's80u60e3': {
      'en': '',
      'ar': '',
    },
    'ujqitubq': {
      'en': '',
      'ar': '',
    },
    'kd9e7bwj': {
      'en': '',
      'ar': '',
    },
    '5hzwtljc': {
      'en': '',
      'ar': '',
    },
    'oc8ao5zr': {
      'en': '',
      'ar': '',
    },
    'g9m4mxb2': {
      'en': '',
      'ar': '',
    },
    'mhotwzc0': {
      'en': '',
      'ar': '',
    },
    '9v0e83lp': {
      'en': '',
      'ar': '',
    },
    '1wy0zar9': {
      'en': '',
      'ar': '',
    },
    'rh3mgt8a': {
      'en': '',
      'ar': '',
    },
    'rov2afze': {
      'en': '',
      'ar': '',
    },
    '6wlgmzks': {
      'en': '',
      'ar': '',
    },
    '12cpx6ix': {
      'en': '',
      'ar': '',
    },
    'j2gcrbto': {
      'en': '',
      'ar': '',
    },
    'git7zfqt': {
      'en': '',
      'ar': '',
    },
    'y8oywzyz': {
      'en': '',
      'ar': '',
    },
    'kqqs5zoo': {
      'en': '',
      'ar': '',
    },
    'n996e2gv': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
