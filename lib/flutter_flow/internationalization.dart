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
      'es': 'Principal',
      'en': 'Home',
    },
  },
  // paginaRegistro
  {
    'momge5oj': {
      'es': 'Principal',
      'en': 'Home',
    },
  },
  // paginaTutorial
  {
    'oo0kk9qe': {
      'es': 'Principal',
      'en': 'Home',
    },
  },
  // paginaPrincipal
  {
    'ofz2zvlc': {
      'es': 'Principal',
      'en': 'Home',
    },
  },
  // paginaDetallePago
  {
    '6g6obt3a': {
      'es': 'Detalle de Pago',
      'en': 'Payment Detail',
    },
    'imaejg7x': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // paginaEditarPerfil
  {
    '4rzqov3y': {
      'es': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    '59naq8ur': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // paginaRestablecer
  {
    'l5iggwaz': {
      'es': 'Cambiar contraseña',
      'en': 'Change Password',
    },
    'qvb0h4ds': {
      'es': 'Restablecer contraseña',
      'en': 'Reset Password',
    },
    '8wc8e0tc': {
      'es':
          'Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un enlace para restablecer tu contraseña.',
      'en':
          'Enter the email associated with your account, and we\'ll send you a link to reset your password.',
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
      'en': 'or',
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
      'en': 'Home',
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
      'en': 'Home',
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
  // paginaTarjetas
  {
    'jsbctd7o': {
      'es': 'Mis Targetas',
      'en': 'My Cards',
    },
    'h421y5mi': {
      'es': 'Targetas',
      'en': 'Cards',
    },
  },
  // paginaDetallesCuenta
  {
    'xru8vjsa': {
      'es': 'Agregar Detalle',
      'en': 'Add',
    },
    '6qawx1fi': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // paginaCuenta
  {
    '4yxxienz': {
      'es': 'Seleccionar cuenta',
      'en': 'Select an account',
    },
    'y09r2w55': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // paginaDestinatario
  {
    '2xxyt28g': {
      'es': 'Datos Destinatario',
      'en': 'Datos Destinatario',
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
      'en': 'History',
    },
  },
  // paginaEditarCuenta
  {
    '09oj5xdt': {
      'es': 'Administrar cuenta',
      'en': 'Manage account',
    },
    'dctoqbzn': {
      'es': 'Datos de cuenta',
      'en': 'Account data',
    },
    'tvessxj6': {
      'es': 'Click para modificar los datos',
      'en': 'Click to modify the data',
    },
    'p1x5yr2b': {
      'es': 'Datos del destinatario',
      'en': 'Recipient\'s information',
    },
    'b8sb0at0': {
      'es': 'Click para modificar los datos',
      'en': 'Modificar Datos',
    },
    'kya14gel': {
      'es': 'Datos de pago',
      'en': 'Payment details',
    },
    '4bhqib0v': {
      'es': 'Click para modificar los datos',
      'en': 'Click to modify the data',
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
      'en': 'Delete Account',
    },
    'qvyl6015': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Profile13Responsive
  {
    'tw1titgt': {
      'es': 'Mi Cuenta',
      'en': 'My Account Information',
    },
    'l55qv5tb': {
      'es': 'Cambiar Contraseña',
      'en': 'Change Password',
    },
    'vtojknmm': {
      'es': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'o5r54vmi': {
      'es': 'Soporte',
      'en': 'Support',
    },
    'iqo1bss1': {
      'es': 'Tutorial',
      'en': 'Tutorial',
    },
    'nvieu112': {
      'es': 'Politica de Privacidad',
      'en': 'Privacy Policy',
    },
    'yezqhj9c': {
      'es': 'Mis Transacciones',
      'en': 'My Transactions',
    },
    'aqmpntv7': {
      'es': 'Mis Tarjetas',
      'en': 'My Cards',
    },
    'nox5s6io': {
      'es': 'Configuración de Notificaciones',
      'en': 'Notification Settings',
    },
    'l61gwa6h': {
      'es': 'Reportar Error',
      'en': 'Report Error',
    },
    'pzhxp55d': {
      'es': 'Light ',
      'en': 'Light ',
    },
    'iucbhm9z': {
      'es': 'Dark',
      'en': '',
    },
    '8an0onpv': {
      'es': 'Log Out',
      'en': '',
    },
    'nye4udah': {
      'es': 'Agregar Detalle',
      'en': 'Add',
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
    '26nbf6ns': {
      'es': 'Acumula beneficios pagando tus cuentas con tarjeta',
      'en': 'Acumula beneficios pagando tus cuentas con tarjeta',
    },
    '15qihwrv': {
      'es':
          'Te permite pagar tus cuentas recurrentes con tarjeta, incluso las que normalmente transfieres. Gana tiempo, liquidez y flexibilidad mientras ordenas tus cuentas.',
      'en':
          'Te permite pagar tus cuentas recurrentes con tarjeta, incluso las que normalmente transfieres. Gana tiempo, liquidez y flexibilidad mientras ordenas tus cuentas.',
    },
    'gy8jb4za': {
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
      'es': 'Cobramos una comisión de hasta 1,39% por transacción.',
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
      'en': 'Menu',
    },
    'onkb20hq': {
      'es': 'Inicio',
      'en': 'Home',
    },
    'h7e4aopk': {
      'es': 'Historial',
      'en': 'History',
    },
    '3vw3b6nk': {
      'es': 'Metodo de Pago',
      'en': 'Payment Method',
    },
    '1zfuxl35': {
      'es': 'Agregar Cuenta',
      'en': 'Add Account',
    },
    '23xorg9b': {
      'es': 'Tu Cuenta',
      'en': 'Your Account',
    },
    'ak8ojqn7': {
      'es': 'Ajustes',
      'en': 'Settings',
    },
    'm1i4n6da': {
      'es': 'Cerrar Sesión',
      'en': 'Log Out',
    },
  },
  // newAccountComponent
  {
    '0vflie9s': {
      'es': '¿Qué cuenta quieres pagar?',
      'en': 'Which account do you want to pay?',
    },
    'pylya0zb': {
      'es': 'Ingresa aquí el tipo de cuenta o nombre de la empresa.',
      'en': 'Which account do you want to pay?',
    },
    'xj16hy8y': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
  },
  // componenteLogin
  {
    'bywopltk': {
      'es': 'Para Comenzar',
      'en': 'To start',
    },
    'wwryhvil': {
      'es': 'Crea tu cuenta a continuación',
      'en': 'Create your account below',
    },
    '5nfkjdb7': {
      'es': 'Email ',
      'en': 'E-mail',
    },
    'lyqyfhl7': {
      'es': 'Ingresa tu email',
      'en': 'Enter your email',
    },
    'rxhxitqt': {
      'es': 'Nombre y apellido',
      'en': 'Name and surname',
    },
    'layn4cui': {
      'es': 'Ingresar nombre y apellido',
      'en': 'Enter first and last name',
    },
    'lwcb0tqi': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'iqfccz4q': {
      'es': 'Ingresa tu contraseña',
      'en': 'Enter your password',
    },
    'fd63p9br': {
      'es': 'Confirmar contraseña',
      'en': 'Confirm Password',
    },
    'hl67vl5a': {
      'es': 'Ingresa nuevamente tu contraseña',
      'en': 'Enter your password again',
    },
    'kszu8ttq': {
      'es': 'Número de teléfono',
      'en': 'Phone number',
    },
    '20gocco9': {
      'es': 'Número de teléfono',
      'en': 'Phone number',
    },
    'advjq46u': {
      'es': 'He leído y acepto los términos y condiciones de uso',
      'en': 'I have read and accept the terms and conditions of use',
    },
    '0xmb18gs': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'yyn7jb5j': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'en': 'Enter a valid email address',
    },
    'frzpcsq1': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'bush02dk': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'oe5x88ug': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'pow36zki': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'ughsh6e1': {
      'es': '',
      'en': '',
    },
    '0zabdl74': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'hpm0epix': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'rqvwcrly': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'jspunpnk': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    '419tlen5': {
      'es': 'La longitud mínima es de 9.',
      'en': 'The minimum length is 9.',
    },
    '8xhxzomn': {
      'es': 'Número telefónico inválido.',
      'en': 'Invalid phone number.',
    },
    'w5odysg0': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'fvdravf7': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'qnwsy7ky': {
      'es': 'Registrarse con Google',
      'en': 'Sign up with Google',
    },
    'm7vlx2xw': {
      'es': '¿Ya tienes una cuenta?',
      'en': 'Do you already have an account?',
    },
    'dgx07x2s': {
      'es': 'Iniciar sesión',
      'en': 'Log in',
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
      'en': 'Begin',
    },
  },
  // componenteRegistro
  {
    'fchumcpy': {
      'es': 'Bienvenido!',
      'en': 'Welcome!',
    },
    'msqo3krk': {
      'es': 'Inicie sesión para acceder a su cuenta a continuación.',
      'en': 'Sign in to access your account below.',
    },
    'qurwj3og': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'vplzr91x': {
      'es': 'Ingresa tu email',
      'en': 'Enter your email',
    },
    'czch8pij': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '7vmeqab8': {
      'es': 'Ingresa tu contraseña',
      'en': 'Enter your password',
    },
    'kpyiyug7': {
      'es': 'Iniciar Sesíon',
      'en': 'Log in',
    },
    'dmdfj3gc': {
      'es': 'Iniciar Sesíon con Google',
      'en': 'Sign in with Google',
    },
    '0jpjmen0': {
      'es': 'No tiienes una cuenta?',
      'en': 'Don\'t have an account?',
    },
    '9sc5jqdj': {
      'es': 'Crear cuenta',
      'en': 'Create Account',
    },
    'x2nwouwb': {
      'es': 'o',
      'en': 'either',
    },
    '5vmgblrs': {
      'es': '¿Olvido su contraseña?',
      'en': 'Forgot your password?',
    },
    'bu9xx7ji': {
      'es': 'Restablecer',
      'en': 'Restore',
    },
    'deifasn4': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    '97re45i0': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'en': 'Enter a valid email address',
    },
    'fpvi8im4': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'kx4bjlep': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'lnoir7h0': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
  },
  // componenteHome
  {
    '3t5kqktc': {
      'es': 'Cuentas',
      'en': 'Accounts',
    },
    'pzv21uer': {
      'es': 'Servicios',
      'en': 'Services',
    },
    'f9qogllw': {
      'es': '(próximamente)',
      'en': '(soon)',
    },
    'elqi8fel': {
      'es': 'Programados',
      'en': 'Scheduled',
    },
    '29f4pxsa': {
      'es': '(próximamente)',
      'en': '(soon)',
    },
    'pvnxug6q': {
      'es': 'Pagar',
      'en': 'Pay',
    },
    '4bhdvzga': {
      'es': 'Seleccionar todo',
      'en': 'Select all',
    },
    'yu8ew77j': {
      'es': 'Ver Mas',
      'en': 'See more',
    },
    '9friwsm3': {
      'es': 'Pagar',
      'en': 'Pay',
    },
  },
  // componenteDestinatario
  {
    'og89hzvy': {
      'es': 'Nombre del destinatario.',
      'en': 'Recipient\'s name.',
    },
    'euxg5eno': {
      'es': 'Ej: Gabriel',
      'en': 'Ex: Gabriel',
    },
    'a9qm1ujr': {
      'es': 'Email destinatario',
      'en': 'Recipient email',
    },
    'hmjea2s1': {
      'es': 'Ej: gabriel@zipp.com',
      'en': 'Ex: gabriel@zipp.com',
    },
    '641uypkf': {
      'es': 'Número de cuenta',
      'en': 'Account number',
    },
    'igwfl4vy': {
      'es': 'Ej: 099999999',
      'en': 'Ex: 099999999',
    },
    '8kbk6jpj': {
      'es': 'Seleccione un banco',
      'en': 'Select a bank',
    },
    'm8p6l8pr': {
      'es': 'Seleccione el banco del destinatario.',
      'en': 'Select the recipient\'s bank.',
    },
    'exsu7wl8': {
      'es': 'Cuenta Corriente',
      'en': 'Current account',
    },
    'wsg0f4u6': {
      'es': 'Cuenta Vista',
      'en': 'Vista Account',
    },
    'pc5ozlpr': {
      'es': 'CuentaRUT',
      'en': 'Rut account',
    },
    'a2b6qcvf': {
      'es': 'Cuenta Ahorro',
      'en': 'Savings Account',
    },
    'g79fetbt': {
      'es': 'Seleccione tipo de cuenta.',
      'en': 'Select account type.',
    },
    'zo4zzwof': {
      'es': 'Buscar un banco',
      'en': 'Find a bank',
    },
    '7qswbt5f': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'lrtx2jln': {
      'es': '',
      'en': '',
    },
    'd0d715xz': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'ef5d6svt': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'ab2afnki': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'en': 'Enter a valid email address',
    },
    '3mzyz1v0': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'd4y09a5n': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'rwphdgj6': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
  },
  // componentePerfil
  {
    'xrwhwkon': {
      'es': 'Configuraciones',
      'en': 'Settings',
    },
    'lbb7jr5z': {
      'es': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
      'en': 'Ready to settle accounts? Which one do you choose first?',
    },
    'm77vcu28': {
      'es': 'Editar Perfil',
      'en': 'Edit profile',
    },
    '16rcxlq0': {
      'es': 'Cambiar Contraseña',
      'en': 'Change Password',
    },
    'i6lxbjlm': {
      'es': 'Mis Tarjetas',
      'en': 'My Cards',
    },
    'wm89hdgq': {
      'es': 'Mis Transacciones',
      'en': 'My Transactions',
    },
    'ml9tkqd3': {
      'es': 'Configuración de notificaciones',
      'en': 'Notification settings',
    },
    'h7rz8hh7': {
      'es': 'Tutorial',
      'en': 'Tutorial',
    },
    'q1auewo2': {
      'es': 'Política de privacidad',
      'en': 'Privacy Policy',
    },
    'cumbx0gj': {
      'es': 'Modo Oscuro',
      'en': 'Dark Mode',
    },
    '2rcpvfwc': {
      'es': 'Modo Normal',
      'en': 'Normal Mode',
    },
  },
  // componentePago
  {
    '53cqt3ce': {
      'es': 'CLP',
      'en': 'CLP',
    },
    'guq0qsxj': {
      'es': 'CLP',
      'en': 'CLP',
    },
    'e3cqmr5k': {
      'es': 'Tipo de Moneda',
      'en': 'Type of currency',
    },
    '8hybnvxf': {
      'es': 'Monto a pagar',
      'en': 'Amount payable',
    },
    'vumkk8b8': {
      'es': 'Ej: 2000',
      'en': 'Ex: 2000',
    },
    'd225n78u': {
      'es': '0',
      'en': '0',
    },
    '7sbgkwr8': {
      'es': '',
      'en': '',
    },
    '8uhs48l9': {
      'es': 'Enero',
      'en': 'January',
    },
    '0le40g9z': {
      'es': 'Febrero',
      'en': 'February',
    },
    '6alr0y4m': {
      'es': 'Marzo',
      'en': 'March',
    },
    'miypsi7z': {
      'es': 'Abril',
      'en': 'April',
    },
    'l11ctk13': {
      'es': 'Mayo',
      'en': 'May',
    },
    '7d1ftgqe': {
      'es': 'Junio',
      'en': 'June',
    },
    'mxvhujau': {
      'es': 'Julio',
      'en': 'July',
    },
    'yrq32gl1': {
      'es': 'Agosto',
      'en': 'August',
    },
    'yiu4ml2v': {
      'es': 'Septiembre',
      'en': 'September',
    },
    '5a9mgyac': {
      'es': 'Octubre',
      'en': 'October',
    },
    'qpwis29s': {
      'es': 'Noviembre',
      'en': 'November',
    },
    '3herpr7b': {
      'es': 'Diciembre',
      'en': 'December',
    },
    'b1c5uqv0': {
      'es': 'Buscar Mes',
      'en': 'Search Month',
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
      'en': 'Select Year',
    },
    'ap5epi6t': {
      'es': 'Buscar Año',
      'en': 'Search Year',
    },
    'eaennovt': {
      'es': 'Agregar un comentario',
      'en': 'Add a comment',
    },
    '8p1gdbh4': {
      'es': 'Ejemplo: residencia de mayores - Septiembre 2023',
      'en': 'Example: nursing home - September 2023',
    },
    '4sjf00xh': {
      'es': 'Avisar al destinatario ',
      'en': 'Notify recipient',
    },
    'rbth2l35': {
      'es': '(próximamente)',
      'en': '(soon)',
    },
    'rbc0m47v': {
      'es': 'Resumen',
      'en': 'Summary',
    },
    '9ztt0lxb': {
      'es': 'Total',
      'en': 'Total',
    },
    'c523py1d': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'f5bucgya': {
      'es': 'Debe ingresar mínimo 3 caracteres.',
      'en': 'You must enter at least 3 characters.',
    },
    'k1vh2f5b': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'mwkxbsil': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'f646ebt4': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'z5kt11wz': {
      'es': 'Selecciona una cuenta',
      'en': 'Select an account',
    },
    'i5p4ok0g': {
      'es': 'Pagar Cuenta',
      'en': 'Pay',
    },
    'q5y8e4di': {
      'es': 'Agregar Targeta',
      'en': 'Add Target',
    },
    'tsb75546': {
      'es': 'Actualizar Cuenta',
      'en': 'Add Target',
    },
  },
  // componenteFAQ
  {
    'z0z5667w': {
      'es': 'Cómo utilizamos tus datos ',
      'en': 'How we use your data',
    },
    'ag5xf5xs': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris never congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate hatred. Velit dignissim sodales ut eu sem integer vitae just eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae just eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in es ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hachabitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo thirst egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque inhabitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
    },
  },
  // componenteEditarPerfil
  {
    '55ncaw18': {
      'es': 'Nombre completo',
      'en': 'Full name',
    },
    'm4xj14ly': {
      'es': 'Nombre completo',
      'en': 'Full name',
    },
    '4de3rn2q': {
      'es': ' Número telefónico (Sin +56)',
      'en': 'Phone number',
    },
    'elk1qgvh': {
      'es': ' Número telefónico (Sin +56)',
      'en': 'Phone number',
    },
    'w3jy9ad7': {
      'es': 'Email',
      'en': 'E-mail',
    },
    '3royi0re': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'fwotfu86': {
      'es': 'Actualizar Datos',
      'en': 'Update data',
    },
    'iycgzwq5': {
      'es': 'Eliminar Cuenta',
      'en': 'Delete account',
    },
    '9em3rfaw': {
      'es': 'Verificar cuenta.',
      'en': 'Verify account.',
    },
    '28j7behd': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'veq5wox4': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'kt3b0rff': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'r3yux9q8': {
      'es': 'La longitud mínima es de 9.',
      'en': 'The minimum length is 9.',
    },
    '22u7tbnl': {
      'es': 'Número telefónico inválido.',
      'en': 'Invalid phone number.',
    },
    'es1vu7km': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop down menu',
    },
    'e9fbb89n': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    'yli8hy17': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // componenteBilletera
  {
    't0zumebl': {
      'es': 'Mis tarjetas',
      'en': 'My cards',
    },
    'ygb6mxkg': {
      'es': 'Personaliza tu cartera de tarjetas.',
      'en': 'Customize your cardholder.',
    },
    '9wb8eezn': {
      'es': 'Añadir',
      'en': 'Add',
    },
    'wqd07p46': {
      'es': 'No registra tarjetas :(',
      'en': 'Does not register cards :(',
    },
  },
  // componenteCategorias
  {
    'l9uiwndn': {
      'es': '¿Qué cuenta quieres pagar?',
      'en': 'What account do you want to pay?',
    },
    'ob7ynz4c': {
      'es': 'Ingresa aquí el tipo de cuenta, o nombre de la empresa',
      'en': 'Enter the type of account or company name here',
    },
  },
  // componenteMensaje
  {
    'nadwxsxv': {
      'es': 'Volver al inicio',
      'en': 'Back to top',
    },
  },
  // componenteTransacciones
  {
    'a4sryklp': {
      'es': 'Buscar',
      'en': 'Look for',
    },
    'xau0qvk2': {
      'es': 'Buscar',
      'en': 'Look for',
    },
    '5xmd6ill': {
      'es': 'Estado',
      'en': 'State',
    },
    'tcejc193': {
      'es': 'Cuenta Detinatario',
      'en': 'Recipient Account',
    },
    'j6ic6ufr': {
      'es': 'Monto',
      'en': 'Amount',
    },
    'sfjddiv3': {
      'es': 'Fecha de pago',
      'en': 'Payment date',
    },
    '7y58kixd': {
      'es': 'Acciones',
      'en': 'Actions',
    },
    'f1x2pcp6': {
      'es': 'Ver Mas',
      'en': 'See more',
    },
    '5owwokk0': {
      'es': 'Estado',
      'en': 'Account type',
    },
    '6kj7l3zf': {
      'es': 'Cuenta Detinatario',
      'en': 'Payment details',
    },
    '720glych': {
      'es': 'Monto',
      'en': '',
    },
    'w1wfu7c6': {
      'es': 'Fecha de Pago',
      'en': '',
    },
    'mmylgf7n': {
      'es': 'Acciones',
      'en': '',
    },
    'bodtwi88': {
      'es': 'Ver Mas',
      'en': 'See more',
    },
  },
  // logoComponent
  {
    'a69o47vd': {
      'es': 'ZIPP',
      'en': 'ZIPP',
    },
  },
  // menuComponent
  {
    'kmfk6i71': {
      'es': 'Light',
      'en': 'Light Mode',
    },
    'nafxvvc1': {
      'es': 'Dark',
      'en': 'Dark Mode',
    },
  },
  // step
  {
    'x3zbcqfi': {
      'es': 'Detalle',
      'en': 'Detail',
    },
    'fsbwa1yr': {
      'es': 'Destinatario',
      'en': 'Recipient',
    },
    'zk2cg0yr': {
      'es': 'Pago',
      'en': 'Pay',
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
      'es': 'Error en la autenticación, reintente nuevamente.',
      'en': 'Authentication error, please try again.',
    },
    'ec5hfa1e': {
      'es': 'El enlace para resetear su contraseña ha sido enviado.',
      'en': 'The link to reset your password has been sent.',
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
      'es': 'El email ya se encuentra registrado por otra cuenta.',
      'en': 'The email is already registered with another account.',
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
