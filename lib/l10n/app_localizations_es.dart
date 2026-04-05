// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get error => 'Error';

  @override
  String get error_message => 'Se ha producido un error durante la carga';

  @override
  String get error_message_retry =>
      'Se ha producido un error durante la carga. Inténtalo más tarde';

  @override
  String get retry => 'Reintentar';

  @override
  String get back => 'Atrás';

  @override
  String get loading => 'Cargando';

  @override
  String get details => 'Detalles';

  @override
  String pages_number(Object number) {
    return '$number páginas por explorar';
  }

  @override
  String get january => 'Enero';

  @override
  String get february => 'Febrero';

  @override
  String get march => 'Marzo';

  @override
  String get april => 'Abril';

  @override
  String get may => 'Mayo';

  @override
  String get june => 'Junio';

  @override
  String get july => 'Julio';

  @override
  String get august => 'Agosto';

  @override
  String get september => 'Septiembre';

  @override
  String get october => 'Octubre';

  @override
  String get november => 'Noviembre';

  @override
  String get december => 'Diciembre';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get profile => 'Perfil';

  @override
  String get settings => 'Ajustes';

  @override
  String get contact_us => 'Contáctanos';

  @override
  String get error_opening_email =>
      'Se ha producido un error al abrir el correo electrónico';

  @override
  String get register_now => 'Regístrate ahora';

  @override
  String get tracking_permission_title => 'Apoya la App';

  @override
  String get tracking_permission_message =>
      'Para mejorar tu experiencia y mostrarte contenido más relevante, ayúdanos a mantener la app gratuita.\n\nToca Permitir para apoyarnos.';

  @override
  String get tracking_permission_next => 'Siguiente';

  @override
  String get skip => 'Omitir';

  @override
  String get done => 'Hecho';

  @override
  String get next => 'Siguiente';

  @override
  String get joinCommunityTitle => '¡Únete a nuestra Comunidad!';

  @override
  String get joinCommunityDescription =>
      'Descubre las ventajas de unirte a la comunidad de Telegram:';

  @override
  String get benefitSupportMembers => 'Apoyo de los miembros';

  @override
  String get benefitSuggestFeatures => 'Propón nuevas funcionalidades';

  @override
  String get benefitContactDevelopers => 'Contacto con los desarrolladores';

  @override
  String get benefitExclusivePreviews => 'Vistas previas y betas exclusivas';

  @override
  String get benefitActiveCommunity => 'Comunidad activa';

  @override
  String get joinNowButton => '¡Únete ahora!';

  @override
  String get alreadyMemberButton => 'Ya soy miembro';

  @override
  String get laterButton => 'Más tarde';

  @override
  String get errorOpenTelegram => 'Error al abrir Telegram';

  @override
  String get disclaimerTitle => 'Fuente de datos';

  @override
  String get disclaimerDescription =>
      'Los datos de los repetidores de esta app provienen de IZ8WNH.\n\nPara información adicional, descargar archivos CSV para programar radios o consultar datos no disponibles en esta app, visita el sitio oficial.';

  @override
  String get disclaimerVisitSite => 'Visitar iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Entendido';

  @override
  String get errorOpenDisclaimerSite => 'Error al abrir el sitio web';

  @override
  String get repeatersMapTitle => 'Mapa de repetidores';

  @override
  String get repeatersListTitle => 'Lista de repetidores';

  @override
  String get repeatersMapLoading => 'Cargando mapa de repetidores…';

  @override
  String get repeatersMapGenericError => 'No se pueden cargar los repetidores.';

  @override
  String get repeatersMapEmpty => 'No se encontraron repetidores cerca de ti.';

  @override
  String get repeatersSearchHint =>
      'Buscar por nombre, indicativo o frecuencia MHz…';

  @override
  String get repeatersSearchEmpty => 'No se encontraron repetidores.';

  @override
  String get repeatersSortDistance => 'Distancia';

  @override
  String get repeatersSortLikes => 'Me gusta';

  @override
  String get repeatersSortFrequency => 'Frecuencia';

  @override
  String repeatersNearbyCount(int count) {
    return '$count repetidores cercanos';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count resultados';
  }

  @override
  String get repeatersMapRetry => 'Reintentar';

  @override
  String get repeatersMapOpenSettings => 'Abrir ajustes';

  @override
  String get repeatersMapPermissionMessage =>
      'Permite el acceso a la ubicación para mostrar los repetidores cerca de ti.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Permiso de ubicación denegado permanentemente. Actívalo desde los ajustes del sistema.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Activa los servicios de ubicación para encontrar repetidores cercanos.';

  @override
  String repeatersMapFound(int count) {
    return '$count repetidores encontrados';
  }

  @override
  String get repeaterMode => 'Modo';

  @override
  String get repeaterModeAnalog => 'Analógico';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Todos los modos';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frecuencia';

  @override
  String get repeaterShift => 'Desplazamiento';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Ubicación';

  @override
  String get repeaterDistance => 'Distancia';

  @override
  String get repeaterViewFullDetails => 'Ver detalles completos';

  @override
  String get repeatersMapReturnToLocation => 'Volver a mi ubicación';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count repetidores en esta ubicación';
  }

  @override
  String get profileUnlockFeatures => 'Desbloquea todas las funciones';

  @override
  String get profileUnlockFeaturesDescription =>
      'Regístrate para usar las funciones de reseña, guardar favoritos y acceder a estadísticas detalladas.';

  @override
  String get profileSignUpOrLogin => 'Regístrate o Inicia sesión';

  @override
  String get profileErrorOpeningEmail => 'Error al abrir el correo';

  @override
  String get profileJoinTelegramCommunity => 'Únete a la comunidad de Telegram';

  @override
  String get profileWelcomeTitle => 'Bienvenido a HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Únete a nuestra comunidad de radioaficionados en Italia.';

  @override
  String get profileEditProfile => 'Editar Perfil';

  @override
  String get profileChangePhoto => 'Cambiar Foto';

  @override
  String get profileFirstName => 'Nombre';

  @override
  String get profileLastName => 'Apellido';

  @override
  String get profileCallsign => 'Indicativo';

  @override
  String get profileRestartIdentificationTitle =>
      '¿Necesitas cambiar tu estado? Puedes reiniciar el proceso de identificación para pasar de Operador Autorizado a SWL Listener.';

  @override
  String get profileRestartIdentificationButton =>
      'Reiniciar Proceso de Identificación';

  @override
  String get profileSaveChanges => 'Guardar Cambios';

  @override
  String get profileDangerZone => 'Zona Peligrosa';

  @override
  String get profileDeleteAccount => 'Eliminar Cuenta';

  @override
  String get profileDeleteAccountConfirmTitle => 'Eliminar Cuenta';

  @override
  String get profileDeleteAccountConfirmMessage =>
      '¿Estás seguro de que quieres eliminar tu cuenta? Esta acción es irreversible.';

  @override
  String get profileDeleteAccountCancel => 'Cancelar';

  @override
  String get profileDeleteAccountConfirm => 'Eliminar';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'Versión $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Comunidad y Soporte';

  @override
  String get profileSectionSupport => 'Soporte';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Versión: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Versión $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Error: $error';
  }

  @override
  String get authJoinTitle => 'Únete a HamQRG';

  @override
  String get authUnlockFeatures =>
      '¡Inicia sesión para desbloquear todas las funciones!';

  @override
  String get authWhatYouGet => 'Lo que obtendrás:';

  @override
  String get authBenefitStatsTitle => 'Estadísticas detalladas';

  @override
  String get authBenefitStatsDescription => 'Monitoriza tu progreso y mejora';

  @override
  String get authBenefitQuizTitle => 'Varios modos de quiz';

  @override
  String get authBenefitQuizDescription =>
      'Practica en modo maratón, por temas y más.';

  @override
  String get authBenefitSyncTitle => 'Sincronización';

  @override
  String get authBenefitSyncDescription => 'Accede desde cualquier dispositivo';

  @override
  String get authOrSignInWithEmail => 'O inicia sesión con correo';

  @override
  String get authEnterEmail => 'Introduce el correo';

  @override
  String get authEnterPassword => 'Introduce la contraseña';

  @override
  String get authForgotPassword => '¿Olvidaste la contraseña?';

  @override
  String get authSignIn => 'Iniciar sesión';

  @override
  String get authSignUp => 'Registrarse';

  @override
  String get authPasswordLengthError => 'La contraseña debe ser más larga';

  @override
  String get authDontHaveAccount => '¿No tienes cuenta? Regístrate';

  @override
  String get authHaveAccount => '¿Ya tienes cuenta? Inicia sesión';

  @override
  String get authBackToSignIn => 'Volver al inicio de sesión';

  @override
  String get authUnexpectedError => 'Error de autenticación: ';

  @override
  String get authValidEmailError => 'Introduce un correo válido';

  @override
  String get authSendPasswordReset => 'Enviar restablecimiento';

  @override
  String get authPasswordResetSent => 'Restablecimiento enviado';

  @override
  String get authVerifyEmailMessage =>
      'Verifica tu correo para completar el registro, revisa tu bandeja de entrada.';

  @override
  String get authInvalidCredentials => 'Correo o contraseña incorrectos';

  @override
  String get authEmailNotConfirmed => 'Verifica tu correo para iniciar sesión';

  @override
  String get authFirstName => 'Nombre';

  @override
  String get authFirstNameRequired => 'El nombre es obligatorio';

  @override
  String get authLastName => 'Apellido';

  @override
  String get authLastNameRequired => 'El apellido es obligatorio';

  @override
  String get authContinueAsGuest => 'Continuar como invitado';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Descubre los repetidores a tu alrededor';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Acceso rápido';

  @override
  String get homeRepeaterList => 'Lista de repetidores';

  @override
  String get homeMyFavorites => 'Mis favoritos';

  @override
  String get homeNearby => 'Cerca de ti';

  @override
  String get homeViewAll => 'Ver todo';

  @override
  String get dashboardTabRepeaters => 'Repetidores';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'No hay repetidores cercanos';

  @override
  String get dashboardViewAllRepeaters => 'Ver todos los repetidores';

  @override
  String get dashboardViewAllPotaSpots => 'Ver todos los spots POTA';

  @override
  String homeStations(int count) {
    return '$count estaciones';
  }

  @override
  String homeSaved(int count) {
    return '$count guardados';
  }

  @override
  String get homeActive => 'Activo';

  @override
  String get homeIdle => 'Inactivo';

  @override
  String get homeNavHome => 'Inicio';

  @override
  String get homeNavList => 'Lista';

  @override
  String get homeNavFavorites => 'Favoritos';

  @override
  String get homeNavMap => 'Mapa';

  @override
  String get homeNavProfile => 'Perfil';

  @override
  String get favoritesTitle => 'Mis favoritos';

  @override
  String get favoritesSearchHint => 'Buscar repetidores guardados...';

  @override
  String get favoritesFilterAllSaved => 'Todos guardados';

  @override
  String get favoritesEmpty => 'No hay repetidores guardados';

  @override
  String get favoritesEmptyDescription =>
      'Añade repetidores a favoritos para verlos aquí';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Mostrando $showing de $total estaciones favoritas';
  }

  @override
  String get favoritesRemove => 'Quitar de favoritos';

  @override
  String get favoritesAdd => 'Añadir a favoritos';

  @override
  String get repeaterDetailSave => 'Guardar';

  @override
  String get repeaterDetailShare => 'Compartir';

  @override
  String get repeaterDetailReport => 'Reportar';

  @override
  String get repeaterDetailTotalLikes => 'Me gusta totales';

  @override
  String get repeaterDetailReports1Yr => 'Reportes (1 año)';

  @override
  String get repeaterDetailHealthScore => 'Puntuación de salud';

  @override
  String get repeaterDetailExcellent => 'Excelente';

  @override
  String get repeaterDetailGood => 'Bueno';

  @override
  String get repeaterDetailFair => 'Regular';

  @override
  String get repeaterDetailToVerify => 'Por verificar';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Puntuación calculada a partir de $count reportes negativos en el último año';
  }

  @override
  String get repeaterDetailLastLike => 'Último me gusta';

  @override
  String get repeaterDetailLastDownReport => 'Último reporte negativo';

  @override
  String get repeaterDetailTechnicalData => 'Datos técnicos';

  @override
  String get repeaterDetailFrequency => 'Frecuencia';

  @override
  String get repeaterDetailShift => 'Desplazamiento';

  @override
  String get repeaterDetailSubtone => 'Subtono (SQL)';

  @override
  String get repeaterDetailMode => 'Modo';

  @override
  String get repeaterDetailLocation => 'Ubicación';

  @override
  String repeaterDetailAway(String distance) {
    return 'a $distance de distancia';
  }

  @override
  String get repeaterDetailCommunityReports => 'Reportes de la comunidad';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Actualizar estado y feedback';

  @override
  String get repeaterDetailEquipment => 'Equipo';

  @override
  String get repeaterDetailEquipmentRequired => 'Equipo *';

  @override
  String get repeaterDetailAccessModes => 'Modos de acceso';

  @override
  String get repeaterDetailNetwork => 'Red';

  @override
  String get repeaterDetailLocationField => 'Lugar';

  @override
  String get repeaterDetailLocationRequired => 'Lugar *';

  @override
  String get repeaterDetailComment => 'Comentario';

  @override
  String get repeaterDetailCommentOptional => 'Comentario (Opcional)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Calidad de señal, informe de audio o comentarios generales...';

  @override
  String get repeaterDetailReportDown => 'Reportar problema';

  @override
  String get repeaterDetailCheckinLike => 'Check-in y me gusta';

  @override
  String get repeaterDetailYourFeedback => 'Tu feedback';

  @override
  String get repeaterDetailPostedJustNow => 'Publicado ahora';

  @override
  String get repeaterDetailDeleteEntry => 'Eliminar entrada';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Ver todos los $count reportes';
  }

  @override
  String get repeaterDetailStationPortable => 'Portátil';

  @override
  String get repeaterDetailStationMobile => 'Móvil';

  @override
  String get repeaterDetailStationFixed => 'Fijo';

  @override
  String get repeaterDetailLike => 'Me gusta';

  @override
  String get repeaterDetailReportLabel => 'Reporte';

  @override
  String get repeaterDetailSaved => 'Guardado';

  @override
  String get repeaterDetailShareMessage =>
      '¡Descubre este repetidor en HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'La función de reportes estará disponible pronto. Podrás reportar información incorrecta o problemas con este repetidor.';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get favorite => 'Favorito';

  @override
  String get accessConfiguration => 'Configuración de acceso';

  @override
  String get noAccessConfiguration => 'No hay configuración disponible';

  @override
  String get repeaterDetailAddFeedback => 'Añadir feedback';

  @override
  String get repeaterDetailOthersReports => 'Reportes de otros usuarios';

  @override
  String get repeaterDetailRemove => 'Eliminar';

  @override
  String get repeaterDetailSelectAccess => 'Seleccionar acceso';

  @override
  String repeaterDetailDistanceWarning(int distance) {
    return 'Debes estar a menos de $distance km del repetidor para enviar feedback.';
  }

  @override
  String get repeaterDetailInteractive => 'Interactivo';

  @override
  String get repeaterDetailLogYourSignal => 'Registra tu señal';

  @override
  String get repeaterDetailUsedEquipment => 'Equipo utilizado';

  @override
  String get repeaterDetailYourLocation => 'Tu ubicación';

  @override
  String get repeaterDetailLocationPlaceholder =>
      '¿Dónde estabas? (ej. Madrid)';

  @override
  String get repeaterDetailLocationSelectHint =>
      'Selecciona un lugar de las sugerencias';

  @override
  String get feedbackDistanceConfirmTitle => 'Confirmar envío';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'El lugar seleccionado está a $distance km del repetidor. ¿Confirmas que quieres enviar este feedback bajo tu responsabilidad?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Confirmar';

  @override
  String get feedbackDistanceConfirmCancel => 'Cancelar';

  @override
  String get repeaterDetailSelectAccessInstance =>
      'Seleccionar instancia de acceso';

  @override
  String get repeaterDetailSignalObservations => 'Observaciones de señal';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      '¿Cómo era la calidad de audio?';

  @override
  String get repeaterDetailSendLike => 'Enviar Me gusta';

  @override
  String get repeaterDetailReportIssue => 'Reportar Problema';

  @override
  String get repeaterDetailRecentActivity => 'Actividad reciente';

  @override
  String get reportIssueTitle => 'Reporte';

  @override
  String get reportIssueHeadline => 'Ayúdanos a mantener los datos precisos';

  @override
  String get reportIssueDescription =>
      '¿Encontraste algo incorrecto o faltante en este repetidor? Cuéntanos qué debe cambiarse y lo verificaremos.';

  @override
  String get reportIssueWhatToCorrect => '¿Qué te gustaría corregir o añadir?';

  @override
  String get reportIssuePlaceholder =>
      'Ej. El tono CTCSS ha cambiado a 88.5Hz, o la ubicación está un poco más al norte, el gestor es...';

  @override
  String get reportIssueVerifiedTitle => 'Envíos Verificados';

  @override
  String get reportIssueVerifiedDescription =>
      'Tu reporte será revisado por el coordinador regional antes de actualizar la base de datos pública. Gracias por tu contribución a la comunidad.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Confirmo que esta información es correcta según mi observación.';

  @override
  String get reportIssueSubmit => 'Enviar';

  @override
  String get reportIssueMinChars => 'Mínimo 10 caracteres requeridos';

  @override
  String get reportIssueMaxChars => 'Máximo 2000 caracteres';

  @override
  String get reportIssueSuccess => 'Reporte enviado con éxito';

  @override
  String get reportIssueError => 'Error al enviar el reporte';

  @override
  String get registrationPromptTitle => 'Desbloquea todo el potencial';

  @override
  String get registrationPromptDescription =>
      'Únete a la comunidad italiana de radioaficionados y lleva tu experiencia al siguiente nivel.';

  @override
  String get registrationBenefitInteractTitle => 'Interactúa';

  @override
  String get registrationBenefitInteractDescription =>
      'Valora repetidores y deja comentarios para otros.';

  @override
  String get registrationBenefitFavoritesTitle => 'Favoritos';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Guarda tus frecuencias y repetidores más usados.';

  @override
  String get registrationBenefitLogbookTitle => 'Logbook';

  @override
  String get registrationBenefitLogbookDescription =>
      'Lleva un registro de tus QSOs y mantén un historial personal.';

  @override
  String get registrationSignInApple => 'Iniciar sesión con Apple';

  @override
  String get registrationSignInGoogle => 'Iniciar sesión con Google';

  @override
  String get registrationPromptFooter =>
      'Registro gratuito. No se requiere licencia para consultar datos públicos.';

  @override
  String get postLoginOnboardingWelcome => 'Bienvenido a';

  @override
  String get postLoginOnboardingQuestion =>
      '¿Eres un radioaficionado con licencia?';

  @override
  String get postLoginOnboardingHelpText =>
      'Nos ayuda a personalizar tu experiencia y mostrarte las frecuencias correctas.';

  @override
  String get postLoginOnboardingYesLicensed => 'Sí, lo soy';

  @override
  String get postLoginOnboardingNoListener => 'No, solo soy un oyente';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identifícate';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Introduce tu indicativo oficial para acceder a las funciones de red.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Indicativo (Callsign)';

  @override
  String get postLoginOnboardingCallsignHint => 'Ej. EA4XYZ';

  @override
  String get postLoginOnboardingComplete => 'Completar perfil';

  @override
  String get postLoginOnboardingBack => 'Atrás';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Puedes cambiarlo después en ajustes.';

  @override
  String get postLoginOnboardingSwlTitle => 'Indicativo SWL';

  @override
  String get postLoginOnboardingSwlQuestion =>
      '¿Tienes un indicativo SWL oficial?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'Los indicativos de oyentes de onda corta ayudan a identificarte en la comunidad global de monitorización.';

  @override
  String get postLoginOnboardingSwlYes => 'Sí, tengo uno';

  @override
  String get postLoginOnboardingSwlNo => 'No, no tengo uno';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Introduce indicativo';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Ej. EA1-12345-SWL';

  @override
  String get timeAgoJustNow => 'ahora';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count minutos',
      one: 'hace 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count horas',
      one: 'hace 1 hora',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count días',
      one: 'hace 1 día',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count semanas',
      one: 'hace 1 semana',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count meses',
      one: 'hace 1 mes',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count años',
      one: 'hace 1 año',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Tema';

  @override
  String get profileThemeModeSystem => 'Sistema';

  @override
  String get profileThemeModeLight => 'Claro';

  @override
  String get profileThemeModeDark => 'Oscuro';

  @override
  String get repeaterDetailBeFirstFeedback =>
      '¡Sé el primero en dejar feedback en este repetidor!';

  @override
  String get repeaterDetailDistanceFromYou => 'Distancia desde ti';

  @override
  String get repeaterDistanceMapNoLocation => 'Ubicación no disponible';

  @override
  String get repeaterDetailNever => 'Nunca';

  @override
  String get repeaterDetailInfo => 'Información';

  @override
  String get repeaterDetailSource => 'Fuente';

  @override
  String get repeaterDetailManager => 'Gestor';

  @override
  String get repeaterDetailSuggestManager =>
      '¿Conoces al gestor del repetidor? ¡Repórtalo!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Mapa de feedback';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Visualiza dónde se han registrado los me gusta y reportes';

  @override
  String get repeaterDetailAltimetricProfile => 'Perfil altimétrico';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Visualiza el perfil del terreno entre tú y el repetidor';

  @override
  String get repeaterDetailLosClear =>
      'Línea de visión despejada entre tú y el repetidor';

  @override
  String get repeaterDetailLosObstructed =>
      'Línea de visión obstruida por el terreno';

  @override
  String get repeaterDetailTerrainProfile => 'Perfil del terreno';

  @override
  String get repeaterDetailLineOfSight => 'Línea de visión';

  @override
  String get repeaterDetailTotalDistance => 'Distancia';

  @override
  String get repeaterDetailRepeaterElevation => 'Elevación del repetidor';

  @override
  String get repeaterDetailYourElevation => 'Tu elevación';

  @override
  String get repeaterDetailYou => 'Tú';

  @override
  String get repeaterDetailRepeaterLabel => 'Repetidor';

  @override
  String get repeaterDetailFunFacts => '¿Sabías que?';

  @override
  String get repeaterDetailWavelength => 'Longitud de onda';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'La longitud de onda de este repetidor es $value';
  }

  @override
  String get repeaterDetailOscillations => 'Oscilaciones por segundo';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'La señal oscila $value veces por segundo';
  }

  @override
  String get repeaterDetailPropagationTime => 'Tiempo de propagación';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Tu señal tarda $value en llegar al repetidor';
  }

  @override
  String get repeaterDetailWaveCycles => 'Ciclos en el trayecto';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'La onda completa $value ciclos completos en el trayecto';
  }

  @override
  String get userReportsTitle => 'Mis reportes';

  @override
  String get userReportsFilterAll => 'Todos';

  @override
  String get userReportsFilterOpen => 'Abiertos';

  @override
  String get userReportsFilterClosed => 'Cerrados';

  @override
  String get userReportsEmpty => 'No hay reportes enviados';

  @override
  String get userReportsEmptyDescription =>
      'Tus reportes de repetidores aparecerán aquí';

  @override
  String get userReportsEmptyFiltered => 'No hay reportes con este filtro';

  @override
  String get userReportsStatusPending => 'Pendiente';

  @override
  String get userReportsStatusReviewed => 'En revisión';

  @override
  String get userReportsStatusResolved => 'Resuelto';

  @override
  String get userReportsStatusRejected => 'Rechazado';

  @override
  String get userReportsRetryBanner => 'No se puede actualizar la lista';

  @override
  String get userReportsProfileTile => 'Mis reportes';

  @override
  String get userReportsProfileTileSubtitle => 'Ver el estado de tus reportes';

  @override
  String get userReportsError => 'Error al cargar los reportes';

  @override
  String get userReportsCoordinatorResponse => 'Respuesta del coordinador';

  @override
  String get potaTitle => 'POTA Spots';

  @override
  String get potaSearchHint => 'Buscar por activador, parque o modo…';

  @override
  String get potaNoSpots => 'No hay spots POTA activos en este momento.';

  @override
  String get potaLoadError => 'No se pueden cargar los spots POTA';

  @override
  String get potaRetry => 'Reintentar';

  @override
  String get potaViewAll => 'Ver todo';

  @override
  String get potaActivator => 'Activador';

  @override
  String get potaFrequency => 'Frecuencia';

  @override
  String get potaMode => 'Modo';

  @override
  String get potaPark => 'Parque';

  @override
  String get potaReference => 'Referencia';

  @override
  String get potaSpotter => 'Spotteado por';

  @override
  String get potaComments => 'Comentarios';

  @override
  String get potaLastSpotted => 'Último spot';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'No se puede abrir QRZ.com';

  @override
  String get potaParkWebsite => 'Sitio del parque';

  @override
  String get potaParkType => 'Tipo de parque';

  @override
  String get potaLocation => 'Ubicación';

  @override
  String get potaCountry => 'País';

  @override
  String get potaFirstActivation => 'Primera activación';

  @override
  String get potaBand => 'Banda';

  @override
  String potaDistanceAway(String distance) {
    return 'a $distance de distancia';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count spots activos';
  }

  @override
  String get potaFilterAll => 'Todas';

  @override
  String get potaFilterBand => 'Banda';

  @override
  String get potaFilterMode => 'Modo';

  @override
  String get potaSortByTime => 'Más recientes';

  @override
  String get potaSortByDistance => 'Más cercanos';

  @override
  String get profileLanguage => 'Idioma';

  @override
  String get profileLanguageSystem => 'Sistema';

  @override
  String get profileLanguageItalian => 'Italiano';

  @override
  String get profileLanguageEnglish => 'English';

  @override
  String get profileLanguageSpanish => 'Español';

  @override
  String get profileLanguageFrench => 'Français';

  @override
  String get onboardingSkip => 'Saltar';

  @override
  String get onboardingGetStarted => 'Comenzar';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingWelcomeTitle1 => 'Encuentra repetidores cerca de ti';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Descubre los repetidores activos en tu zona, con frecuencias, tonos y detalles técnicos.';

  @override
  String get onboardingWelcomeCredits =>
      'Datos de repetidores proporcionados por IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtra por modo';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analógico, DMR, C4FM, D-STAR — encuentra al instante el repetidor adecuado para ti.';

  @override
  String get onboardingWelcomeTitle3 => 'Spots POTA en tiempo real';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Sigue las activaciones Parks on the Air con actualizaciones en vivo, filtros por banda y distancia.';

  @override
  String get onboardingWelcomeTitle4 => 'Guarda tus favoritos';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Ten a mano los repetidores que más usas para un acceso rápido.';

  @override
  String get onboardingLocationTitle => 'Ubicación';

  @override
  String get onboardingLocationSubtitle =>
      'Usamos tu ubicación para mostrarte los repetidores y activaciones POTA cercanas.';

  @override
  String get onboardingLocationEnable => 'Activar Ubicación';

  @override
  String get onboardingLocationSkip => 'Ahora no';

  @override
  String get onboardingDiscoveryTitle => 'Tu primer repetidor';

  @override
  String get onboardingDiscoverySubtitle => '¡Esto es lo que hay cerca de ti!';

  @override
  String get onboardingDiscoveryViewDetails => 'Ver Detalles';

  @override
  String get onboardingDiscoveryViewSpot => 'Ver Spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Explorar el Mapa';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Explora el mapa para encontrar repetidores y activaciones POTA';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Repetidor cercano';

  @override
  String get onboardingDiscoveryLivePota => 'Spot POTA activo';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'No se encontraron repetidores cercanos';

  @override
  String get onboardingTelegramTitle => 'Únete a la comunidad';

  @override
  String get onboardingTelegramSubtitle =>
      'Únete al grupo Telegram de HamQRG para recibir actualizaciones, reportar repetidores y conocer a otros radioaficionados.';

  @override
  String get onboardingTelegramJoin => 'Unirse al Grupo Telegram';

  @override
  String get onboardingTelegramLater => 'Quizás después';

  @override
  String get onboardingTelegramAlreadyMember => 'Ya soy miembro';

  @override
  String get addRepeaterProfileTile => 'Proponer nuevo repetidor';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Reportar un repetidor aún no listado';

  @override
  String get addRepeaterTitle => 'Nuevo Repetidor';

  @override
  String get addRepeaterHeadline => 'Reportar un repetidor faltante';

  @override
  String get addRepeaterDescription =>
      'Completa los datos del repetidor que quieres añadir. La solicitud será revisada antes de su publicación.';

  @override
  String get addRepeaterSectionRepeater => 'Datos del repetidor';

  @override
  String get addRepeaterSectionAccesses => 'Accesos';

  @override
  String get addRepeaterSectionLocation => 'Ubicación';

  @override
  String get addRepeaterSectionNotes => 'Notas';

  @override
  String get addRepeaterName => 'Nombre';

  @override
  String get addRepeaterNameHint => 'Ej. Monte Cimone';

  @override
  String get addRepeaterCallsign => 'Indicativo';

  @override
  String get addRepeaterCallsignHint => 'Ej. IR4AB';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Introduce al menos un nombre o indicativo';

  @override
  String get addRepeaterFrequency => 'Frecuencia (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Ej. 145.000 o 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frecuencia obligatoria';

  @override
  String get addRepeaterFrequencyInvalid => 'Frecuencia no válida';

  @override
  String get addRepeaterShift => 'Shift (MHz)';

  @override
  String get addRepeaterShiftHint => 'Ej. -0.600 o -0,600';

  @override
  String get addRepeaterRegion => 'Región';

  @override
  String get addRepeaterRegionHint => 'Ej. Emilia-Romagna';

  @override
  String get addRepeaterProvinceCode => 'Provincia';

  @override
  String get addRepeaterProvinceCodeHint => 'Ej. MO';

  @override
  String get addRepeaterLocality => 'Localidad';

  @override
  String get addRepeaterLocalityHint => 'Ej. Fanano';

  @override
  String get addRepeaterLatitude => 'Latitud';

  @override
  String get addRepeaterLatitudeHint => 'Ej. 44.2100';

  @override
  String get addRepeaterLongitude => 'Longitud';

  @override
  String get addRepeaterLongitudeHint => 'Ej. 10.7900';

  @override
  String get addRepeaterLocator => 'Locator';

  @override
  String get addRepeaterLocatorHint => 'Ej. JN54QF';

  @override
  String get addRepeaterNotes => 'Notas adicionales';

  @override
  String get addRepeaterNotesHint =>
      'Información adicional sobre el repetidor...';

  @override
  String get addRepeaterAddAccess => 'Añadir acceso';

  @override
  String get addRepeaterRemoveAccess => 'Eliminar';

  @override
  String get addRepeaterAccessMode => 'Modo';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Ej. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Ej. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'Código DCS';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Ej. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'Ej. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Ej. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Ej. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'Ej. 1234';

  @override
  String get addRepeaterAccessNetworkName => 'Nombre de red';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Ej. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Notas del acceso';

  @override
  String get addRepeaterAccessNotesHint =>
      'Notas específicas para este acceso...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Confirmo que esta información es correcta según mi conocimiento.';

  @override
  String get addRepeaterVerifiedTitle => 'Envío verificado';

  @override
  String get addRepeaterVerifiedDescription =>
      'Tu solicitud será revisada por el equipo antes de ser publicada en la base de datos.';

  @override
  String get addRepeaterSubmit => 'Enviar';

  @override
  String get addRepeaterSuccess => '¡Solicitud enviada con éxito!';

  @override
  String get addRepeaterError => 'Error al enviar la solicitud';

  @override
  String get addRepeaterAtLeastOneAccess => 'Añade al menos un acceso';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Acceso $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'Spots POTA en tiempo real con mapa y detalles del parque';

  @override
  String get changelog1017SubmitRepeater =>
      'Propón un nuevo repetidor directamente desde la app';

  @override
  String get changelog1017MultiLanguage =>
      'App disponible en inglés, español y francés';

  @override
  String get changelog1017Onboarding => 'Nueva experiencia de primer inicio';

  @override
  String get changelog1017ReportAnonymous =>
      'Reportes disponibles sin registro';

  @override
  String get changelogTitle => 'Novedades';

  @override
  String get changelogSubtitle => 'Esto es lo nuevo en esta versión';

  @override
  String get changelogCategoryAdded => 'Nuevo';

  @override
  String get changelogCategoryImproved => 'Mejorado';

  @override
  String get changelogCategoryFixed => 'Corregido';

  @override
  String get changelogDismiss => '¡Entendido!';
}
