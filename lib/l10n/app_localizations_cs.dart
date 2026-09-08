// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get proSectionTitle => 'Předplatné';

  @override
  String get proCardUpgradeTitle => 'Zjisti, co dosáhneš';

  @override
  String get proCardUpgradeSubtitle => 'Pokrytí, převaděče a offline mapy';

  @override
  String get proCardActiveTitle => 'HamQRG Pro aktivní';

  @override
  String get proCardActiveSubtitle => 'Děkujeme za podporu!';

  @override
  String proPriceFromMonth(String price) {
    return 'Od $price měsíčně · Kdykoli zrušíš';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Zkušební verze zdarma, pak $price měsíčně · Kdykoli zrušíš';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price jednorázově · Navždy';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'Od $price měsíčně · $total předem · Kdykoli zrušíš';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Zkušební verze zdarma, pak $price měsíčně · $total předem · Kdykoli zrušíš';
  }

  @override
  String get proRestoreSuccess => 'Nákupy obnoveny: HamQRG Pro je aktivní';

  @override
  String get proRestoreNone => 'Žádné nákupy k obnovení';

  @override
  String get proManageSubscription => 'Spravovat předplatné';

  @override
  String get proLinkAccountTitle => 'Propoj svůj účet';

  @override
  String get proLinkAccountBody =>
      'Propoj HamQRG Pro s účtem, aby ti zůstalo na všech zařízeních i po přeinstalaci.';

  @override
  String get stationsShowcaseTitle => 'Tvá stanoviště i bez sítě';

  @override
  String get stationsShowcaseBody =>
      'Ulož domov, chatu, aktivační místo: co dosáhneš, zůstane i bez sítě.';

  @override
  String get offlineMapsUpsellTitle => 'Mapa zůstane v telefonu 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Stáhni si oblasti, které potřebuješ, a otevři je tam, kde není signál: na hřebeni, v tunelu, v zahraničí bez dat.';

  @override
  String get offlineMapsBenefitRegions => 'Sám si vybereš oblasti ke stažení';

  @override
  String get reachUpsellBenefitSignal =>
      'Předpokládaný signál pro každý převaděč';

  @override
  String get reachUpsellBenefitTerrain =>
      'Profil terénu mezi tebou a převaděčem';

  @override
  String get proRestoreCta => 'Obnovit nákupy';

  @override
  String get error => 'Chyba';

  @override
  String get error_message => 'Při načítání došlo k chybě';

  @override
  String get error_message_retry =>
      'Při načítání došlo k chybě. Zkuste to prosím později';

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get back => 'Zpět';

  @override
  String get loading => 'Načítání';

  @override
  String get details => 'Podrobnosti';

  @override
  String pages_number(Object number) {
    return '$number stránek k prozkoumání';
  }

  @override
  String get january => 'Leden';

  @override
  String get february => 'Únor';

  @override
  String get march => 'Březen';

  @override
  String get april => 'Duben';

  @override
  String get may => 'Květen';

  @override
  String get june => 'Červen';

  @override
  String get july => 'Červenec';

  @override
  String get august => 'Srpen';

  @override
  String get september => 'Září';

  @override
  String get october => 'Říjen';

  @override
  String get november => 'Listopad';

  @override
  String get december => 'Prosinec';

  @override
  String get logout => 'Odhlásit se';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Nastavení';

  @override
  String get contact_us => 'Kontaktujte nás';

  @override
  String get error_opening_email => 'Při otevírání e-mailu došlo k chybě';

  @override
  String get register_now => 'Zaregistrujte se';

  @override
  String get tracking_permission_title => 'Podpořte aplikaci';

  @override
  String get tracking_permission_message =>
      'Pro zlepšení vašeho zážitku a zobrazení relevantnějšího obsahu nám pomozte udržet aplikaci zdarma.\n\nKlepněte na Povolit pro podporu.';

  @override
  String get tracking_permission_next => 'Další';

  @override
  String get skip => 'Přeskočit';

  @override
  String get done => 'Hotovo';

  @override
  String get next => 'Další';

  @override
  String get joinCommunityTitle => 'Přidejte se k naší komunitě!';

  @override
  String get joinCommunityDescription =>
      'Objevte výhody členství v komunitě na Telegramu:';

  @override
  String get benefitSupportMembers => 'Podpora od členů';

  @override
  String get benefitSuggestFeatures => 'Navrhujte nové funkce';

  @override
  String get benefitContactDevelopers => 'Kontakt s vývojáři';

  @override
  String get benefitExclusivePreviews => 'Exkluzivní náhledy a beta verze';

  @override
  String get benefitActiveCommunity => 'Aktivní komunita';

  @override
  String get joinNowButton => 'Přidejte se!';

  @override
  String get alreadyMemberButton => 'Už jsem členem';

  @override
  String get laterButton => 'Později';

  @override
  String get errorOpenTelegram => 'Chyba při otevírání Telegramu';

  @override
  String get disclaimerTitle => 'Zdroj dat';

  @override
  String get disclaimerDescription =>
      'Data o převaděčích v této aplikaci pocházejí od IZ8WNH.\n\nPro další informace, stažení CSV souborů pro programování radiostanic nebo konzultaci dat nedostupných v této aplikaci navštivte oficiální stránky.';

  @override
  String get disclaimerVisitSite => 'Navštívit iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Rozumím';

  @override
  String get errorOpenDisclaimerSite => 'Chyba při otevírání webových stránek';

  @override
  String get repeatersMapTitle => 'Mapa převaděčů';

  @override
  String get repeatersListTitle => 'Seznam převaděčů';

  @override
  String get repeatersMapLoading => 'Načítání mapy převaděčů…';

  @override
  String get repeatersMapGenericError => 'Nepodařilo se načíst převaděče.';

  @override
  String get repeatersMapEmpty => 'V okolí nebyly nalezeny žádné převaděče.';

  @override
  String get repeatersSearchHint =>
      'Hledat podle názvu, volacího znaku nebo frekvence MHz…';

  @override
  String get repeatersSearchEmpty => 'Žádné převaděče nebyly nalezeny.';

  @override
  String get repeatersSortDistance => 'Vzdálenost';

  @override
  String get repeatersSortLikes => 'Lajky';

  @override
  String get repeatersSortFrequency => 'Frekvence';

  @override
  String repeatersNearbyCount(int count) {
    return '$count převaděčů v okolí';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count výsledků';
  }

  @override
  String get repeatersMapRetry => 'Zkusit znovu';

  @override
  String get repeatersMapOpenSettings => 'Otevřít nastavení';

  @override
  String get repeatersMapPermissionMessage =>
      'Povolte přístup k poloze pro zobrazení převaděčů ve vašem okolí.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Oprávnění k poloze bylo trvale zamítnuto. Povolte ho v nastavení systému.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Zapněte služby určování polohy pro nalezení převaděčů v okolí.';

  @override
  String repeatersMapFound(int count) {
    return '$count nalezených převaděčů';
  }

  @override
  String get repeaterMode => 'Režim';

  @override
  String get repeaterModeAnalog => 'Analog';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Všechny režimy';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frekvence';

  @override
  String get repeaterShift => 'Shift';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Poloha';

  @override
  String get repeaterDistance => 'Vzdálenost';

  @override
  String get repeaterViewFullDetails => 'Zobrazit úplné podrobnosti';

  @override
  String get repeatersMapReturnToLocation => 'Návrat na moji polohu';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count převaděčů na tomto místě';
  }

  @override
  String get profileUnlockFeatures => 'Odemkněte všechny funkce';

  @override
  String get profileUnlockFeaturesDescription =>
      'Zaregistrujte se a používejte hodnocení, ukládání oblíbených a podrobné statistiky.';

  @override
  String get profileSignUpOrLogin => 'Registrace nebo přihlášení';

  @override
  String get profileErrorOpeningEmail => 'Chyba při otevírání e-mailu';

  @override
  String get profileJoinTelegramCommunity =>
      'Přidejte se ke komunitě na Telegramu';

  @override
  String get profileWelcomeTitle => 'Vítejte v HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Přidejte se k naší komunitě radioamatérů v Itálii.';

  @override
  String get profileEditProfile => 'Upravit profil';

  @override
  String get profileChangePhoto => 'Změnit fotografii';

  @override
  String get profileFirstName => 'Jméno';

  @override
  String get profileLastName => 'Příjmení';

  @override
  String get profileCallsign => 'Volací znak';

  @override
  String get profileRestartIdentificationTitle =>
      'Potřebujete změnit svůj status? Můžete restartovat proces identifikace a přepnout z licencovaného operátora na SWL posluchače.';

  @override
  String get profileRestartIdentificationButton =>
      'Restartovat proces identifikace';

  @override
  String get profileSaveChanges => 'Uložit změny';

  @override
  String get profileDangerZone => 'Nebezpečná zóna';

  @override
  String get profileDeleteAccount => 'Smazat účet';

  @override
  String get profileDeleteAccountConfirmTitle => 'Smazat účet';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Opravdu chcete smazat svůj účet? Tuto akci nelze vrátit zpět.';

  @override
  String get profileDeleteAccountCancel => 'Zrušit';

  @override
  String get profileDeleteAccountConfirm => 'Smazat';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'Verze aplikace $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Komunita a podpora';

  @override
  String get profileSectionSupport => 'Podpora';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Verze: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Verze $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Chyba: $error';
  }

  @override
  String get authJoinTitle => 'Připojte se k HamQRG';

  @override
  String get authUnlockFeatures => 'Přihlaste se a odemkněte všechny funkce!';

  @override
  String get authWhatYouGet => 'Co získáte:';

  @override
  String get authBenefitStatsTitle => 'Podrobné statistiky';

  @override
  String get authBenefitStatsDescription =>
      'Sledujte svůj pokrok a zlepšujte se';

  @override
  String get authBenefitQuizTitle => 'Různé režimy kvízů';

  @override
  String get authBenefitQuizDescription =>
      'Procvičujte v maratonu, tématických a dalších režimech.';

  @override
  String get authBenefitSyncTitle => 'Synchronizace';

  @override
  String get authBenefitSyncDescription => 'Přístup z jakéhokoli zařízení';

  @override
  String get authOrSignInWithEmail => 'Nebo se přihlaste e-mailem';

  @override
  String get authEnterEmail => 'Zadejte e-mail';

  @override
  String get authEnterPassword => 'Zadejte heslo';

  @override
  String get authForgotPassword => 'Zapomněli jste heslo?';

  @override
  String get authSignIn => 'Přihlásit se';

  @override
  String get authSignUp => 'Zaregistrovat se';

  @override
  String get authPasswordLengthError => 'Heslo musí být delší';

  @override
  String get authDontHaveAccount => 'Nemáte účet? Zaregistrujte se';

  @override
  String get authHaveAccount => 'Již máte účet? Přihlaste se';

  @override
  String get authBackToSignIn => 'Zpět na přihlášení';

  @override
  String get authUnexpectedError => 'Chyba ověřování: ';

  @override
  String get authValidEmailError => 'Zadejte platný e-mail';

  @override
  String get authSendPasswordReset => 'Odeslat obnovení hesla';

  @override
  String get authPasswordResetSent => 'Obnovení hesla odesláno';

  @override
  String get authVerifyEmailMessage =>
      'Pro dokončení registrace ověřte svůj e-mail, zkontrolujte doručenou poštu.';

  @override
  String get authInvalidCredentials => 'Neplatný e-mail nebo heslo';

  @override
  String get authEmailNotConfirmed => 'Pro přihlášení ověřte svůj e-mail';

  @override
  String get authFirstName => 'Jméno';

  @override
  String get authFirstNameRequired => 'Jméno je povinné';

  @override
  String get authLastName => 'Příjmení';

  @override
  String get authLastNameRequired => 'Příjmení je povinné';

  @override
  String get authContinueAsGuest => 'Pokračovat jako host';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Objevte převaděče ve vašem okolí';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Rychlý přístup';

  @override
  String get homeRepeaterList => 'Seznam převaděčů';

  @override
  String get homeMyFavorites => 'Moje oblíbené';

  @override
  String get homeNearby => 'V okolí';

  @override
  String get homeViewAll => 'Zobrazit vše';

  @override
  String get dashboardTabRepeaters => 'Převaděče';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Žádné převaděče v okolí';

  @override
  String get dashboardViewAllRepeaters => 'Zobrazit všechny převaděče';

  @override
  String get dashboardViewAllPotaSpots => 'Zobrazit všechny POTA spoty';

  @override
  String homeStations(int count) {
    return '$count stanic';
  }

  @override
  String homeSaved(int count) {
    return '$count uložených';
  }

  @override
  String get homeActive => 'Aktivní';

  @override
  String get homeIdle => 'Neaktivní';

  @override
  String get homeNavHome => 'Domů';

  @override
  String get homeNavList => 'Seznam';

  @override
  String get homeNavFavorites => 'Oblíbené';

  @override
  String get homeNavMap => 'Mapa';

  @override
  String get homeNavProfile => 'Profil';

  @override
  String get favoritesTitle => 'Moje oblíbené';

  @override
  String get favoritesSearchHint => 'Hledat uložené převaděče...';

  @override
  String get favoritesFilterAllSaved => 'Vše uložené';

  @override
  String get favoritesEmpty => 'Žádné uložené převaděče';

  @override
  String get favoritesEmptyDescription =>
      'Přidejte převaděče do oblíbených a uvidíte je zde';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Zobrazeno $showing z $total oblíbených stanic';
  }

  @override
  String get favoritesRemove => 'Odebrat z oblíbených';

  @override
  String get favoritesAdd => 'Přidat do oblíbených';

  @override
  String get repeaterDetailSave => 'Uložit';

  @override
  String get repeaterDetailShare => 'Sdílet';

  @override
  String get repeaterDetailReport => 'Nahlásit';

  @override
  String get repeaterDetailTotalLikes => 'Celkem lajků';

  @override
  String get repeaterDetailReports1Yr => 'Hlášení (1 rok)';

  @override
  String get repeaterDetailHealthScore => 'Skóre stavu';

  @override
  String get repeaterDetailExcellent => 'Vynikající';

  @override
  String get repeaterDetailGood => 'Dobrý';

  @override
  String get repeaterDetailFair => 'Uspokojivý';

  @override
  String get repeaterDetailToVerify => 'K ověření';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Skóre vypočítáno z $count negativních hlášení za poslední rok';
  }

  @override
  String get repeaterDetailLastLike => 'Poslední lajk';

  @override
  String get repeaterDetailLastDownReport => 'Poslední negativní hlášení';

  @override
  String get repeaterDetailTechnicalData => 'Technické údaje';

  @override
  String get repeaterDetailFrequency => 'Frekvence';

  @override
  String get repeaterDetailShift => 'Shift';

  @override
  String get repeaterDetailSubtone => 'Subtón (SQL)';

  @override
  String get repeaterDetailMode => 'Režim';

  @override
  String get repeaterDetailLocation => 'Poloha';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance daleko';
  }

  @override
  String get repeaterDetailCommunityReports => 'Hlášení komunity';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Aktualizovat stav a zpětnou vazbu';

  @override
  String get repeaterDetailEquipment => 'Vybavení';

  @override
  String get repeaterDetailEquipmentRequired => 'Vybavení *';

  @override
  String get repeaterDetailAccessModes => 'Režimy přístupu';

  @override
  String get repeaterDetailNetwork => 'Síť';

  @override
  String get repeaterDetailLocationField => 'Poloha';

  @override
  String get repeaterDetailLocationRequired => 'Poloha *';

  @override
  String get repeaterDetailComment => 'Komentář';

  @override
  String get repeaterDetailCommentOptional => 'Komentář (volitelný)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Kvalita signálu, hlášení o zvuku nebo obecné komentáře...';

  @override
  String get repeaterDetailReportDown => 'Nahlásit problém';

  @override
  String get repeaterDetailCheckinLike => 'Check-in a lajk';

  @override
  String get repeaterDetailYourFeedback => 'Vaše zpětná vazba';

  @override
  String get repeaterDetailPostedJustNow => 'Právě přidáno';

  @override
  String get repeaterDetailDeleteEntry => 'Smazat záznam';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Zobrazit všech $count hlášení';
  }

  @override
  String get repeaterDetailStationPortable => 'Přenosná';

  @override
  String get repeaterDetailStationMobile => 'Mobilní';

  @override
  String get repeaterDetailStationFixed => 'Pevná';

  @override
  String get repeaterDetailLike => 'Lajk';

  @override
  String get repeaterDetailReportLabel => 'Hlášení';

  @override
  String get repeaterDetailSaved => 'Uloženo';

  @override
  String get repeaterDetailShareMessage =>
      'Podívejte se na tento převaděč na HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'Funkce hlášení bude brzy k dispozici. Budete moci nahlásit nesprávné informace nebo problémy s tímto převaděčem.';

  @override
  String get commonClose => 'Zavřít';

  @override
  String get favorite => 'Oblíbené';

  @override
  String get accessConfiguration => 'Konfigurace přístupu';

  @override
  String get noAccessConfiguration => 'Žádná konfigurace není k dispozici';

  @override
  String get repeaterDetailAddFeedback => 'Přidat zpětnou vazbu';

  @override
  String get repeaterDetailOthersReports => 'Hlášení ostatních uživatelů';

  @override
  String get repeaterDetailRemove => 'Odebrat';

  @override
  String get repeaterDetailSelectAccess => 'Vybrat přístup';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'Pro odeslání zpětné vazby musíte být do $distance od převaděče.';
  }

  @override
  String get repeaterDetailInteractive => 'Interaktivní';

  @override
  String get repeaterDetailLogYourSignal => 'Zaznamenejte svůj signál';

  @override
  String get repeaterDetailUsedEquipment => 'Použité vybavení';

  @override
  String get repeaterDetailYourLocation => 'Vaše poloha';

  @override
  String get repeaterDetailLocationPlaceholder =>
      'Kde jste byli? (např. Praha)';

  @override
  String get repeaterDetailLocationSelectHint => 'Vyberte místo z návrhů';

  @override
  String get feedbackDistanceConfirmTitle => 'Potvrzení odeslání';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'Vybrané místo je $distance od převaděče. Potvrzujete, že chcete odeslat tuto zpětnou vazbu na vlastní odpovědnost?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Potvrdit';

  @override
  String get feedbackDistanceConfirmCancel => 'Zrušit';

  @override
  String get repeaterDetailSelectAccessInstance => 'Vybrat instanci přístupu';

  @override
  String get repeaterDetailSignalObservations => 'Pozorování signálu';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Jaká byla kvalita zvuku?';

  @override
  String get repeaterDetailSendLike => 'Odeslat lajk';

  @override
  String get repeaterDetailReportIssue => 'Nahlásit problém';

  @override
  String get repeaterDetailRecentActivity => 'Nedávná aktivita';

  @override
  String get reportIssueTitle => 'Hlášení';

  @override
  String get reportIssueHeadline => 'Pomozte nám udržet data přesná';

  @override
  String get reportIssueDescription =>
      'Našli jste u tohoto převaděče něco špatného nebo chybějícího? Dejte nám vědět, co je třeba změnit, a my to ověříme.';

  @override
  String get reportIssueWhatToCorrect =>
      'Co byste chtěli opravit nebo doplnit?';

  @override
  String get reportIssuePlaceholder =>
      'Např. CTCSS tón se změnil na 88,5 Hz, nebo poloha je mírně severněji, správce je...';

  @override
  String get reportIssueVerifiedTitle => 'Ověřená podání';

  @override
  String get reportIssueVerifiedDescription =>
      'Vaše hlášení bude posouzeno regionálním koordinátorem před aktualizací veřejné databáze. Děkujeme za váš příspěvek komunitě.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Potvrzuji, že tyto informace jsou správné na základě mého pozorování.';

  @override
  String get reportIssueSubmit => 'Odeslat';

  @override
  String get reportIssueMinChars => 'Vyžadováno minimálně 10 znaků';

  @override
  String get reportIssueMaxChars => 'Maximálně 2000 znaků';

  @override
  String get reportIssueSuccess => 'Hlášení úspěšně odesláno';

  @override
  String get reportIssueError => 'Chyba při odesílání hlášení';

  @override
  String get registrationPromptTitle => 'Odemkněte plný potenciál';

  @override
  String get registrationPromptDescription =>
      'Přidejte se ke komunitě radioamatérů a posuňte svůj zážitek na novou úroveň.';

  @override
  String get registrationBenefitInteractTitle => 'Interakce';

  @override
  String get registrationBenefitInteractDescription =>
      'Hodnoťte převaděče a zanechávejte komentáře pro ostatní.';

  @override
  String get registrationBenefitFavoritesTitle => 'Oblíbené';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Uložte si nejpoužívanější frekvence a převaděče.';

  @override
  String get registrationBenefitLogbookTitle => 'Deník';

  @override
  String get registrationBenefitLogbookDescription =>
      'Sledujte svá QSO a uchovávejte osobní historii.';

  @override
  String get registrationSignInApple => 'Přihlásit se přes Apple';

  @override
  String get registrationSignInGoogle => 'Přihlásit se přes Google';

  @override
  String get registrationPromptFooter =>
      'Registrace zdarma. Pro prohlížení veřejných dat není nutná licence.';

  @override
  String get postLoginOnboardingWelcome => 'Vítejte v';

  @override
  String get postLoginOnboardingQuestion => 'Jste licencovaný radioamatér?';

  @override
  String get postLoginOnboardingHelpText =>
      'Toto nám pomáhá přizpůsobit váš zážitek a zobrazit správné frekvence.';

  @override
  String get postLoginOnboardingYesLicensed => 'Ano, jsem';

  @override
  String get postLoginOnboardingNoListener => 'Ne, jsem jen posluchač';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identifikujte se';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Zadejte svůj oficiální volací znak pro přístup k síťovým funkcím.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Volací znak';

  @override
  String get postLoginOnboardingCallsignHint => 'Např. OK1XYZ';

  @override
  String get postLoginOnboardingComplete => 'Dokončit profil';

  @override
  String get postLoginOnboardingBack => 'Zpět';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Toto můžete změnit později v nastavení.';

  @override
  String get postLoginOnboardingSwlTitle => 'Volací znak SWL';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Máte oficiální volací znak SWL?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'Volací znaky posluchačů krátkých vln pomáhají s identifikací v globální monitorovací komunitě.';

  @override
  String get postLoginOnboardingSwlYes => 'Ano, mám';

  @override
  String get postLoginOnboardingSwlNo => 'Ne, nemám';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Zadejte volací znak';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Např. OK1-12345-SWL';

  @override
  String get timeAgoJustNow => 'právě teď';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před $count minutami',
      few: 'před $count minutami',
      one: 'před 1 minutou',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před $count hodinami',
      few: 'před $count hodinami',
      one: 'před 1 hodinou',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před $count dny',
      few: 'před $count dny',
      one: 'před 1 dnem',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před $count týdny',
      few: 'před $count týdny',
      one: 'před 1 týdnem',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před $count měsíci',
      few: 'před $count měsíci',
      one: 'před 1 měsícem',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před $count lety',
      few: 'před $count lety',
      one: 'před 1 rokem',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Vzhled';

  @override
  String get profileThemeModeSystem => 'Systémový';

  @override
  String get profileThemeModeLight => 'Světlý';

  @override
  String get profileThemeModeDark => 'Tmavý';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Buďte první, kdo zanechá zpětnou vazbu k tomuto převaděči!';

  @override
  String get repeaterDetailDistanceFromYou => 'Vzdálenost od vás';

  @override
  String get repeaterDistanceMapNoLocation => 'Poloha není k dispozici';

  @override
  String get repeaterDetailNever => 'Nikdy';

  @override
  String get repeaterDetailInfo => 'Informace';

  @override
  String get repeaterDetailSource => 'Zdroj';

  @override
  String get repeaterDetailManager => 'Správce';

  @override
  String get repeaterDetailSuggestManager =>
      'Znáte správce převaděče? Nahlaste to!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Mapa zpětné vazby';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Podívejte se, kde byly zaznamenány lajky a hlášení';

  @override
  String get repeaterDetailAltimetricProfile => 'Výškový profil';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Zobrazit profil terénu mezi vámi a převaděčem';

  @override
  String get repeaterCoverageTitle => 'Pokrytí';

  @override
  String get repeaterCoverageCardTitle => 'Mapa pokrytí';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Odhadne signál převaděče v oblasti';

  @override
  String get repeaterCoverageLoading => 'Výpočet pokrytí…';

  @override
  String get repeaterCoverageError => 'Pokrytí se nepodařilo vypočítat';

  @override
  String get repeaterCoverageRetry => 'Zkusit znovu';

  @override
  String get repeaterCoverageLegendTitle => 'Odhadovaný signál (dBm)';

  @override
  String get repeaterCoverageCta => 'Zobrazit pokrytí';

  @override
  String get repeaterDetailLosClear =>
      'Přímá viditelnost mezi vámi a převaděčem je volná';

  @override
  String get repeaterDetailLosObstructed =>
      'Přímá viditelnost je blokována terénem';

  @override
  String get repeaterDetailTerrainProfile => 'Profil terénu';

  @override
  String get repeaterDetailLineOfSight => 'Přímá viditelnost';

  @override
  String get repeaterDetailTotalDistance => 'Vzdálenost';

  @override
  String get repeaterDetailRepeaterElevation => 'Nadmořská výška převaděče';

  @override
  String get repeaterDetailYourElevation => 'Vaše nadmořská výška';

  @override
  String get repeaterDetailYou => 'Vy';

  @override
  String get repeaterDetailRepeaterLabel => 'Převaděč';

  @override
  String get repeaterDetailFunFacts => 'Věděli jste?';

  @override
  String get repeaterDetailWavelength => 'Vlnová délka';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'Vlnová délka tohoto převaděče je $value';
  }

  @override
  String get repeaterDetailOscillations => 'Kmitů za sekundu';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Signál kmitá $value krát za sekundu';
  }

  @override
  String get repeaterDetailPropagationTime => 'Doba šíření';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Váš signál potřebuje $value k dosažení převaděče';
  }

  @override
  String get repeaterDetailWaveCycles => 'Vlnové cykly při přenosu';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'Vlna dokončí $value úplných cyklů při přenosu';
  }

  @override
  String get userReportsTitle => 'Moje aktivity';

  @override
  String get userReportsTabReports => 'Hlášení';

  @override
  String get userReportsTabSubmissions => 'Nové převaděče';

  @override
  String get userReportsFilterAll => 'Vše';

  @override
  String get userReportsFilterOpen => 'Otevřená';

  @override
  String get userReportsFilterClosed => 'Uzavřená';

  @override
  String get userReportsEmpty => 'Žádná odeslaná hlášení';

  @override
  String get userReportsEmptyDescription =>
      'Vaše hlášení o převaděčích se zobrazí zde';

  @override
  String get userReportsEmptyFiltered => 'Žádná hlášení s tímto filtrem';

  @override
  String get userReportsStatusPending => 'Čeká na zpracování';

  @override
  String get userReportsStatusReviewed => 'Kontrolováno';

  @override
  String get userReportsStatusResolved => 'Vyřešeno';

  @override
  String get userReportsStatusRejected => 'Zamítnuto';

  @override
  String get userReportsRetryBanner => 'Nelze aktualizovat seznam';

  @override
  String get userReportsProfileTile => 'Moje hlášení';

  @override
  String get userReportsProfileTileSubtitle => 'Zobrazit stav vašich hlášení';

  @override
  String get userReportsError => 'Chyba při načítání hlášení';

  @override
  String get userReportsCoordinatorResponse => 'Odpověď koordinátora';

  @override
  String get userSubmissionsEmpty => 'Žádné navržené převaděče';

  @override
  String get userSubmissionsEmptyDescription =>
      'Navržené převaděče se zobrazí zde';

  @override
  String get userSubmissionsEmptyFiltered => 'Žádné převaděče s tímto filtrem';

  @override
  String get userSubmissionsStatusPending => 'Čekající';

  @override
  String get userSubmissionsStatusApproved => 'Schváleno';

  @override
  String get userSubmissionsStatusRejected => 'Zamítnuto';

  @override
  String get userSubmissionsCoordinatorResponse => 'Odpověď koordinátora';

  @override
  String get userSubmissionsFrequency => 'Frekvence';

  @override
  String get potaTitle => 'POTA spoty';

  @override
  String get potaSearchHint => 'Hledat podle aktivátora, parku nebo režimu…';

  @override
  String get potaNoSpots => 'Momentálně nejsou žádné aktivní POTA spoty.';

  @override
  String get potaLoadError => 'Nepodařilo se načíst POTA spoty';

  @override
  String get potaRetry => 'Zkusit znovu';

  @override
  String get potaViewAll => 'Zobrazit vše';

  @override
  String get potaActivator => 'Aktivátor';

  @override
  String get potaFrequency => 'Frekvence';

  @override
  String get potaMode => 'Režim';

  @override
  String get potaPark => 'Park';

  @override
  String get potaReference => 'Reference';

  @override
  String get potaSpotter => 'Spatřil';

  @override
  String get potaComments => 'Komentáře';

  @override
  String get potaLastSpotted => 'Naposledy spatřen';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Nepodařilo se otevřít QRZ.com';

  @override
  String get potaParkWebsite => 'Web parku';

  @override
  String get potaParkType => 'Typ parku';

  @override
  String get potaLocation => 'Poloha';

  @override
  String get potaCountry => 'Země';

  @override
  String get potaFirstActivation => 'První aktivace';

  @override
  String get potaBand => 'Pásmo';

  @override
  String potaDistanceAway(String distance) {
    return '$distance daleko';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count aktivních spotů';
  }

  @override
  String get potaFilterAll => 'Vše';

  @override
  String get potaFilterBand => 'Pásmo';

  @override
  String get potaFilterMode => 'Režim';

  @override
  String get potaSortByTime => 'Nejnovější';

  @override
  String get potaSortByDistance => 'Nejbližší';

  @override
  String get profileLanguage => 'Jazyk';

  @override
  String get profileUnitSystem => 'Jednotky';

  @override
  String get profileUnitSystemAuto => 'Automaticky';

  @override
  String get profileUnitSystemMetric => 'Metrické';

  @override
  String get profileUnitSystemImperial => 'Imperiální';

  @override
  String get profileLanguageSystem => 'Systémový';

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
  String get onboardingSkip => 'Přeskočit';

  @override
  String get onboardingGetStarted => 'Začít';

  @override
  String get onboardingNext => 'Další';

  @override
  String get onboardingWelcomeTitle1 => 'Najděte převaděče ve svém okolí';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Objevte aktivní převaděče ve svém okolí s frekvencemi, tóny a technickými detaily.';

  @override
  String get onboardingWelcomeCredits => 'Data o převaděčích poskytuje IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtrujte podle režimu';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analog, DMR, C4FM, D-STAR — najděte ten správný převaděč okamžitě.';

  @override
  String get onboardingWelcomeTitle3 => 'POTA spoty v reálném čase';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Sledujte aktivace Parks on the Air s živými aktualizacemi, filtry pásem a vzdáleností.';

  @override
  String get onboardingWelcomeTitle4 => 'Uložte si oblíbené';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Mějte nejpoužívanější převaděče po ruce pro rychlý přístup.';

  @override
  String get onboardingLocationTitle => 'Poloha';

  @override
  String get onboardingLocationSubtitle =>
      'Vaši polohu používáme k zobrazení převaděčů a POTA aktivací ve vašem okolí.';

  @override
  String get onboardingLocationEnable => 'Povolit polohu';

  @override
  String get onboardingLocationSkip => 'Teď ne';

  @override
  String get onboardingDiscoveryTitle => 'Váš první převaděč';

  @override
  String get onboardingDiscoverySubtitle => 'Tady je to, co je ve vašem okolí!';

  @override
  String get onboardingDiscoveryViewDetails => 'Zobrazit podrobnosti';

  @override
  String get onboardingDiscoveryViewSpot => 'Zobrazit spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Prozkoumat mapu';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Prozkoumejte mapu a najděte převaděče a POTA aktivace';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Převaděč v okolí';

  @override
  String get onboardingDiscoveryLivePota => 'Živý POTA spot';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'V okolí nebyly nalezeny žádné převaděče';

  @override
  String get onboardingTelegramTitle => 'Přidejte se ke komunitě';

  @override
  String get onboardingTelegramSubtitle =>
      'Připojte se ke skupině HamQRG na Telegramu a získejte aktualizace, nahlašujte převaděče a poznávejte další radioamatéry.';

  @override
  String get onboardingTelegramJoin => 'Připojit se ke skupině na Telegramu';

  @override
  String get onboardingTelegramLater => 'Možná později';

  @override
  String get onboardingTelegramAlreadyMember => 'Už jsem členem';

  @override
  String get addRepeaterProfileTile => 'Navrhnout nový převaděč';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Nahlásit převaděč, který dosud není v seznamu';

  @override
  String get addRepeaterTitle => 'Nový převaděč';

  @override
  String get addRepeaterHeadline => 'Nahlásit chybějící převaděč';

  @override
  String get addRepeaterDescription =>
      'Vyplňte údaje o převaděči, který chcete přidat. Podání bude před zveřejněním zkontrolováno.';

  @override
  String get addRepeaterSectionRepeater => 'Údaje o převaděči';

  @override
  String get addRepeaterSectionAccesses => 'Přístupy';

  @override
  String get addRepeaterSectionLocation => 'Poloha';

  @override
  String get addRepeaterSectionNotes => 'Poznámky';

  @override
  String get addRepeaterName => 'Název';

  @override
  String get addRepeaterNameHint => 'Např. Sněžka';

  @override
  String get addRepeaterCallsign => 'Volací znak';

  @override
  String get addRepeaterCallsignHint => 'Např. OK0AB';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Zadejte alespoň název nebo volací znak';

  @override
  String get addRepeaterFrequency => 'Frekvence (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Např. 145.000 nebo 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frekvence je povinná';

  @override
  String get addRepeaterFrequencyInvalid => 'Neplatná frekvence';

  @override
  String get addRepeaterShift => 'Shift (MHz)';

  @override
  String get addRepeaterShiftHint => 'Např. -0.600 nebo -0,600';

  @override
  String get addRepeaterRegion => 'Kraj';

  @override
  String get addRepeaterRegionHint => 'Např. Středočeský kraj';

  @override
  String get addRepeaterProvinceCode => 'Okres';

  @override
  String get addRepeaterProvinceCodeHint => 'Např. PH';

  @override
  String get addRepeaterLocality => 'Obec';

  @override
  String get addRepeaterLocalityHint => 'Např. Příbram';

  @override
  String get addRepeaterLatitude => 'Zeměpisná šířka';

  @override
  String get addRepeaterLatitudeHint => 'Např. 49.7437';

  @override
  String get addRepeaterLongitude => 'Zeměpisná délka';

  @override
  String get addRepeaterLongitudeHint => 'Např. 13.3733';

  @override
  String get addRepeaterLocator => 'Lokátor';

  @override
  String get addRepeaterLocatorHint => 'Např. JN79DW';

  @override
  String get addRepeaterNotes => 'Další poznámky';

  @override
  String get addRepeaterNotesHint => 'Další informace o převaděči...';

  @override
  String get addRepeaterAddAccess => 'Přidat přístup';

  @override
  String get addRepeaterRemoveAccess => 'Odebrat';

  @override
  String get addRepeaterAccessMode => 'Režim';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Např. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Např. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'DCS kód';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Např. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'Např. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Např. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Např. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'Např. 1234';

  @override
  String get addRepeaterAccessNetworkName => 'Název sítě';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Např. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Poznámky k přístupu';

  @override
  String get addRepeaterAccessNotesHint =>
      'Poznámky specifické pro tento přístup...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Potvrzuji, že tyto informace jsou podle mého nejlepšího vědomí správné.';

  @override
  String get addRepeaterVerifiedTitle => 'Ověřené podání';

  @override
  String get addRepeaterVerifiedDescription =>
      'Vaše podání bude zkontrolováno týmem před zveřejněním v databázi.';

  @override
  String get addRepeaterSubmit => 'Odeslat';

  @override
  String get addRepeaterSuccess => 'Podání úspěšně odesláno!';

  @override
  String get addRepeaterError => 'Chyba při odesílání podání';

  @override
  String get addRepeaterAtLeastOneAccess => 'Přidejte alespoň jeden přístup';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Přístup $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'POTA spoty v reálném čase s mapou a detaily parků';

  @override
  String get changelog1017SubmitRepeater =>
      'Navrhněte nový převaděč přímo z aplikace';

  @override
  String get changelog1017MultiLanguage =>
      'Aplikace dostupná v angličtině, španělštině a francouzštině';

  @override
  String get changelog1017Onboarding => 'Nový zážitek při prvním spuštění';

  @override
  String get changelog1017ReportAnonymous => 'Hlášení dostupná bez registrace';

  @override
  String get changelog1020ClusterSpots =>
      'Cluster spoty v reálném čase: uvidíte, kdo poslouchá na převaděčích, s oznámeními a preferencemi';

  @override
  String get changelog1020DetailTabs =>
      'Stránka převaděče se záložkami Info, Cluster a Komunita';

  @override
  String get changelog1020TabletLayout =>
      'Rozvržení optimalizované pro tablety';

  @override
  String get changelog110Coverage =>
      'Mapa pokrytí převaděčů: zobrazte odhadovaný signál přímo na mapě (PRO)';

  @override
  String get changelog110Reachable =>
      'Co odsud dosáhnete: objevte převaděče, které ze své pozice zachytíte, se signálem a profilem terénu (PRO)';

  @override
  String get changelogTitle => 'Co je nového';

  @override
  String get changelogSubtitle => 'Zde je přehled novinek v této verzi';

  @override
  String get changelogCategoryAdded => 'Nové';

  @override
  String get changelogCategoryImproved => 'Vylepšeno';

  @override
  String get changelogCategoryFixed => 'Opraveno';

  @override
  String get changelogDismiss => 'Rozumím!';

  @override
  String get spotCreateTitle => 'Spottovat sebe';

  @override
  String get spotCreateOtherTitle => 'Spottovat OM';

  @override
  String get spotCreateDuration => 'Doba trvání';

  @override
  String get spotCreateAccess => 'Režim (volitelný)';

  @override
  String get spotCreateCallsign => 'Značka slyšeného OM';

  @override
  String get spotCreateCallsignHint => 'Např. OK1ABC';

  @override
  String get spotCreateConfirm => 'Potvrdit';

  @override
  String get spotCreateSuccessSelf => 'Spot vytvořen!';

  @override
  String get spotCreateSuccessOther => 'OM spottován!';

  @override
  String get spotActiveYou => 'Jste spottován';

  @override
  String get spotActiveClose => 'Zavřít spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'na $repeaterName';
  }

  @override
  String get spotActiveNone => 'Momentálně nikdo spottován';

  @override
  String get spotActiveCta => 'Buďte první!';

  @override
  String get spotActiveSection => 'Aktivní spoty';

  @override
  String get spotHistorySection => 'Historie spotů';

  @override
  String get spotListTitle => 'Nejnovější spoty';

  @override
  String get spotListViewAll => 'Zobrazit vše';

  @override
  String get spotListBadgeActive => 'Poslouchá';

  @override
  String get spotListBadgeClosed => 'Ukončeno';

  @override
  String get spotListBadgeReport => 'Nahlásit';

  @override
  String get spotListEmpty => 'Žádné spoty za posledních 24 hodin';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Nahlásil $callsign';
  }

  @override
  String get spotNotificationToggle => 'Oznámení clusteru';

  @override
  String get spotNotificationDisabled =>
      'Oznámení clusteru vypnuta v nastavení profilu';

  @override
  String get spotNotificationPerFavorite => 'Oznámení o spotech';

  @override
  String get spotPreviousClosed => 'Váš předchozí spot již není aktivní';

  @override
  String get spotErrorAuthRequired => 'Musíte být přihlášeni.';

  @override
  String get spotErrorCallsignRequired =>
      'Nastavte svou značku v profilu pro použití clusteru.';

  @override
  String get spotErrorInvalidDuration =>
      'Doba trvání musí být mezi 5 a 60 minutami.';

  @override
  String get spotErrorRepeaterNotFound => 'Převaděč nenalezen.';

  @override
  String get spotErrorInvalidAccess =>
      'Neplatný přístupový režim pro tento převaděč.';

  @override
  String get spotErrorSpotNotFound => 'Spot nenalezen.';

  @override
  String get spotErrorForbidden => 'Nemůžete zavřít spot, který není váš.';

  @override
  String get spotErrorAlreadyClosed => 'Spot je již uzavřen.';

  @override
  String get spotErrorGeneric =>
      'Chyba při vytváření spotu. Zkuste to prosím znovu.';

  @override
  String get spotAccessUnavailable => '(režim již není dostupný)';

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
  String get spotsFiltersTitle => 'Filtry';

  @override
  String get spotsFilterBand => 'Pásmo';

  @override
  String get spotsFilterMode => 'Mód';

  @override
  String get spotsFilterAll => 'Vše';

  @override
  String get spotsFiltersReset => 'Zrušit filtry';

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
  String get reachSheetError => 'Dosažitelné převaděče nelze vypočítat.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dosáhneš na $count převaděčů',
      few: 'Dosáhneš na $count převaděče',
      one: 'Dosáhneš na 1 převaděč',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'Z tvé polohy, seřazeno podle signálu';

  @override
  String get reachSheetEmpty => 'V okolí nejsou žádné dosažitelné převaděče.';

  @override
  String get reachBadgeTitle => 'Dosáhneš na něj odsud?';

  @override
  String get reachBadgeSubtitle =>
      'Zjisti, zda tě tento převaděč pokrývá a s jakým signálem';

  @override
  String get reachDiscoverCta => 'Objev to s PRO';

  @override
  String get reachReachable => 'Dosáhneš na něj';

  @override
  String get reachOutOfCoverage => 'Mimo pokrytí';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · klepni pro profil';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance odsud';
  }

  @override
  String get reachComputing => 'Výpočet pokrytí…';

  @override
  String get reachRepeaterFallback => 'Převaděč';

  @override
  String get reachMapButton => 'Na co dosáhneš?';

  @override
  String get reachUpsellTitle => 'Na co dosáhneš odsud? 📡';

  @override
  String get reachUpsellBody =>
      'Sleduj v reálném čase VŠECHNY převaděče, které ze své polohy zachytíš, s předpokládaným signálem a profilem terénu. Na kolik z nich opravdu dosáhneš odtud, kde právě jsi?';

  @override
  String get reachUpsellLater => 'Později';

  @override
  String get linkProfileObstructed => 'Překážka na trase (signál difrakcí)';

  @override
  String get linkProfileClear => 'Přímá viditelnost';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Profil terénu a přímá viditelnost · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Odemknout s PRO';

  @override
  String get proWelcomeTitle => 'Vítej v PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Odemkl jsi mapu pokrytí, převaděče, na které dosáhneš ze své polohy, a všechny funkce PRO. 📡';

  @override
  String get proWelcomeCta => 'Začít objevovat';

  @override
  String get commonCancel => 'Zrušit';

  @override
  String get commonDelete => 'Smazat';

  @override
  String get commonEdit => 'Upravit';

  @override
  String get commonOpenSettings => 'Otevřít nastavení';

  @override
  String get commonFieldRequired => 'Povinné pole';

  @override
  String get fieldName => 'Jméno';

  @override
  String get fieldAddress => 'Adresa';

  @override
  String get fieldCity => 'Město';

  @override
  String get fieldDescription => 'Popis';

  @override
  String get fieldYear => 'Rok';

  @override
  String get fieldSelectDateHint => 'Vyberte datum';

  @override
  String get validationInvalidYear => 'Vyberte platný rok';

  @override
  String get validationPasswordMinLength => 'Heslo musí mít alespoň 6 znaků';

  @override
  String get permissionsMissingTitle => 'Chybí oprávnění!';

  @override
  String get imageUploadError => 'Chyba při nahrávání obrázku';

  @override
  String get uploadImageLabel => 'Nahrát obrázek';

  @override
  String get sourceGallery => 'Galerie';

  @override
  String get sourceCamera => 'Fotoaparát';

  @override
  String get changePasswordTitle => 'Změnit heslo';

  @override
  String get fieldNewPassword => 'Nové heslo';

  @override
  String get fieldConfirmNewPassword => 'Potvrďte nové heslo';

  @override
  String get validationPasswordsNoMatch => 'Hesla se neshodují';

  @override
  String get passwordChangedSuccess => 'Heslo úspěšně změněno';

  @override
  String errorWithMessage(String message) {
    return 'Chyba: $message';
  }

  @override
  String get updateRequiredTitle => 'Vyžadována aktualizace';

  @override
  String get updateRequiredAction => 'Aktualizovat nyní';

  @override
  String get yearPickerTitle => 'Vyberte rok';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Komunita';

  @override
  String get updateRequiredBody =>
      'Je k dispozici nová verze aplikace. Aktualizujte ji, abyste ji mohli dále používat.';

  @override
  String get errorOpeningStore => 'Chyba při otevírání obchodu';

  @override
  String get deleteConfirmTitle => 'Potvrdit smazání';

  @override
  String get deleteConfirmContent => 'Opravdu chcete smazat?';

  @override
  String get cameraPermissionRationale =>
      'Chcete-li pořídit fotku, povolte přístup k fotoaparátu v nastavení.';

  @override
  String get coverageSearchHint => 'Vyhledejte místo nebo vložte souřadnice';

  @override
  String get coverageSearchRecentTitle => 'Nedávná hledání';

  @override
  String get coverageSearchNoResults => 'Žádné místo nenalezeno';

  @override
  String get coverageSearchTip =>
      'Můžete vložit souřadnice (46.4879, 11.8123) nebo dlouze podržet na mapě';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Souřadnice mimo rozsah: šířka ±90, délka ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Bez připojení: hledání míst vyžaduje síť';

  @override
  String get coverageSearchErrorFailed => 'Hledání selhalo. Zkuste to znovu.';

  @override
  String get coverageSearchClearPoint => 'Odebrat bod';

  @override
  String get coverageSearchPointSemantics => 'Vybraný bod hledání';

  @override
  String get coverageBreadthTitle => 'Rozsah hledání';

  @override
  String get coverageBreadthQuick => 'Rychlé';

  @override
  String get coverageBreadthMedium => 'Střední';

  @override
  String get coverageBreadthExtended => 'Rozšířené';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · nejrychlejší odpověď';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · vyvážené';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · dál, delší čekání';
  }

  @override
  String get coverageResultSubtitle => 'Z vybraného bodu';

  @override
  String get coverageResultEmptyNoReachable =>
      'Z tohoto bodu není dosažitelný žádný převaděč';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'V této oblasti není evidován žádný převaděč';

  @override
  String get coverageResultClearFilters => 'Zrušit filtry';

  @override
  String get coverageResultError => 'Výpočet selhal';

  @override
  String get coverageResultComputing => 'Výpočet příjmu…';

  @override
  String get coverageResultCancel => 'Zrušit';

  @override
  String coverageResultCount(int count) {
    return 'Dosažitelné převaděče: $count';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown z $total dosažitelných';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    return 'Skryto filtry: $count';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Co dosáhnete z $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Každý převaděč dosažitelný z toho místa, s předpovězeným signálem a vzdáleností — ještě než vyrazíte.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Jakýkoli bod na planetě';

  @override
  String get coverageTeaserBenefitOffline => 'K nahlédnutí bez sítě, v terénu';

  @override
  String get coverageTeaserBenefitSave =>
      'Uložíte stanoviště a najdete ho znovu';

  @override
  String get stationSaveCta => 'Uložit stanoviště';

  @override
  String get stationSaveTitle => 'Název stanoviště';

  @override
  String get stationRename => 'Přejmenovat';

  @override
  String get stationDelete => 'Smazat';

  @override
  String get stationRefresh => 'Aktualizovat';

  @override
  String get stationRefreshAll => 'Aktualizovat vše';

  @override
  String get stationOfflineNotice => 'Data uložená v zařízení';

  @override
  String get stationStaleNotice => 'Data nemusí být aktuální';

  @override
  String get stationMissingEntry => 'Data nejsou offline k dispozici';

  @override
  String get stationDuplicateTitle => 'Bod je již uložen';

  @override
  String stationDuplicateBody(String distance) {
    return 'Do $distance už existuje stanoviště. Aktualizovat, nebo vytvořit samostatné?';
  }

  @override
  String get stationDuplicateUpdate => 'Aktualizovat';

  @override
  String get stationDuplicateCreate => 'Vytvořit samostatné';

  @override
  String get stationSaveFailed => 'Uložení selhalo: nedostatek místa';

  @override
  String get stationSavedCta => 'Stanoviště uloženo';

  @override
  String get stationRemoveCta => 'Odebrat';

  @override
  String get stationRemoveTitle => 'Odebrat stanoviště?';

  @override
  String stationRemoveBody(String name) {
    return '„$name“ a jeho offline data budou z tohoto zařízení smazána.';
  }

  @override
  String get stationRemovedSnack => 'Stanoviště odebráno';

  @override
  String get stationSaveError => 'Uložení se nezdařilo. Zkuste to znovu.';

  @override
  String get stationsTitle => 'Moje stanoviště';

  @override
  String get stationsProfileSubtitle =>
      'Body, které jsi vyhodnotil, dostupné i bez sítě';

  @override
  String get stationsEmptyTitle => 'Zatím žádná uložená stanoviště';

  @override
  String get stationsEmptyBody =>
      'Stanoviště je bod na mapě, u kterého už máš spočítané pokrytí, uložený tak, abys ho našel i bez sítě.';

  @override
  String get stationsEmptyStep1 =>
      'Vyber bod na mapě: podrž ho, najdi ho podle názvu nebo vlož souřadnice.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Klepni na „$action“ a uvidíš, na které převaděče odtud dosáhneš.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Ulož bod: najdeš ho tady, i v terénu bez sítě.';

  @override
  String get stationsGoToMap => 'Přejít na mapu';

  @override
  String get stationsRefreshDone => 'Aktualizace dokončena';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Aktualizováno $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Aktualizace za $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Aktualizace za $minutes min';
  }

  @override
  String get spotsUpdating => 'Aktualizuje se…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Automatická aktualizace každých $seconds sekund';
  }

  @override
  String get spotsManualRefreshHint => 'Klepnutím obnovíte';

  @override
  String coverageResultScope(String km, int count) {
    return 'do $km · vyhodnoceno: $count';
  }

  @override
  String get coverageResultRecalculating => 'Přepočítávání';

  @override
  String get offlineBannerMessage => 'Jste offline: prohlížíte uložená data';

  @override
  String get offlineMapsTitle => 'Offline mapy';

  @override
  String get offlineMapsEntrySubtitle =>
      'Stáhněte si mapy pro použití bez připojení';

  @override
  String get offlineMapsEmpty =>
      'Žádné stažené oblasti. Stáhněte si oblast, abyste mapu viděli i bez připojení.';

  @override
  String get offlineMapsAddRegion => 'Stáhnout oblast';

  @override
  String get offlineMapsRegionNameLabel => 'Název oblasti';

  @override
  String get offlineMapsRegionNameHint => 'Např. Domov, Chata, Aktivace SOTA';

  @override
  String get offlineMapsRadiusLabel => 'Poloměr';

  @override
  String get offlineMapsDownload => 'Stáhnout';

  @override
  String get offlineMapsDownloadingStyle => 'Stahování stylu mapy…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Stahování map… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Odhadovaná velikost: $size';
  }

  @override
  String get offlineMapsDownloadError =>
      'Stahování se nezdařilo. Zkuste to znovu.';

  @override
  String get offlineMapsDeleteError =>
      'Odstranění se nezdařilo. Zkuste to znovu.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Odstranit oblast?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '„$name“ už nebude offline k dispozici.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Odstranit';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Poloměr $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Nedokončené stahování';

  @override
  String get offlineMapsResume => 'Pokračovat';

  @override
  String get offlineMapsCenterInfo =>
      'Oblast bude vystředěna na vaši aktuální polohu.';

  @override
  String get dashboardOfflineTitle => 'Jste offline';

  @override
  String get dashboardOfflineMessage =>
      'Pro tuto oblast nejsou uložena žádná data. Vaše uložená stanoviště a stažené mapy zůstávají k dispozici.';

  @override
  String get offlineMapsCenterMine => 'Moje poloha';

  @override
  String get offlineMapsCenterSearch => 'Hledat místo';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Vyhledejte město nebo místo: oblast bude vystředěna tam.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Střed: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Offline režim: převaděče, oblíbené, profil, pokrytí a dosažitelnost dostupné i bez sítě (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Offline mapy: stáhněte si oblast, kde jste, nebo libovolné místo a používejte ji bez připojení (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Hledání pokrytí z libovolného bodu: vyhledejte místo, vložte souřadnice nebo podržte prst na mapě a zjistěte, co odtud dosáhnete';

  @override
  String get changelog120SavedStations =>
      'Moje stanoviště: uložte si body, které vás zajímají, a prohlížejte je i offline (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'Spoty SOTA a POTA se obnovují samy každou minutu, s barevnými odznaky podle módu (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Bez připojení se aplikace spustí okamžitě, ukáže, co je k dispozici, a vypne akce vyžadující síť';

  @override
  String get changelog130ImperialUnits =>
      'Míle a stopy: aplikace nyní respektuje jednotky vašeho zařízení a v Nastavení si můžete systém zvolit ručně';

  @override
  String get profileUnitSystemAutoShort => 'Auto';
}
