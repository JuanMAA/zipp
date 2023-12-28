import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

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
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

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
  // paginaHome
  {
    '2bb3vct7': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // paginaRegistro
  {
    'momge5oj': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // paginaTutorial
  {
    'oo0kk9qe': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // paginaPrincipal
  {
    'ofz2zvlc': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // paginaMiPerfil
  {
    '8srr2k0j': {
      'es': 'Perfil',
      'en': 'Profile',
    },
  },
  // paginaDetallePago
  {
    '6g6obt3a': {
      'es': 'Detalle de Pago',
      'en': 'Payment detail',
    },
    'imaejg7x': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // paginaEditarPerfil
  {
    '4rzqov3y': {
      'es': 'Editar Perfil',
      'en': 'Edit profile',
    },
    '59naq8ur': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // paginaRestablecer
  {
    'l5iggwaz': {
      'es': 'Cambiar contraseña',
      'en': 'Change Password',
    },
    'hithegan': {
      'es':
          'Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un enlace para restablecer tu contraseña.',
      'en':
          'Enter the email associated with your account and we\'ll send you a link to reset your password.',
    },
    'pm63wdro': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'y9knxxcy': {
      'es': 'Ingresa tu email',
      'en': 'Enter your email',
    },
    'u22yrtxd': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'zmzc43ze': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'en': 'Enter a valid email address',
    },
    '02zat4th': {
      'es': 'Seleccione una opcion',
      'en': 'Select an option',
    },
    '34m5g7xs': {
      'es': 'Enviar enlace de restablecimiento',
      'en': 'Send reset link',
    },
    'vfuq2wxq': {
      'es':
          'Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un enlace para restablecer tu contraseña.',
      'en':
          'Enter the email associated with your account and we\'ll send you a link to reset your password.',
    },
    '1rmuye25': {
      'es': 'Email',
      'en': 'E-mail',
    },
    '69k99ag0': {
      'es': 'Ingresa tu email',
      'en': 'Enter your email',
    },
    'l96p5gmt': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'scdh0whd': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'en': 'Enter a valid email address',
    },
    '7t6iytql': {
      'es': 'Seleccione una opcion',
      'en': 'Select an option',
    },
    'sy94zg9y': {
      'es': 'Enviar enlace de restablecimiento',
      'en': 'Send reset link',
    },
    'gt73sx9q': {
      'es': '¿O si ya recordaste tu contraseña?',
      'en': 'Or if you already remembered your password?',
    },
    'rak8t23k': {
      'es': 'Iniciar sesión',
      'en': 'Log in',
    },
    'hwn4nwmk': {
      'es': 'o',
      'en': 'either',
    },
    '1z3qg4ig': {
      'es': '¿Si no tiienes una cuenta?',
      'en': 'If you don\'t have an account?',
    },
    'slislxza': {
      'es': 'Crear cuenta',
      'en': 'Create Account',
    },
    '5tvk9lv0': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // PaginaNotificationes
  {
    'sc4ff4ce': {
      'es': 'Configurar notificaciones',
      'en': 'Set up notifications',
    },
    'r72zvrv5': {
      'es':
          'Seleccione las notificaciones que desea recibir a continuación y actualizaremos la configuración. ',
      'en':
          'Select the notifications you want to receive below and we will update your settings.',
    },
    'gjygkr0n': {
      'es': 'Notificaciones push',
      'en': 'Push notifications',
    },
    '3y3yhxbk': {
      'es':
          'Recibir notificaciones push de nuestra aplicación de forma periódica.',
      'en': 'Receive push notifications from our application periodically.',
    },
    '1ytebj35': {
      'es': 'Notificaciones email ',
      'en': 'Email notifications',
    },
    '9lvh5nst': {
      'es':
          'Recibir notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
      'en':
          'Receive email notifications from our marketing team about new features.',
    },
    'isgrgbfs': {
      'es': 'Guardar Cambios',
      'en': 'Save Changes',
    },
    'a96mlyeh': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // paginaFAQs
  {
    'alczfiiy': {
      'es': 'Política de Privacidad ',
      'en': 'Privacy Policy',
    },
    'oks4x95o': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // paginaAgregarCuenta
  {
    'kh58vfmh': {
      'es': 'Nueva Cuenta',
      'en': 'New account',
    },
    'c805m53i': {
      'es': 'Agregar',
      'en': 'Add',
    },
  },
  // paginaTargetas
  {
    'jsbctd7o': {
      'es': 'Mis Targetas',
      'en': 'My Targets',
    },
    'h421y5mi': {
      'es': 'Targetas',
      'en': 'Targets',
    },
  },
  // paginaCuenta
  {
    'xru8vjsa': {
      'es': 'Agregar',
      'en': 'Add',
    },
    '6qawx1fi': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // newAccount
  {
    '4yxxienz': {
      'es': 'Seleccionar una cuenta',
      'en': 'Select an account',
    },
    'y09r2w55': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // paginaDestinatario
  {
    '2xxyt28g': {
      'es': 'Datos Bancarios Destinatario',
      'en': 'Datos Bancarios Destinatario',
    },
    '62ap97mr': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // paginaTransacciones
  {
    'snhexwkk': {
      'es': 'Mis Transacciones',
      'en': 'My Transactions',
    },
    '1ivxf568': {
      'es': 'Historial',
      'en': 'Record',
    },
  },
  // paginaEditarCuenta
  {
    '09oj5xdt': {
      'es': 'Administrar cuenta',
      'en': 'Manage account',
    },
    '02skes9q': {
      'es': 'Administrar cuenta',
      'en': 'Manage account',
    },
    'dctoqbzn': {
      'es': 'Datos de cuenta',
      'en': 'Account data',
    },
    'p1x5yr2b': {
      'es': 'Datos del destinatario',
      'en': 'Adressee details',
    },
    'kya14gel': {
      'es': 'Datos de pago',
      'en': 'Payment details',
    },
    '1ljs46rf': {
      'es': 'Recordatorio',
      'en': 'Reminder',
    },
    'dcusa3mu': {
      'es': 'Activar recordatorio (Próximamente)',
      'en': 'Activate reminder (Coming soon)',
    },
    '57twjqv4': {
      'es': 'Pago automático',
      'en': 'Automatic payment',
    },
    'fg1ijvh1': {
      'es': 'Activar pago automático (Próximamente)',
      'en': 'Activate automatic payment (Coming soon)',
    },
    'c3y5zfwn': {
      'es': 'Eliminar Cuenta',
      'en': 'Delete account',
    },
    'qvyl6015': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Profile13Responsive
  {
    'lymc7hfd': {
      'es': '2,200',
      'en': '',
    },
    'vnz8p6g5': {
      'es': 'Orders Placed',
      'en': '',
    },
    'jd5uzdqd': {
      'es': '\$212.4k',
      'en': '',
    },
    '2ypg7k7e': {
      'es': 'Money Earned',
      'en': '',
    },
    'tw1titgt': {
      'es': 'Mi Cuenta',
      'en': 'My Account Information',
    },
    'l55qv5tb': {
      'es': 'Cambiar Contraseña',
      'en': 'Cambiar Contraseña',
    },
    'vtojknmm': {
      'es': 'Editar Perfil',
      'en': 'Editar Perfil',
    },
    'o5r54vmi': {
      'es': 'Soporte',
      'en': 'Soporte',
    },
    'iqo1bss1': {
      'es': 'Tutorial',
      'en': 'Tutorial',
    },
    'nvieu112': {
      'es': 'Politica de Privacidad',
      'en': 'Politica de Privacidad',
    },
    'yezqhj9c': {
      'es': 'Mis Transacciones',
      'en': 'Mis Transacciones',
    },
    'aqmpntv7': {
      'es': 'Mis Tarjetas',
      'en': 'Mis Tarjetas',
    },
    'nox5s6io': {
      'es': 'Configuración de Notificaciones',
      'en': 'Configuración de Notificaciones',
    },
    'l61gwa6h': {
      'es': 'Reportar Error',
      'en': '',
    },
    'pzhxp55d': {
      'es': 'Light ',
      'en': '',
    },
    'iucbhm9z': {
      'es': 'Dark',
      'en': '',
    },
    '8an0onpv': {
      'es': 'Log Out',
      'en': '',
    },
    '9fd5j0la': {
      'es': 'My Profile',
      'en': '',
    },
    'cgkw1sh0': {
      'es': '__',
      'en': '',
    },
  },
  // landing
  {
    '7padbeh7': {
      'es': 'Acumula beneficios pagando tus cuentas con tarjeta',
      'en': 'Acumula beneficios pagando tus cuentas con tarjeta',
    },
    'rec8u29r': {
      'es':
          'Te permite pagar tus cuentas recurrentes con tarjeta, incluso las que normalmente transfieres. Gana tiempo, liquidez y flexibilidad mientras ordenas tus cuentas.',
      'en':
          'Te permite pagar tus cuentas recurrentes con tarjeta, incluso las que normalmente transfieres. Gana tiempo, liquidez y flexibilidad mientras ordenas tus cuentas.',
    },
    'p5d8ha1h': {
      'es': 'Registrate Aqui',
      'en': 'Registrate Aqui',
    },
    'wrvu9kao': {
      'es': '¿Qué ganas pagando cuentas?',
      'en': '¿Qué ganas pagando cuentas?',
    },
    'wq5h7ifr': {
      'es': 'Recompensas',
      'en': 'Recompensas',
    },
    '5htov65d': {
      'es':
          'Programa los pagos de tus cuentas y ocupa tu tiempo en lo que realmente te importa.',
      'en':
          'Programa los pagos de tus cuentas y ocupa tu tiempo en lo que realmente te importa.',
    },
    'f2v9iuw7': {
      'es': 'Tiempo',
      'en': 'Tiempo',
    },
    'rnfp1lxk': {
      'es':
          'Programa los pagos de tus cuentas y ocupa tu tiempo en lo que realmente te importa.',
      'en':
          'Programa los pagos de tus cuentas y ocupa tu tiempo en lo que realmente te importa.',
    },
    'w83p05fo': {
      'es': 'Liquidez',
      'en': 'Liquidez',
    },
    'ij6jcjd3': {
      'es':
          'Programa los pagos de tus cuentas y ocupa tu tiempo en lo que realmente te importa.',
      'en':
          'Programa los pagos de tus cuentas y ocupa tu tiempo en lo que realmente te importa.',
    },
    '5h6boi0g': {
      'es':
          'Cobramos una comisión de hasta 1,39% por transacción (IVA incluido)',
      'en':
          'Cobramos una comisión de hasta 1,39% por transacción (IVA incluido)',
    },
    'ass7sy2b': {
      'es':
          'Da el primer paso hoy para gestionar tus pagos de manera eficiente.',
      'en':
          'Da el primer paso hoy para gestionar tus pagos de manera eficiente.',
    },
    'yrdg1rye': {
      'es': 'Home',
      'en': '',
    },
  },
  // componenteMenu
  {
    'aupinwxn': {
      'es': 'Menu',
      'en': '',
    },
    'onkb20hq': {
      'es': 'Inicio',
      'en': 'Inicio',
    },
    'h7e4aopk': {
      'es': 'Historial',
      'en': 'Historial',
    },
    '3vw3b6nk': {
      'es': 'Metodo de Pago',
      'en': 'Metodo de Pago',
    },
    '1zfuxl35': {
      'es': 'Agregar Cuenta',
      'en': 'Agregar Cuenta',
    },
    '23xorg9b': {
      'es': 'Tu Cuenta',
      'en': '',
    },
    'ak8ojqn7': {
      'es': 'Ajustes',
      'en': 'Agregar Cuenta',
    },
    'm1i4n6da': {
      'es': 'Cerrar Sesión',
      'en': 'Cerrar Sesión',
    },
  },
  // newAccountComponent
  {
    '20fd5baa': {
      'es': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
      'en': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
    },
    '0vflie9s': {
      'es': '¿Qué cuenta quieres pagar?',
      'en': '¿Qué cuenta quieres pagar?',
    },
    'pylya0zb': {
      'es': 'Ingresa aquí el tipo de cuenta, o nombre de la empresa',
      'en': 'Ingresa aquí el tipo de cuenta, o nombre de la empresa',
    },
    'xj16hy8y': {
      'es': 'Option 1',
      'en': '',
    },
  },
  // componenteLogin
  {
    'bywopltk': {
      'es': 'Para Comenzar',
      'en': 'Para Comenzar',
    },
    'wwryhvil': {
      'es': 'Crea tu cuenta a continuación',
      'en': 'Crea tu cuenta a continuación',
    },
    '5nfkjdb7': {
      'es': 'Email ',
      'en': 'Email ',
    },
    'lyqyfhl7': {
      'es': 'Ingresa tu email',
      'en': 'Ingresa tu email',
    },
    'rxhxitqt': {
      'es': 'Nombres',
      'en': 'Primer nombre',
    },
    'layn4cui': {
      'es': 'Ingresar nombres',
      'en': 'Ingresa tu primer nombre',
    },
    'kszu8ttq': {
      'es': 'Apellidos',
      'en': 'Segundo nombre',
    },
    '20gocco9': {
      'es': 'Ingresar apellidos',
      'en': 'Ingresa tu segundo nombre',
    },
    'm616i0s4': {
      'es': 'RUT',
      'en': 'RUT',
    },
    't4stvknv': {
      'es': 'Ingresa tu RUT',
      'en': 'Ingresa tu RUT',
    },
    'lwcb0tqi': {
      'es': 'Contraseña',
      'en': 'Contraseña',
    },
    'iqfccz4q': {
      'es': 'Ingresa tu contraseña',
      'en': 'Ingresa tu contraseña',
    },
    'fd63p9br': {
      'es': 'Confirmar contraseña',
      'en': 'Confirmar contraseña',
    },
    'hl67vl5a': {
      'es': 'Ingresa nuevamente tu contraseña',
      'en': 'Ingresa nuevamente tu contraseña',
    },
    'advjq46u': {
      'es': 'He leído y acepto los términos y condiciones de uso',
      'en': 'He leído y acepto los términos y condiciones de uso',
    },
    '0xmb18gs': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'yyn7jb5j': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'en': 'Introduzca una dirección de correo electrónico válida',
    },
    'frzpcsq1': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'bush02dk': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'oe5x88ug': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'jspunpnk': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'w5odysg0': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'e57zu8jm': {
      'es': 'El campo es requerido',
      'en': '',
    },
    '20sqi0dg': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'pow36zki': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'ughsh6e1': {
      'es': '',
      'en': '',
    },
    '0zabdl74': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'hpm0epix': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'rqvwcrly': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'fvdravf7': {
      'es': 'Crear Cuenta',
      'en': 'Crear cuenta',
    },
    'qnwsy7ky': {
      'es': 'Registrarse con Google',
      'en': 'Registrarse con Google',
    },
    'm7vlx2xw': {
      'es': '¿Ya tienes una cuenta?',
      'en': '¿Ya tienes una cuenta?',
    },
    'dgx07x2s': {
      'es': 'Iniciar sesión',
      'en': 'Iniciar sesión',
    },
  },
  // componenteTutorial
  {
    '4gwjtiby': {
      'es': 'Tutorial 1',
      'en': 'Tutorial 1',
    },
    '4zrtccdl': {
      'es':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
      'en':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
    },
    'wvifjzo0': {
      'es': 'Tutorial 2',
      'en': 'Tutorial 2',
    },
    'y3wjuudj': {
      'es':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
      'en':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
    },
    'sgfh3am7': {
      'es': 'Tutorial 3',
      'en': 'Tutorial 3',
    },
    '872xxjme': {
      'es':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
      'en':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
    },
    'a8kfn3cc': {
      'es': 'Comenzar',
      'en': 'Comenzar',
    },
  },
  // componenteRegistro
  {
    'fchumcpy': {
      'es': 'Bienvenido',
      'en': 'Bienvenido!',
    },
    'msqo3krk': {
      'es': 'Inicie sesión para acceder a su cuenta a continuación.',
      'en': 'Inicie sesión para acceder a su cuenta a continuación.',
    },
    'qurwj3og': {
      'es': 'Email',
      'en': 'Email',
    },
    'vplzr91x': {
      'es': 'Ingresa tu email',
      'en': 'Ingresa tu email',
    },
    'czch8pij': {
      'es': 'Contraseña',
      'en': 'Contraseña',
    },
    '7vmeqab8': {
      'es': 'Ingresa tu contraseña',
      'en': 'Ingresa tu contraseña',
    },
    'kpyiyug7': {
      'es': 'Iniciar Sesíon',
      'en': 'Iniciar Sesíon',
    },
    'dmdfj3gc': {
      'es': 'Iniciar Sesíon con Google',
      'en': 'Iniciar Sesíon con Google',
    },
    '0jpjmen0': {
      'es': 'No tiienes una cuenta?',
      'en': 'No tiienes una cuenta?',
    },
    '9sc5jqdj': {
      'es': 'Crear cuenta',
      'en': 'Crear cuenta',
    },
    'x2nwouwb': {
      'es': 'o',
      'en': 'o',
    },
    '5vmgblrs': {
      'es': '¿Olvido su contraseña?',
      'en': '¿Olvido su contraseña?',
    },
    'bu9xx7ji': {
      'es': 'Restablecer',
      'en': 'Restablecer',
    },
    'deifasn4': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    '97re45i0': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'en': 'Introduzca una dirección de correo electrónico válida',
    },
    'fpvi8im4': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'kx4bjlep': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'lnoir7h0': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
  },
  // componenteHome
  {
    'wj893q2l': {
      'es': 'Cuentas que transfiero',
      'en': 'Cuentas que transfiero',
    },
    '3t5kqktc': {
      'es': 'Cuentas',
      'en': 'Cuentas',
    },
    'pzv21uer': {
      'es': 'Servicios',
      'en': 'Servicios',
    },
    'elqi8fel': {
      'es': 'Programados',
      'en': 'Programados',
    },
    '29f4pxsa': {
      'es': '(próximamente)',
      'en': '(próximamente)',
    },
    'pvnxug6q': {
      'es': 'Pagar',
      'en': 'Pagar',
    },
    '4bhdvzga': {
      'es': 'Seleccionar todo',
      'en': 'Seleccionar todo',
    },
    'l7wuzxzo': {
      'es': 'Due Sep 1, 2021',
      'en': '',
    },
    'yu8ew77j': {
      'es': 'Ver Mas',
      'en': 'Ver Mas',
    },
    '9friwsm3': {
      'es': 'Pagar',
      'en': 'Pagar',
    },
  },
  // componenteDestinatario
  {
    '4ndkun6a': {
      'es': '¿Cuáles son los datos bancarios del destinatario?',
      'en': '¿Cuáles son los datos bancarios del destinatario?',
    },
    's789fo0f': {
      'es': 'RUT Destinatario',
      'en': 'RUT Destinatario',
    },
    'ljboi5nr': {
      'es': 'Ej: 9.999.999-9',
      'en': 'Ej: 9.999.999-9',
    },
    'og89hzvy': {
      'es': 'Nombre',
      'en': 'Nombre',
    },
    'euxg5eno': {
      'es': 'Ej: Juan Mansilla',
      'en': 'Ej: Juan Mansilla',
    },
    '8kbk6jpj': {
      'es': 'Seleccione un banco',
      'en': 'Seleccione un banco',
    },
    'm8p6l8pr': {
      'es': 'Buscar un banco',
      'en': 'Buscar un banco',
    },
    'bjv6b07y': {
      'es': 'Cuenta Corriente',
      'en': 'Cuenta Corriente',
    },
    '04n6ol8m': {
      'es': 'Cuenta Corriente',
      'en': 'Cuenta Corriente',
    },
    'dl3g2jjn': {
      'es': 'Cuenta Vista',
      'en': 'Cuenta Vista',
    },
    '641uypkf': {
      'es': 'Número de Cuenta',
      'en': 'Número de Cuenta',
    },
    'igwfl4vy': {
      'es': 'Ej: 099999999',
      'en': 'Ej: 099999999',
    },
    'a9qm1ujr': {
      'es': 'Email',
      'en': 'Email',
    },
    'hmjea2s1': {
      'es': 'Ej: juan@zippypay.com',
      'en': 'Ej: juan@zippypay.com',
    },
    '8b064d7v': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'fwqdp0qr': {
      'es': 'Rut invalido',
      'en': 'Rut invalido',
    },
    '4sbmkfo6': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    '7qswbt5f': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'd0d715xz': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'd4y09a5n': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'rwphdgj6': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'ef5d6svt': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'ab2afnki': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'en': 'Introduzca una dirección de correo electrónico válida',
    },
    '3mzyz1v0': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'e3y6o7dr': {
      'es': 'Continuar',
      'en': 'Continuar',
    },
  },
  // componentePerfil
  {
    'xrwhwkon': {
      'es': 'Configuraciones',
      'en': 'Configuraciones',
    },
    'lbb7jr5z': {
      'es': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
      'en': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
    },
    'm77vcu28': {
      'es': 'Editar Perfil',
      'en': 'Editar Perfil',
    },
    '16rcxlq0': {
      'es': 'Cambiar Contraseña',
      'en': 'Cambiar Contraseña',
    },
    'i6lxbjlm': {
      'es': 'Mis Tarjetas',
      'en': 'Mis Tarjetas',
    },
    'wm89hdgq': {
      'es': 'Mis Transacciones',
      'en': 'Mis Transacciones',
    },
    'ml9tkqd3': {
      'es': 'Configuración de notificaciones',
      'en': 'Configuración de notificaciones',
    },
    'h7rz8hh7': {
      'es': 'Tutorial',
      'en': 'Tutorial',
    },
    'q1auewo2': {
      'es': 'Política de privacidad',
      'en': 'Política de privacidad',
    },
    'cumbx0gj': {
      'es': 'Modo Oscuro',
      'en': 'Modo Oscuro',
    },
    '2rcpvfwc': {
      'es': 'Modo Normal',
      'en': 'Modo Normal',
    },
  },
  // componentePago
  {
    'sobj1s3z': {
      'es': 'Detalles del pago y destinatario',
      'en': 'Detalles del pago y destinatario',
    },
    'gaj4tsyd': {
      'es': 'Selecciona una cuenta',
      'en': 'Selecciona una cuenta',
    },
    '53cqt3ce': {
      'es': 'CLP',
      'en': 'CLP',
    },
    'guq0qsxj': {
      'es': 'CLP',
      'en': 'CLP',
    },
    'illc8mw9': {
      'es': 'UF',
      'en': 'UF',
    },
    'e3cqmr5k': {
      'es': 'Tipo de Moneda',
      'en': 'Tipo de Moneda',
    },
    '8hybnvxf': {
      'es': 'Monto a pagar',
      'en': 'Monto a pagar',
    },
    'vumkk8b8': {
      'es': 'Ej: 200000',
      'en': 'Ej: 200000',
    },
    '7sbgkwr8': {
      'es': '',
      'en': '',
    },
    '8uhs48l9': {
      'es': 'Enero',
      'en': 'Enero',
    },
    '0le40g9z': {
      'es': 'Febrero',
      'en': 'Febrero',
    },
    '6alr0y4m': {
      'es': 'Marzo',
      'en': 'Marzo',
    },
    'miypsi7z': {
      'es': 'Abril',
      'en': 'Abril',
    },
    'l11ctk13': {
      'es': 'Mayo',
      'en': 'Mayo',
    },
    '7d1ftgqe': {
      'es': 'Junio',
      'en': 'Junio',
    },
    'mxvhujau': {
      'es': 'Julio',
      'en': 'Julio',
    },
    'yrq32gl1': {
      'es': 'Agosto',
      'en': 'Agosto',
    },
    'yiu4ml2v': {
      'es': 'Septiembre',
      'en': 'Septiembre',
    },
    '5a9mgyac': {
      'es': 'Octubre',
      'en': 'Octubre',
    },
    'qpwis29s': {
      'es': 'Noviembre',
      'en': 'Noviembre',
    },
    '3herpr7b': {
      'es': 'Diciembre',
      'en': 'Diciembre',
    },
    'b1c5uqv0': {
      'es': 'Buscar Mes',
      'en': 'Buscar Mes',
    },
    '8jedhw5d': {
      'es': '2023',
      'en': '2023',
    },
    'xlwtzwdr': {
      'es': '2024',
      'en': '2024',
    },
    'h6uad5by': {
      'es': '2025',
      'en': '2025',
    },
    'gymiitia': {
      'es': '2026',
      'en': '2026',
    },
    'eibuflb9': {
      'es': 'Seleccionar Año',
      'en': 'Seleccionar Año',
    },
    'ap5epi6t': {
      'es': 'Buscar Año',
      'en': 'Buscar Año',
    },
    'eaennovt': {
      'es': 'Agregar un comentario',
      'en': 'Agregar un comentario',
    },
    '8p1gdbh4': {
      'es': 'Ejemplo: residencia de mayores - Septiembre 2023',
      'en': 'Ejemplo: residencia de mayores - Septiembre 2023',
    },
    '4sjf00xh': {
      'es': 'Avisar al destinatario ',
      'en': 'Avisar al destinatario ',
    },
    'rbth2l35': {
      'es': 'Cuando el pago esté en proceso',
      'en': 'Cuando el pago esté en proceso',
    },
    'lo9cshdc': {
      'es': 'Pagar',
      'en': 'Pagar',
    },
    'c523py1d': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'k1vh2f5b': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'mwkxbsil': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'f646ebt4': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
  },
  // dynamicComponent
  {
    '0slcaof7': {
      'es': 'Rellena el siguiente formulario con los datos requeridos ',
      'en': 'Rellena el siguiente formulario con los datos requeridos',
    },
    'dpevv92w': {
      'es': '',
      'en': '',
    },
    '73pjqr4l': {
      'es': 'Actualizar Datos',
      'en': 'Actualizar Datos',
    },
    '6qq92jht': {
      'es': '',
      'en': '',
    },
    'rzpwbjvg': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'sm443upz': {
      'es': 'Debe ingresar al menos 4 caracteres',
      'en': 'Debe ingresar al menos 4 caracteres',
    },
    'ju8j39wo': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
  },
  // componenteFAQ
  {
    'z0z5667w': {
      'es': 'Cómo utilizamos tus datos ',
      'en': 'Cómo utilizamos tus datos ',
    },
    'ag5xf5xs': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
    },
  },
  // componenteEditarPerfil
  {
    '3rlb9mcf': {
      'es': 'Administra tus datos personales.',
      'en': 'Administra tus datos personales.',
    },
    '55ncaw18': {
      'es': 'Primer Nombre',
      'en': 'Primer Nombre',
    },
    'm4xj14ly': {
      'es': 'Primer Nombre',
      'en': 'Primer Nombre',
    },
    'hy7fknxu': {
      'es': 'Segundo Nombre',
      'en': 'Segundo Nombre',
    },
    'h4thihkr': {
      'es': 'Segundo Nombre',
      'en': 'Segundo Nombre',
    },
    'o7ccwtqf': {
      'es': 'RUT',
      'en': 'RUT',
    },
    'hrlsflwt': {
      'es': 'RUT',
      'en': 'RUT',
    },
    '4de3rn2q': {
      'es': 'Email',
      'en': 'Email',
    },
    'elk1qgvh': {
      'es': 'Email',
      'en': 'Email',
    },
    'fwotfu86': {
      'es': 'Actualizar Datos',
      'en': 'Actualizar Datos',
    },
    '3nf27gv7': {
      'es': 'Otras acciones',
      'en': 'Otras acciones',
    },
    'iycgzwq5': {
      'es': 'Eliminar',
      'en': 'Eliminar Cuenta',
    },
    '9em3rfaw': {
      'es': 'Validar',
      'en': 'Validar Cuenta',
    },
    '28j7behd': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'veq5wox4': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'd6x72ss8': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'vtasq5d9': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'fp0kx1i1': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    '97z1bqb1': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'kt3b0rff': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    '22u7tbnl': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'en': 'Introduzca una dirección de correo electrónico válida',
    },
    'es1vu7km': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
  },
  // componenteBilletera
  {
    'r4sm8y4x': {
      'es': 'Mis targetas',
      'en': 'Mis targetas',
    },
    '2dve2x0c': {
      'es':
          'Personaliza tu cartera de tarjetas: elimina, agrega y destaca tu favorita.',
      'en':
          'Personaliza tu cartera de tarjetas: elimina, agrega y destaca tu favorita.',
    },
  },
  // componenteCategorias
  {
    'aiac85p0': {
      'es': 'Selecciona una cuenta',
      'en': 'Selecciona una cuenta',
    },
    '4nhwqjis': {
      'es': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
      'en': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
    },
    'l9uiwndn': {
      'es': '¿Qué cuenta quieres pagar?',
      'en': '¿Qué cuenta quieres pagar?',
    },
    'ob7ynz4c': {
      'es': 'Ingresa aquí el tipo de cuenta, o nombre de la empresa',
      'en': 'Ingresa aquí el tipo de cuenta, o nombre de la empresa',
    },
  },
  // componenteTransacciones
  {
    'py7hn4du': {
      'es': 'Mi historial',
      'en': 'Mi historial',
    },
    '09xeljiv': {
      'es':
          'Aquí tienes un informe detallado que enumera todas las transacciones que has realizado.',
      'en':
          'Aquí tienes un informe detallado que enumera todas las transacciones que has realizado.',
    },
    'a4sryklp': {
      'es': 'Buscar',
      'en': 'Buscar',
    },
    'xau0qvk2': {
      'es': 'Buscar',
      'en': 'Buscar',
    },
    '5xmd6ill': {
      'es': 'Tipo de cuenta',
      'en': 'Tipo de cuenta',
    },
    'tcejc193': {
      'es': 'Detalle del pago',
      'en': 'Detalle del pago',
    },
    'j6ic6ufr': {
      'es': 'Monto',
      'en': 'Monto',
    },
    'sfjddiv3': {
      'es': 'Fecha de depósito',
      'en': 'Fecha de depósito',
    },
    'ifpyrhls': {
      'es': 'Estado',
      'en': 'Estado',
    },
    'b3ix1j9u': {
      'es': 'Acciones',
      'en': 'Acciones',
    },
    '4qqtkfty': {
      'es': 'Ver Mas',
      'en': 'Ver Mas',
    },
    '5owwokk0': {
      'es': 'Tipo de cuenta',
      'en': 'Tipo de cuenta',
    },
    '6kj7l3zf': {
      'es': 'Detalle del pago',
      'en': 'Detalle del pago',
    },
    'w10x0s0s': {
      'es': 'Monto',
      'en': 'Monto',
    },
    'p2urmu5j': {
      'es': 'Fecha de depósito',
      'en': 'Fecha de depósito',
    },
    'xzmrxnoh': {
      'es': 'Estado',
      'en': 'Estado',
    },
    'ygwitj5o': {
      'es': 'Acciones',
      'en': 'Acciones',
    },
    '98gu4oz1': {
      'es': 'Ver Mas',
      'en': 'Ver Mas',
    },
  },
  // inputComponent
  {
    'yhhlg8fv': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    '4e0i84fe': {
      'es': '',
      'en': '',
    },
    'txhsirrm': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'vmb0axs8': {
      'es': 'El campo es requerido',
      'en': 'El campo es requerido',
    },
    'mxkhnjq2': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Por favor elija una opción del menú desplegable',
    },
  },
  // logoComponent
  {
    'a69o47vd': {
      'es': 'ZIPP',
      'en': 'Apagalo',
    },
  },
  // menuComponent
  {
    'kmfk6i71': {
      'es': 'Light Mode',
      'en': '',
    },
    'nafxvvc1': {
      'es': 'Dark Mode',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'h89om9ca': {
      'es': 'Label here...',
      'en': '',
    },
    '2zjs6sbx': {
      'es': 'Alias',
      'en': '',
    },
    '7dvjkj90': {
      'es': 'Ingresa un alias...',
      'en': '',
    },
    'efvtwj7k': {
      'es': '',
      'en': '',
    },
    'ec5hfa1e': {
      'es': '',
      'en': '',
    },
    'q5ljwvfo': {
      'es': '',
      'en': '',
    },
    'j4rmwb3h': {
      'es': '',
      'en': '',
    },
    '6ah1b18f': {
      'es': '',
      'en': '',
    },
    '2kos1hen': {
      'es': '',
      'en': '',
    },
    'e44ib4ft': {
      'es': '',
      'en': '',
    },
    'cakqvsfi': {
      'es': '',
      'en': '',
    },
    'pop2flz3': {
      'es': '',
      'en': '',
    },
    'w50xnxo0': {
      'es': '',
      'en': '',
    },
    'aox3s4fb': {
      'es': '',
      'en': '',
    },
    'l8hv5a7z': {
      'es': '',
      'en': '',
    },
    '4pjwb70a': {
      'es': '',
      'en': '',
    },
    '0xlokf4y': {
      'es': '',
      'en': '',
    },
    '8twlwiwt': {
      'es': '',
      'en': '',
    },
    'pcwc6o66': {
      'es': '',
      'en': '',
    },
    'qlgl5ubs': {
      'es': '',
      'en': '',
    },
    'h4hobj5z': {
      'es': '',
      'en': '',
    },
    'xum6tx2v': {
      'es': '',
      'en': '',
    },
    '6nf6vc3p': {
      'es': '',
      'en': '',
    },
    'fm1ustob': {
      'es': '',
      'en': '',
    },
    't4xzlq9q': {
      'es': '',
      'en': '',
    },
    '513nj4m0': {
      'es': '',
      'en': '',
    },
    'a1jxfgju': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
