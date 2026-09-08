// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get proSectionTitle => 'Suscripción';

  @override
  String get proCardUpgradeTitle => 'Descubre qué alcanzas';

  @override
  String get proCardUpgradeSubtitle =>
      'Cobertura, repetidores y mapas sin conexión';

  @override
  String get proCardActiveTitle => 'HamQRG Pro activo';

  @override
  String get proCardActiveSubtitle => '¡Gracias por tu apoyo!';

  @override
  String proPriceFromMonth(String price) {
    return 'Desde $price al mes · Cancela cuando quieras';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Prueba gratis, luego $price al mes · Cancela cuando quieras';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price una sola vez · Para siempre';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'Desde $price al mes · $total por adelantado · Cancela cuando quieras';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Prueba gratis, luego $price al mes · $total por adelantado · Cancela cuando quieras';
  }

  @override
  String get proRestoreSuccess => 'Compras restauradas: HamQRG Pro está activo';

  @override
  String get proRestoreNone => 'No hay compras que restaurar';

  @override
  String get proManageSubscription => 'Gestionar suscripción';

  @override
  String get proLinkAccountTitle => 'Vincula tu cuenta';

  @override
  String get proLinkAccountBody =>
      'Vincula HamQRG Pro a una cuenta para conservarlo en todos tus dispositivos, incluso tras reinstalar.';

  @override
  String get stationsShowcaseTitle => 'Tus ubicaciones, incluso sin conexión';

  @override
  String get stationsShowcaseBody =>
      'Guarda tu casa, el refugio, el sitio de activación: lo que alcanzas sigue ahí aunque no haya red.';

  @override
  String get offlineMapsUpsellTitle => 'El mapa se queda en tu teléfono 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Descarga las zonas que necesitas y ábrelas donde no hay señal: en una cresta, en un túnel o en el extranjero sin datos.';

  @override
  String get offlineMapsBenefitRegions => 'Tú eliges qué zonas descargar';

  @override
  String get reachUpsellBenefitSignal => 'Señal prevista para cada repetidor';

  @override
  String get reachUpsellBenefitTerrain =>
      'Perfil del terreno entre tú y el repetidor';

  @override
  String get proRestoreCta => 'Restaurar compras';

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
  String repeaterDetailDistanceWarning(String distance) {
    return 'Debes estar a menos de $distance del repetidor para enviar feedback.';
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
    return 'El lugar seleccionado está a $distance del repetidor. ¿Confirmas que quieres enviar este feedback bajo tu responsabilidad?';
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
  String get repeaterCoverageTitle => 'Cobertura';

  @override
  String get repeaterCoverageCardTitle => 'Mapa de cobertura';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Estima la señal del repetidor en el territorio';

  @override
  String get repeaterCoverageLoading => 'Calculando la cobertura…';

  @override
  String get repeaterCoverageError => 'No se pudo calcular la cobertura';

  @override
  String get repeaterCoverageRetry => 'Reintentar';

  @override
  String get repeaterCoverageLegendTitle => 'Señal estimada (dBm)';

  @override
  String get repeaterCoverageCta => 'Ver cobertura';

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
  String get userReportsTitle => 'Mis actividades';

  @override
  String get userReportsTabReports => 'Reportes';

  @override
  String get userReportsTabSubmissions => 'Nuevos repetidores';

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
  String get userSubmissionsEmpty => 'Ningún repetidor propuesto';

  @override
  String get userSubmissionsEmptyDescription =>
      'Los repetidores que propongas aparecerán aquí';

  @override
  String get userSubmissionsEmptyFiltered => 'Ningún repetidor con este filtro';

  @override
  String get userSubmissionsStatusPending => 'Pendiente';

  @override
  String get userSubmissionsStatusApproved => 'Aprobado';

  @override
  String get userSubmissionsStatusRejected => 'Rechazado';

  @override
  String get userSubmissionsCoordinatorResponse => 'Respuesta del coordinador';

  @override
  String get userSubmissionsFrequency => 'Frecuencia';

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
  String get profileUnitSystem => 'Unidades';

  @override
  String get profileUnitSystemAuto => 'Automático';

  @override
  String get profileUnitSystemMetric => 'Métrico';

  @override
  String get profileUnitSystemImperial => 'Imperial';

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
  String get profileLanguageGerman => 'Deutsch';

  @override
  String get profileLanguagePortuguese => 'Português';

  @override
  String get profileLanguageDutch => 'Nederlands';

  @override
  String get profileLanguagePolish => 'Polski';

  @override
  String get profileLanguageRomanian => 'Română';

  @override
  String get profileLanguageSlovenian => 'Slovenščina';

  @override
  String get profileLanguageCroatian => 'Hrvatski';

  @override
  String get profileLanguageHungarian => 'Magyar';

  @override
  String get profileLanguageCzech => 'Čeština';

  @override
  String get profileLanguageSlovak => 'Slovenčina';

  @override
  String get profileLanguageSerbian => 'Srpski';

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
  String get changelog1020ClusterSpots =>
      'Cluster spots en tiempo real: mira quién está escuchando en los repetidores, con notificaciones y preferencias';

  @override
  String get changelog1020DetailTabs =>
      'Página del repetidor con pestañas Info, Cluster y Comunidad';

  @override
  String get changelog1020TabletLayout => 'Diseño optimizado para tablets';

  @override
  String get changelog110Coverage =>
      'Mapa de cobertura de repetidores: mira la señal estimada directamente en el mapa (PRO)';

  @override
  String get changelog110Reachable =>
      'Qué alcanzas desde aquí: descubre los repetidores que recibes desde tu posición, con señal y perfil del terreno (PRO)';

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

  @override
  String get spotCreateTitle => 'Haz spot de ti mismo';

  @override
  String get spotCreateOtherTitle => 'Haz spot de un OM';

  @override
  String get spotCreateDuration => 'Duración';

  @override
  String get spotCreateAccess => 'Modo (opcional)';

  @override
  String get spotCreateCallsign => 'Indicativo del OM escuchado';

  @override
  String get spotCreateCallsignHint => 'Ej. EA1ABC';

  @override
  String get spotCreateConfirm => 'Confirmar';

  @override
  String get spotCreateSuccessSelf => '¡Spot creado!';

  @override
  String get spotCreateSuccessOther => '¡OM spotteado!';

  @override
  String get spotActiveYou => 'Estás spotteado';

  @override
  String get spotActiveClose => 'Cerrar spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'en $repeaterName';
  }

  @override
  String get spotActiveNone => 'Nadie spotteado en este momento';

  @override
  String get spotActiveCta => '¡Sé el primero!';

  @override
  String get spotActiveSection => 'Spots activos';

  @override
  String get spotHistorySection => 'Historial de spots';

  @override
  String get spotListTitle => 'Últimos spots';

  @override
  String get spotListViewAll => 'Ver todos';

  @override
  String get spotListBadgeActive => 'Escuchando';

  @override
  String get spotListBadgeClosed => 'Finalizado';

  @override
  String get spotListBadgeReport => 'Reportar';

  @override
  String get spotListEmpty => 'Sin spots en las últimas 24 horas';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Reportado por $callsign';
  }

  @override
  String get spotNotificationToggle => 'Notificaciones del cluster';

  @override
  String get spotNotificationDisabled =>
      'Notificaciones del cluster desactivadas en los ajustes del perfil';

  @override
  String get spotNotificationPerFavorite => 'Notificaciones de spots';

  @override
  String get spotPreviousClosed => 'Tu spot anterior ya no está activo';

  @override
  String get spotErrorAuthRequired => 'Debes iniciar sesión.';

  @override
  String get spotErrorCallsignRequired =>
      'Configura tu indicativo en el perfil para usar el cluster.';

  @override
  String get spotErrorInvalidDuration =>
      'La duración debe ser entre 5 y 60 minutos.';

  @override
  String get spotErrorRepeaterNotFound => 'Repetidor no encontrado.';

  @override
  String get spotErrorInvalidAccess =>
      'Modo de acceso no válido para este repetidor.';

  @override
  String get spotErrorSpotNotFound => 'Spot no encontrado.';

  @override
  String get spotErrorForbidden => 'No puedes cerrar un spot que no es tuyo.';

  @override
  String get spotErrorAlreadyClosed => 'El spot ya está cerrado.';

  @override
  String get spotErrorGeneric => 'Error al crear el spot. Inténtalo de nuevo.';

  @override
  String get spotAccessUnavailable => '(modo ya no disponible)';

  @override
  String spotDurationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get sotaTitle => 'SOTA Spots';

  @override
  String get sotaListEmpty => 'No SOTA spots at the moment';

  @override
  String get sotaLoadError => 'Failed to load SOTA spots';

  @override
  String get sotaRetry => 'Retry';

  @override
  String get sotaSummitPursuit => 'View toward the summit';

  @override
  String get sotaLosClear => 'Clear line of sight';

  @override
  String get sotaLosObstructed => 'Possible obstruction';

  @override
  String sotaLosObstructionAt(String distance, String height) {
    return 'Obstacle at $distance, +$height';
  }

  @override
  String sotaPointsBadge(int count) {
    return '$count pt';
  }

  @override
  String get sotaFilterAll => 'All';

  @override
  String get spotsFiltersTitle => 'Filtros';

  @override
  String get spotsFilterBand => 'Banda';

  @override
  String get spotsFilterMode => 'Modo';

  @override
  String get spotsFilterAll => 'Todos';

  @override
  String get spotsFiltersReset => 'Borrar filtros';

  @override
  String get sotaSortByTime => 'Time';

  @override
  String get sotaSortByDistance => 'Distance';

  @override
  String get sotaFilterPoints => 'Points';

  @override
  String get sotaFilterAssociation => 'Country';

  @override
  String get sotaSpotQrt => 'QRT';

  @override
  String sotaSummitInvalidFrom(String date) {
    return 'Summit no longer valid since $date';
  }

  @override
  String get sotaSummitRestrictions => 'Restricted access';

  @override
  String get sotaPursuitNoLocation =>
      'Enable location to see the profile toward the summit';

  @override
  String get sotaPursuitTooClose => 'You are practically on the summit';

  @override
  String get sotaPursuitTooFar => 'Summit too far for terrain profile';

  @override
  String get sotaPursuitError => 'Unable to compute profile. Retry.';

  @override
  String get sotaPursuitLoading => 'Computing terrain profile…';

  @override
  String get sotaCopyFrequency => 'Copy frequency';

  @override
  String get sotaOpenOnMap => 'Open on map';

  @override
  String get sotaShare => 'Share';

  @override
  String get sotaViewAll => 'View all';

  @override
  String get sotaTabDashboard => 'SOTA';

  @override
  String get sotaIntroEmpty =>
      'SOTA: Summits On The Air. Chase ham operators activating mountain summits.';

  @override
  String sotaSpotCount(int count) {
    return '$count spots';
  }

  @override
  String get sotaActivator => 'Activator';

  @override
  String get sotaSummit => 'Summit';

  @override
  String get sotaAssociation => 'Association';

  @override
  String get sotaRegion => 'Region';

  @override
  String get sotaLocator => 'Locator';

  @override
  String get sotaDistance => 'Distance';

  @override
  String get sotaBearing => 'Bearing';

  @override
  String get sotaElevationDelta => 'Elevation delta';

  @override
  String get sotaRemoveFilters => 'Remove filters';

  @override
  String get sotaPointsTitle => 'Points';

  @override
  String get sotaSpotInfo => 'Spot info';

  @override
  String get sotaTime => 'Time';

  @override
  String get sotaCopiedToClipboard => 'Frequency copied';

  @override
  String sotaPointsAbove(int count) {
    return '$count+ pt';
  }

  @override
  String get sotaFilterPointsAll => 'All points';

  @override
  String get reachSheetError =>
      'No se han podido calcular los repetidores alcanzables.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alcanzas $count repetidores',
      one: 'Alcanzas 1 repetidor',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'Desde tu ubicación, ordenados por señal';

  @override
  String get reachSheetEmpty => 'No hay repetidores alcanzables cerca.';

  @override
  String get reachBadgeTitle => '¿Lo alcanzas desde aquí?';

  @override
  String get reachBadgeSubtitle =>
      'Descubre si este repetidor te cubre y con qué señal';

  @override
  String get reachDiscoverCta => 'Descúbrelo con PRO';

  @override
  String get reachReachable => 'Lo alcanzas';

  @override
  String get reachOutOfCoverage => 'Fuera de cobertura';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · toca para ver el perfil';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance desde aquí';
  }

  @override
  String get reachComputing => 'Calculando cobertura…';

  @override
  String get reachRepeaterFallback => 'Repetidor';

  @override
  String get reachMapButton => '¿Qué alcanzas?';

  @override
  String get reachUpsellTitle => '¿Qué alcanzas desde aquí? 📡';

  @override
  String get reachUpsellBody =>
      'Descubre en tiempo real TODOS los repetidores que captas desde tu ubicación, con señal prevista y perfil del terreno. ¿Cuántos alcanzas de verdad desde donde estás ahora?';

  @override
  String get reachUpsellLater => 'Más tarde';

  @override
  String get linkProfileObstructed =>
      'Obstáculo en el trayecto (señal por difracción)';

  @override
  String get linkProfileClear => 'Línea de vista despejada';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Perfil del terreno y línea de vista · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Desbloquear con PRO';

  @override
  String get proWelcomeTitle => '¡Bienvenido a PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Has desbloqueado el mapa de cobertura, los repetidores que alcanzas desde tu ubicación y todas las funciones PRO. 📡';

  @override
  String get proWelcomeCta => 'Empezar a explorar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonOpenSettings => 'Abrir ajustes';

  @override
  String get commonFieldRequired => 'Campo obligatorio';

  @override
  String get fieldName => 'Nombre';

  @override
  String get fieldAddress => 'Dirección';

  @override
  String get fieldCity => 'Ciudad';

  @override
  String get fieldDescription => 'Descripción';

  @override
  String get fieldYear => 'Año';

  @override
  String get fieldSelectDateHint => 'Selecciona una fecha';

  @override
  String get validationInvalidYear => 'Selecciona un año válido';

  @override
  String get validationPasswordMinLength =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get permissionsMissingTitle => '¡Faltan permisos!';

  @override
  String get imageUploadError => 'Error al subir la imagen';

  @override
  String get uploadImageLabel => 'Subir imagen';

  @override
  String get sourceGallery => 'Galería';

  @override
  String get sourceCamera => 'Cámara';

  @override
  String get changePasswordTitle => 'Cambiar contraseña';

  @override
  String get fieldNewPassword => 'Nueva contraseña';

  @override
  String get fieldConfirmNewPassword => 'Confirmar nueva contraseña';

  @override
  String get validationPasswordsNoMatch => 'Las contraseñas no coinciden';

  @override
  String get passwordChangedSuccess => 'Contraseña cambiada correctamente';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get updateRequiredTitle => 'Actualización necesaria';

  @override
  String get updateRequiredAction => 'Actualizar ahora';

  @override
  String get yearPickerTitle => 'Selecciona el año';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Comunidad';

  @override
  String get updateRequiredBody =>
      'Hay una nueva versión de la app disponible. Actualiza para seguir usándola.';

  @override
  String get errorOpeningStore => 'Error al abrir la tienda';

  @override
  String get deleteConfirmTitle => 'Confirmar eliminación';

  @override
  String get deleteConfirmContent => '¿Seguro que quieres eliminar?';

  @override
  String get cameraPermissionRationale =>
      'Para hacer una foto, permite el acceso a la cámara en los ajustes.';

  @override
  String get coverageSearchHint => 'Busca un lugar o pega coordenadas';

  @override
  String get coverageSearchRecentTitle => 'Búsquedas recientes';

  @override
  String get coverageSearchNoResults => 'No se encontró ningún lugar';

  @override
  String get coverageSearchTip =>
      'Puedes pegar coordenadas (46.4879, 11.8123) o mantener pulsado en el mapa';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Coordenadas fuera de rango: latitud ±90, longitud ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Sin conexión: la búsqueda de lugares necesita red';

  @override
  String get coverageSearchErrorFailed =>
      'La búsqueda ha fallado. Inténtalo de nuevo.';

  @override
  String get coverageSearchClearPoint => 'Quitar punto';

  @override
  String get coverageSearchPointSemantics => 'Punto de búsqueda seleccionado';

  @override
  String get coverageBreadthTitle => 'Amplitud de búsqueda';

  @override
  String get coverageBreadthQuick => 'Rápida';

  @override
  String get coverageBreadthMedium => 'Media';

  @override
  String get coverageBreadthExtended => 'Amplia';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · respuesta más rápida';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · equilibrada';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · más lejos, más espera';
  }

  @override
  String get coverageResultSubtitle => 'Desde el punto seleccionado';

  @override
  String get coverageResultEmptyNoReachable =>
      'Ningún repetidor es accesible desde este punto';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'No hay repetidores registrados en esta zona';

  @override
  String get coverageResultClearFilters => 'Quitar filtros';

  @override
  String get coverageResultError => 'El cálculo ha fallado';

  @override
  String get coverageResultComputing => 'Calculando la recepción…';

  @override
  String get coverageResultCancel => 'Cancelar';

  @override
  String coverageResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count repetidores accesibles',
      one: '1 repetidor accesible',
    );
    return '$_temp0';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown de $total alcanzables';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count accesibles ocultos por los filtros',
      one: '1 accesible oculto por los filtros',
    );
    return '$_temp0';
  }

  @override
  String coverageTeaserTitle(String place) {
    return '¿Qué alcanzas desde $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Cada repetidor que alcanzas desde ese punto, con señal prevista y distancia — antes incluso de salir.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Cualquier punto del planeta';

  @override
  String get coverageTeaserBenefitOffline => 'Consultable sin red, en el campo';

  @override
  String get coverageTeaserBenefitSave => 'Guardas el punto y lo recuperas';

  @override
  String get stationSaveCta => 'Guardar puesto';

  @override
  String get stationSaveTitle => 'Nombre del puesto';

  @override
  String get stationRename => 'Renombrar';

  @override
  String get stationDelete => 'Eliminar';

  @override
  String get stationRefresh => 'Actualizar';

  @override
  String get stationRefreshAll => 'Actualizar todas';

  @override
  String get stationOfflineNotice => 'Datos guardados en el dispositivo';

  @override
  String get stationStaleNotice => 'Los datos podrían no estar actualizados';

  @override
  String get stationMissingEntry => 'Datos no disponibles sin conexión';

  @override
  String get stationDuplicateTitle => 'Punto ya guardado';

  @override
  String stationDuplicateBody(String distance) {
    return 'Ya existe un puesto a menos de $distance. ¿Actualizarlo o crear uno distinto?';
  }

  @override
  String get stationDuplicateUpdate => 'Actualizarlo';

  @override
  String get stationDuplicateCreate => 'Crear distinto';

  @override
  String get stationSaveFailed => 'No se pudo guardar: espacio insuficiente';

  @override
  String get stationSavedCta => 'Ubicación guardada';

  @override
  String get stationRemoveCta => 'Eliminar';

  @override
  String get stationRemoveTitle => '¿Eliminar la ubicación?';

  @override
  String stationRemoveBody(String name) {
    return '«$name» y sus datos sin conexión se eliminarán de este dispositivo.';
  }

  @override
  String get stationRemovedSnack => 'Ubicación eliminada';

  @override
  String get stationSaveError => 'No se pudo guardar. Inténtalo de nuevo.';

  @override
  String get stationsTitle => 'Mis puestos';

  @override
  String get stationsProfileSubtitle =>
      'Los puntos que has evaluado, disponibles sin conexión';

  @override
  String get stationsEmptyTitle => 'Aún no hay puestos guardados';

  @override
  String get stationsEmptyBody =>
      'Una ubicación es un punto del mapa cuya cobertura ya has calculado, guardado para volver a encontrarlo sin conexión.';

  @override
  String get stationsEmptyStep1 =>
      'Elige un punto en el mapa: mantén pulsado, búscalo por nombre o pega las coordenadas.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Toca «$action» para ver qué repetidores alcanzas desde allí.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Guarda el punto: lo encontrarás aquí, incluso en el campo sin cobertura.';

  @override
  String get stationsGoToMap => 'Ir al mapa';

  @override
  String get stationsRefreshDone => 'Actualización completada';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Actualizado $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Actualización en $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Actualización en $minutes min';
  }

  @override
  String get spotsUpdating => 'Actualizando…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Actualización automática cada $seconds segundos';
  }

  @override
  String get spotsManualRefreshHint => 'Toca para actualizar';

  @override
  String coverageResultScope(String km, int count) {
    return 'en $km · $count evaluados';
  }

  @override
  String get coverageResultRecalculating => 'Recalculando';

  @override
  String get offlineBannerMessage =>
      'Sin conexión: estás viendo los datos guardados';

  @override
  String get offlineMapsTitle => 'Mapas sin conexión';

  @override
  String get offlineMapsEntrySubtitle =>
      'Descarga mapas para usarlos sin conexión';

  @override
  String get offlineMapsEmpty =>
      'No hay regiones descargadas. Descarga una zona para ver el mapa incluso sin conexión.';

  @override
  String get offlineMapsAddRegion => 'Descargar región';

  @override
  String get offlineMapsRegionNameLabel => 'Nombre de la región';

  @override
  String get offlineMapsRegionNameHint =>
      'P. ej. Casa, Refugio, Activación SOTA';

  @override
  String get offlineMapsRadiusLabel => 'Radio';

  @override
  String get offlineMapsDownload => 'Descargar';

  @override
  String get offlineMapsDownloadingStyle => 'Descargando estilo del mapa…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Descargando mapas… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Tamaño estimado: $size';
  }

  @override
  String get offlineMapsDownloadError =>
      'Error de descarga. Inténtalo de nuevo.';

  @override
  String get offlineMapsDeleteError =>
      'No se pudo eliminar. Inténtalo de nuevo.';

  @override
  String get offlineMapsDeleteConfirmTitle => '¿Eliminar la región?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '“$name” ya no estará disponible sin conexión.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Eliminar';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Radio $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Descarga incompleta';

  @override
  String get offlineMapsResume => 'Reanudar';

  @override
  String get offlineMapsCenterInfo =>
      'La región se centrará en tu ubicación actual.';

  @override
  String get dashboardOfflineTitle => 'Sin conexión';

  @override
  String get dashboardOfflineMessage =>
      'No hay datos guardados para esta zona. Tus ubicaciones guardadas y los mapas descargados siguen disponibles.';

  @override
  String get offlineMapsCenterMine => 'Mi posición';

  @override
  String get offlineMapsCenterSearch => 'Buscar un lugar';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Busca una ciudad o un lugar: la región se centrará ahí.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Centro: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Modo sin conexión: repetidores, favoritos, perfil, cobertura y alcance disponibles también sin red (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Mapas sin conexión: descarga la zona donde estás o un lugar a tu elección y úsala sin conexión (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Búsqueda de cobertura desde cualquier punto: busca una localidad, pega coordenadas o mantén pulsado el mapa para descubrir qué alcanzas desde allí';

  @override
  String get changelog120SavedStations =>
      'Mis estaciones: guarda los puntos que te interesan y consúltalos también sin conexión (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'Los spots SOTA y POTA se actualizan solos cada minuto, con insignias de color por modo (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Sin conexión la app arranca al instante, muestra lo que está disponible y desactiva las acciones que requieren red';

  @override
  String get changelog130ImperialUnits =>
      'Millas y pies: la app ahora sigue las unidades de tu dispositivo, y puedes elegir el sistema en Ajustes';

  @override
  String get profileUnitSystemAutoShort => 'Auto';
}
