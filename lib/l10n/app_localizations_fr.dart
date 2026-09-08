// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get proSectionTitle => 'Abonnement';

  @override
  String get proCardUpgradeTitle => 'Découvrez ce que vous atteignez';

  @override
  String get proCardUpgradeSubtitle =>
      'Couverture, relais et cartes hors ligne';

  @override
  String get proCardActiveTitle => 'HamQRG Pro actif';

  @override
  String get proCardActiveSubtitle => 'Merci pour votre soutien !';

  @override
  String proPriceFromMonth(String price) {
    return 'À partir de $price par mois · Annulable à tout moment';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Essai gratuit, puis $price par mois · Annulable à tout moment';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price une seule fois · Pour toujours';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'À partir de $price par mois · $total facturés d\'avance · Annulable à tout moment';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Essai gratuit, puis $price par mois · $total facturés d\'avance · Annulable à tout moment';
  }

  @override
  String get proRestoreSuccess => 'Achats restaurés : HamQRG Pro est actif';

  @override
  String get proRestoreNone => 'Aucun achat à restaurer';

  @override
  String get proManageSubscription => 'Gérer l\'abonnement';

  @override
  String get proLinkAccountTitle => 'Associez votre compte';

  @override
  String get proLinkAccountBody =>
      'Associez HamQRG Pro à un compte pour le conserver sur tous vos appareils, même après une réinstallation.';

  @override
  String get stationsShowcaseTitle => 'Vos emplacements, même sans réseau';

  @override
  String get stationsShowcaseBody =>
      'Enregistrez la maison, le refuge, le site d\'activation : ce que vous atteignez reste là même sans réseau.';

  @override
  String get offlineMapsUpsellTitle =>
      'La carte reste dans votre téléphone 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Téléchargez les zones qu\'il vous faut et ouvrez-les là où il n\'y a pas de réseau : sur une crête, dans un tunnel, à l\'étranger sans données.';

  @override
  String get offlineMapsBenefitRegions =>
      'Vous choisissez les zones à télécharger';

  @override
  String get reachUpsellBenefitSignal => 'Signal prévu pour chaque relais';

  @override
  String get reachUpsellBenefitTerrain =>
      'Profil du terrain entre vous et le relais';

  @override
  String get proRestoreCta => 'Restaurer les achats';

  @override
  String get error => 'Erreur';

  @override
  String get error_message => 'Une erreur est survenue lors du chargement';

  @override
  String get error_message_retry =>
      'Une erreur est survenue lors du chargement. Réessayez plus tard';

  @override
  String get retry => 'Réessayer';

  @override
  String get back => 'Retour';

  @override
  String get loading => 'Chargement';

  @override
  String get details => 'Détails';

  @override
  String pages_number(Object number) {
    return '$number pages à explorer';
  }

  @override
  String get january => 'Janvier';

  @override
  String get february => 'Février';

  @override
  String get march => 'Mars';

  @override
  String get april => 'Avril';

  @override
  String get may => 'Mai';

  @override
  String get june => 'Juin';

  @override
  String get july => 'Juillet';

  @override
  String get august => 'Août';

  @override
  String get september => 'Septembre';

  @override
  String get october => 'Octobre';

  @override
  String get november => 'Novembre';

  @override
  String get december => 'Décembre';

  @override
  String get logout => 'Déconnexion';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Paramètres';

  @override
  String get contact_us => 'Contactez-nous';

  @override
  String get error_opening_email =>
      'Une erreur est survenue lors de l\'ouverture de l\'e-mail';

  @override
  String get register_now => 'Inscrivez-vous maintenant';

  @override
  String get tracking_permission_title => 'Soutenez l\'appli';

  @override
  String get tracking_permission_message =>
      'Pour améliorer votre expérience et vous montrer du contenu plus pertinent, aidez-nous à maintenir l\'appli gratuite.\n\nAppuyez sur Autoriser pour nous soutenir.';

  @override
  String get tracking_permission_next => 'Suivant';

  @override
  String get skip => 'Passer';

  @override
  String get done => 'Terminé';

  @override
  String get next => 'Suivant';

  @override
  String get joinCommunityTitle => 'Rejoignez notre Communauté !';

  @override
  String get joinCommunityDescription =>
      'Découvrez les avantages de rejoindre la communauté Telegram :';

  @override
  String get benefitSupportMembers => 'Soutien des membres';

  @override
  String get benefitSuggestFeatures => 'Proposez de nouvelles fonctionnalités';

  @override
  String get benefitContactDevelopers => 'Contact avec les développeurs';

  @override
  String get benefitExclusivePreviews => 'Aperçus et bêtas exclusifs';

  @override
  String get benefitActiveCommunity => 'Communauté active';

  @override
  String get joinNowButton => 'Rejoindre maintenant !';

  @override
  String get alreadyMemberButton => 'Je suis déjà membre';

  @override
  String get laterButton => 'Plus tard';

  @override
  String get errorOpenTelegram => 'Erreur lors de l\'ouverture de Telegram';

  @override
  String get disclaimerTitle => 'Source des données';

  @override
  String get disclaimerDescription =>
      'Les données des relais de cette appli proviennent de IZ8WNH.\n\nPour des informations supplémentaires, télécharger des fichiers CSV pour programmer les radios ou consulter des données non disponibles dans cette appli, visitez le site officiel.';

  @override
  String get disclaimerVisitSite => 'Visiter iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Compris';

  @override
  String get errorOpenDisclaimerSite => 'Erreur lors de l\'ouverture du site';

  @override
  String get repeatersMapTitle => 'Carte des relais';

  @override
  String get repeatersListTitle => 'Liste des relais';

  @override
  String get repeatersMapLoading => 'Chargement de la carte des relais…';

  @override
  String get repeatersMapGenericError => 'Impossible de charger les relais.';

  @override
  String get repeatersMapEmpty => 'Aucun relais trouvé près de vous.';

  @override
  String get repeatersSearchHint =>
      'Rechercher par nom, indicatif ou fréquence MHz…';

  @override
  String get repeatersSearchEmpty => 'Aucun relais trouvé.';

  @override
  String get repeatersSortDistance => 'Distance';

  @override
  String get repeatersSortLikes => 'J\'aime';

  @override
  String get repeatersSortFrequency => 'Fréquence';

  @override
  String repeatersNearbyCount(int count) {
    return '$count relais à proximité';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count résultats';
  }

  @override
  String get repeatersMapRetry => 'Réessayer';

  @override
  String get repeatersMapOpenSettings => 'Ouvrir les paramètres';

  @override
  String get repeatersMapPermissionMessage =>
      'Autorisez l\'accès à la localisation pour afficher les relais près de vous.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Permission de localisation refusée définitivement. Activez-la dans les paramètres système.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Activez les services de localisation pour trouver les relais à proximité.';

  @override
  String repeatersMapFound(int count) {
    return '$count relais trouvés';
  }

  @override
  String get repeaterMode => 'Mode';

  @override
  String get repeaterModeAnalog => 'Analogique';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Tous les modes';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Fréquence';

  @override
  String get repeaterShift => 'Décalage';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Position';

  @override
  String get repeaterDistance => 'Distance';

  @override
  String get repeaterViewFullDetails => 'Voir tous les détails';

  @override
  String get repeatersMapReturnToLocation => 'Retour à ma position';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count relais à cet emplacement';
  }

  @override
  String get profileUnlockFeatures => 'Débloquez toutes les fonctionnalités';

  @override
  String get profileUnlockFeaturesDescription =>
      'Inscrivez-vous pour utiliser les avis, sauvegarder vos favoris et accéder aux statistiques détaillées.';

  @override
  String get profileSignUpOrLogin => 'S\'inscrire ou Se connecter';

  @override
  String get profileErrorOpeningEmail =>
      'Erreur lors de l\'ouverture de l\'e-mail';

  @override
  String get profileJoinTelegramCommunity => 'Rejoindre la communauté Telegram';

  @override
  String get profileWelcomeTitle => 'Bienvenue sur HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Rejoignez notre communauté de radioamateurs en Italie.';

  @override
  String get profileEditProfile => 'Modifier le Profil';

  @override
  String get profileChangePhoto => 'Changer la Photo';

  @override
  String get profileFirstName => 'Prénom';

  @override
  String get profileLastName => 'Nom';

  @override
  String get profileCallsign => 'Indicatif';

  @override
  String get profileRestartIdentificationTitle =>
      'Besoin de changer votre statut ? Vous pouvez redémarrer le processus d\'identification pour passer d\'Opérateur Autorisé à Écouteur SWL.';

  @override
  String get profileRestartIdentificationButton =>
      'Redémarrer le Processus d\'Identification';

  @override
  String get profileSaveChanges => 'Enregistrer les Modifications';

  @override
  String get profileDangerZone => 'Zone Dangereuse';

  @override
  String get profileDeleteAccount => 'Supprimer le Compte';

  @override
  String get profileDeleteAccountConfirmTitle => 'Supprimer le Compte';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible.';

  @override
  String get profileDeleteAccountCancel => 'Annuler';

  @override
  String get profileDeleteAccountConfirm => 'Supprimer';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'Version $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Communauté et Support';

  @override
  String get profileSectionSupport => 'Support';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Version : $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Version $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Erreur : $error';
  }

  @override
  String get authJoinTitle => 'Rejoignez HamQRG';

  @override
  String get authUnlockFeatures =>
      'Connectez-vous pour débloquer toutes les fonctionnalités !';

  @override
  String get authWhatYouGet => 'Ce que vous obtiendrez :';

  @override
  String get authBenefitStatsTitle => 'Statistiques détaillées';

  @override
  String get authBenefitStatsDescription =>
      'Suivez vos progrès et améliorez-vous';

  @override
  String get authBenefitQuizTitle => 'Différents modes de quiz';

  @override
  String get authBenefitQuizDescription =>
      'Entraînez-vous en mode marathon, par thèmes et plus.';

  @override
  String get authBenefitSyncTitle => 'Synchronisation';

  @override
  String get authBenefitSyncDescription =>
      'Accédez depuis n\'importe quel appareil';

  @override
  String get authOrSignInWithEmail => 'Ou connectez-vous par e-mail';

  @override
  String get authEnterEmail => 'Entrez l\'e-mail';

  @override
  String get authEnterPassword => 'Entrez le mot de passe';

  @override
  String get authForgotPassword => 'Mot de passe oublié ?';

  @override
  String get authSignIn => 'Se connecter';

  @override
  String get authSignUp => 'S\'inscrire';

  @override
  String get authPasswordLengthError => 'Le mot de passe doit être plus long';

  @override
  String get authDontHaveAccount => 'Pas de compte ? Inscrivez-vous';

  @override
  String get authHaveAccount => 'Déjà un compte ? Connectez-vous';

  @override
  String get authBackToSignIn => 'Retour à la connexion';

  @override
  String get authUnexpectedError => 'Erreur d\'authentification : ';

  @override
  String get authValidEmailError => 'Entrez un e-mail valide';

  @override
  String get authSendPasswordReset => 'Envoyer la réinitialisation';

  @override
  String get authPasswordResetSent => 'Réinitialisation envoyée';

  @override
  String get authVerifyEmailMessage =>
      'Vérifiez votre e-mail pour compléter l\'inscription, consultez votre boîte de réception.';

  @override
  String get authInvalidCredentials => 'E-mail ou mot de passe incorrect';

  @override
  String get authEmailNotConfirmed =>
      'Vérifiez votre e-mail pour vous connecter';

  @override
  String get authFirstName => 'Prénom';

  @override
  String get authFirstNameRequired => 'Le prénom est obligatoire';

  @override
  String get authLastName => 'Nom';

  @override
  String get authLastNameRequired => 'Le nom est obligatoire';

  @override
  String get authContinueAsGuest => 'Continuer en tant qu\'invité';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Découvrez les relais autour de vous';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Accès rapide';

  @override
  String get homeRepeaterList => 'Liste des relais';

  @override
  String get homeMyFavorites => 'Mes favoris';

  @override
  String get homeNearby => 'Près de vous';

  @override
  String get homeViewAll => 'Voir tout';

  @override
  String get dashboardTabRepeaters => 'Relais';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Aucun relais à proximité';

  @override
  String get dashboardViewAllRepeaters => 'Voir tous les relais';

  @override
  String get dashboardViewAllPotaSpots => 'Voir tous les spots POTA';

  @override
  String homeStations(int count) {
    return '$count stations';
  }

  @override
  String homeSaved(int count) {
    return '$count enregistrés';
  }

  @override
  String get homeActive => 'Actif';

  @override
  String get homeIdle => 'Inactif';

  @override
  String get homeNavHome => 'Accueil';

  @override
  String get homeNavList => 'Liste';

  @override
  String get homeNavFavorites => 'Favoris';

  @override
  String get homeNavMap => 'Carte';

  @override
  String get homeNavProfile => 'Profil';

  @override
  String get favoritesTitle => 'Mes favoris';

  @override
  String get favoritesSearchHint => 'Rechercher des relais enregistrés...';

  @override
  String get favoritesFilterAllSaved => 'Tous enregistrés';

  @override
  String get favoritesEmpty => 'Aucun relais enregistré';

  @override
  String get favoritesEmptyDescription =>
      'Ajoutez des relais aux favoris pour les voir ici';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Affichage de $showing sur $total stations favorites';
  }

  @override
  String get favoritesRemove => 'Retirer des favoris';

  @override
  String get favoritesAdd => 'Ajouter aux favoris';

  @override
  String get repeaterDetailSave => 'Enregistrer';

  @override
  String get repeaterDetailShare => 'Partager';

  @override
  String get repeaterDetailReport => 'Signaler';

  @override
  String get repeaterDetailTotalLikes => 'J\'aime totaux';

  @override
  String get repeaterDetailReports1Yr => 'Signalements (1 an)';

  @override
  String get repeaterDetailHealthScore => 'Score de santé';

  @override
  String get repeaterDetailExcellent => 'Excellent';

  @override
  String get repeaterDetailGood => 'Bon';

  @override
  String get repeaterDetailFair => 'Moyen';

  @override
  String get repeaterDetailToVerify => 'À vérifier';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Score calculé à partir de $count signalements négatifs au cours de la dernière année';
  }

  @override
  String get repeaterDetailLastLike => 'Dernier j\'aime';

  @override
  String get repeaterDetailLastDownReport => 'Dernier signalement négatif';

  @override
  String get repeaterDetailTechnicalData => 'Données techniques';

  @override
  String get repeaterDetailFrequency => 'Fréquence';

  @override
  String get repeaterDetailShift => 'Décalage';

  @override
  String get repeaterDetailSubtone => 'Sous-ton (SQL)';

  @override
  String get repeaterDetailMode => 'Mode';

  @override
  String get repeaterDetailLocation => 'Position';

  @override
  String repeaterDetailAway(String distance) {
    return 'à $distance';
  }

  @override
  String get repeaterDetailCommunityReports => 'Signalements de la communauté';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Mettre à jour le statut et le feedback';

  @override
  String get repeaterDetailEquipment => 'Équipement';

  @override
  String get repeaterDetailEquipmentRequired => 'Équipement *';

  @override
  String get repeaterDetailAccessModes => 'Modes d\'accès';

  @override
  String get repeaterDetailNetwork => 'Réseau';

  @override
  String get repeaterDetailLocationField => 'Lieu';

  @override
  String get repeaterDetailLocationRequired => 'Lieu *';

  @override
  String get repeaterDetailComment => 'Commentaire';

  @override
  String get repeaterDetailCommentOptional => 'Commentaire (Optionnel)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Qualité du signal, rapport audio ou commentaires généraux...';

  @override
  String get repeaterDetailReportDown => 'Signaler un problème';

  @override
  String get repeaterDetailCheckinLike => 'Check-in et j\'aime';

  @override
  String get repeaterDetailYourFeedback => 'Votre feedback';

  @override
  String get repeaterDetailPostedJustNow => 'Publié à l\'instant';

  @override
  String get repeaterDetailDeleteEntry => 'Supprimer l\'entrée';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Voir les $count signalements';
  }

  @override
  String get repeaterDetailStationPortable => 'Portable';

  @override
  String get repeaterDetailStationMobile => 'Mobile';

  @override
  String get repeaterDetailStationFixed => 'Fixe';

  @override
  String get repeaterDetailLike => 'J\'aime';

  @override
  String get repeaterDetailReportLabel => 'Signalement';

  @override
  String get repeaterDetailSaved => 'Enregistré';

  @override
  String get repeaterDetailShareMessage => 'Découvrez ce relais sur HamQRG !';

  @override
  String get repeaterDetailReportDescription =>
      'La fonctionnalité de signalement sera bientôt disponible. Vous pourrez signaler des informations incorrectes ou des problèmes avec ce relais.';

  @override
  String get commonClose => 'Fermer';

  @override
  String get favorite => 'Favori';

  @override
  String get accessConfiguration => 'Configuration d\'accès';

  @override
  String get noAccessConfiguration => 'Aucune configuration disponible';

  @override
  String get repeaterDetailAddFeedback => 'Ajouter un feedback';

  @override
  String get repeaterDetailOthersReports =>
      'Signalements d\'autres utilisateurs';

  @override
  String get repeaterDetailRemove => 'Supprimer';

  @override
  String get repeaterDetailSelectAccess => 'Sélectionner l\'accès';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'Vous devez être à moins de $distance du relais pour envoyer un feedback.';
  }

  @override
  String get repeaterDetailInteractive => 'Interactif';

  @override
  String get repeaterDetailLogYourSignal => 'Enregistrez votre signal';

  @override
  String get repeaterDetailUsedEquipment => 'Équipement utilisé';

  @override
  String get repeaterDetailYourLocation => 'Votre position';

  @override
  String get repeaterDetailLocationPlaceholder => 'Où étiez-vous ? (ex. Paris)';

  @override
  String get repeaterDetailLocationSelectHint =>
      'Sélectionnez un lieu parmi les suggestions';

  @override
  String get feedbackDistanceConfirmTitle => 'Confirmer l\'envoi';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'Le lieu sélectionné est à $distance du relais. Confirmez-vous vouloir envoyer ce feedback sous votre responsabilité ?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Confirmer';

  @override
  String get feedbackDistanceConfirmCancel => 'Annuler';

  @override
  String get repeaterDetailSelectAccessInstance =>
      'Sélectionner l\'instance d\'accès';

  @override
  String get repeaterDetailSignalObservations => 'Observations du signal';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Comment était la qualité audio ?';

  @override
  String get repeaterDetailSendLike => 'Envoyer J\'aime';

  @override
  String get repeaterDetailReportIssue => 'Signaler un Problème';

  @override
  String get repeaterDetailRecentActivity => 'Activité récente';

  @override
  String get reportIssueTitle => 'Signalement';

  @override
  String get reportIssueHeadline =>
      'Aidez-nous à maintenir des données précises';

  @override
  String get reportIssueDescription =>
      'Avez-vous trouvé quelque chose d\'incorrect ou de manquant dans ce relais ? Dites-nous ce qui doit être modifié et nous le vérifierons.';

  @override
  String get reportIssueWhatToCorrect =>
      'Que souhaitez-vous corriger ou ajouter ?';

  @override
  String get reportIssuePlaceholder =>
      'Ex. Le ton CTCSS a changé à 88.5Hz, ou la position est légèrement plus au nord, le gestionnaire est...';

  @override
  String get reportIssueVerifiedTitle => 'Soumissions Vérifiées';

  @override
  String get reportIssueVerifiedDescription =>
      'Votre signalement sera examiné par le coordinateur régional avant la mise à jour de la base de données publique. Merci pour votre contribution à la communauté.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Je confirme que ces informations sont correctes selon mon observation.';

  @override
  String get reportIssueSubmit => 'Envoyer';

  @override
  String get reportIssueMinChars => 'Minimum 10 caractères requis';

  @override
  String get reportIssueMaxChars => 'Maximum 2000 caractères';

  @override
  String get reportIssueSuccess => 'Signalement envoyé avec succès';

  @override
  String get reportIssueError => 'Erreur lors de l\'envoi du signalement';

  @override
  String get registrationPromptTitle => 'Débloquez tout le potentiel';

  @override
  String get registrationPromptDescription =>
      'Rejoignez la communauté italienne de radioamateurs et passez au niveau supérieur.';

  @override
  String get registrationBenefitInteractTitle => 'Interagissez';

  @override
  String get registrationBenefitInteractDescription =>
      'Évaluez les relais et laissez des commentaires pour les autres.';

  @override
  String get registrationBenefitFavoritesTitle => 'Favoris';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Enregistrez vos fréquences et relais les plus utilisés.';

  @override
  String get registrationBenefitLogbookTitle => 'Logbook';

  @override
  String get registrationBenefitLogbookDescription =>
      'Gardez une trace de vos QSOs et maintenez un historique personnel.';

  @override
  String get registrationSignInApple => 'Se connecter avec Apple';

  @override
  String get registrationSignInGoogle => 'Se connecter avec Google';

  @override
  String get registrationPromptFooter =>
      'Inscription gratuite. Aucune licence requise pour consulter les données publiques.';

  @override
  String get postLoginOnboardingWelcome => 'Bienvenue sur';

  @override
  String get postLoginOnboardingQuestion =>
      'Êtes-vous un radioamateur licencié ?';

  @override
  String get postLoginOnboardingHelpText =>
      'Cela nous aide à personnaliser votre expérience et à vous montrer les bonnes fréquences.';

  @override
  String get postLoginOnboardingYesLicensed => 'Oui, je le suis';

  @override
  String get postLoginOnboardingNoListener => 'Non, je suis juste un auditeur';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identifiez-vous';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Entrez votre indicatif officiel pour accéder aux fonctionnalités réseau.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Indicatif (Callsign)';

  @override
  String get postLoginOnboardingCallsignHint => 'Ex. F4XYZ';

  @override
  String get postLoginOnboardingComplete => 'Compléter le profil';

  @override
  String get postLoginOnboardingBack => 'Retour';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Vous pouvez le modifier plus tard dans les paramètres.';

  @override
  String get postLoginOnboardingSwlTitle => 'Indicatif SWL';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Avez-vous un indicatif SWL officiel ?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'Les indicatifs d\'écoute d\'ondes courtes aident à vous identifier dans la communauté mondiale de surveillance.';

  @override
  String get postLoginOnboardingSwlYes => 'Oui, j\'en ai un';

  @override
  String get postLoginOnboardingSwlNo => 'Non, je n\'en ai pas';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Entrer l\'indicatif';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Ex. F1-12345-SWL';

  @override
  String get timeAgoJustNow => 'à l\'instant';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a $count minutes',
      one: 'il y a 1 minute',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a $count heures',
      one: 'il y a 1 heure',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a $count jours',
      one: 'il y a 1 jour',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a $count semaines',
      one: 'il y a 1 semaine',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a $count mois',
      one: 'il y a 1 mois',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a $count ans',
      one: 'il y a 1 an',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Thème';

  @override
  String get profileThemeModeSystem => 'Système';

  @override
  String get profileThemeModeLight => 'Clair';

  @override
  String get profileThemeModeDark => 'Sombre';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Soyez le premier à laisser un feedback sur ce relais !';

  @override
  String get repeaterDetailDistanceFromYou => 'Distance depuis vous';

  @override
  String get repeaterDistanceMapNoLocation => 'Position non disponible';

  @override
  String get repeaterDetailNever => 'Jamais';

  @override
  String get repeaterDetailInfo => 'Informations';

  @override
  String get repeaterDetailSource => 'Source';

  @override
  String get repeaterDetailManager => 'Gestionnaire';

  @override
  String get repeaterDetailSuggestManager =>
      'Vous connaissez le gestionnaire du relais ? Signalez-le !';

  @override
  String get repeaterDetailViewFeedbackMap => 'Carte des feedbacks';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Visualisez où les j\'aime et signalements ont été enregistrés';

  @override
  String get repeaterDetailAltimetricProfile => 'Profil altimétrique';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Visualisez le profil du terrain entre vous et le relais';

  @override
  String get repeaterCoverageTitle => 'Couverture';

  @override
  String get repeaterCoverageCardTitle => 'Carte de couverture';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Estime le signal du relais sur le territoire';

  @override
  String get repeaterCoverageLoading => 'Calcul de la couverture…';

  @override
  String get repeaterCoverageError => 'Impossible de calculer la couverture';

  @override
  String get repeaterCoverageRetry => 'Réessayer';

  @override
  String get repeaterCoverageLegendTitle => 'Signal estimé (dBm)';

  @override
  String get repeaterCoverageCta => 'Voir la couverture';

  @override
  String get repeaterDetailLosClear =>
      'Ligne de vue dégagée entre vous et le relais';

  @override
  String get repeaterDetailLosObstructed =>
      'Ligne de vue obstruée par le terrain';

  @override
  String get repeaterDetailTerrainProfile => 'Profil du terrain';

  @override
  String get repeaterDetailLineOfSight => 'Ligne de vue';

  @override
  String get repeaterDetailTotalDistance => 'Distance';

  @override
  String get repeaterDetailRepeaterElevation => 'Altitude du relais';

  @override
  String get repeaterDetailYourElevation => 'Votre altitude';

  @override
  String get repeaterDetailYou => 'Vous';

  @override
  String get repeaterDetailRepeaterLabel => 'Relais';

  @override
  String get repeaterDetailFunFacts => 'Le saviez-vous ?';

  @override
  String get repeaterDetailWavelength => 'Longueur d\'onde';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'La longueur d\'onde de ce relais est $value';
  }

  @override
  String get repeaterDetailOscillations => 'Oscillations par seconde';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Le signal oscille $value fois par seconde';
  }

  @override
  String get repeaterDetailPropagationTime => 'Temps de propagation';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Votre signal met $value pour atteindre le relais';
  }

  @override
  String get repeaterDetailWaveCycles => 'Cycles d\'onde en transit';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'L\'onde effectue $value cycles complets en transit';
  }

  @override
  String get userReportsTitle => 'Mes activités';

  @override
  String get userReportsTabReports => 'Signalements';

  @override
  String get userReportsTabSubmissions => 'Nouveaux relais';

  @override
  String get userReportsFilterAll => 'Tous';

  @override
  String get userReportsFilterOpen => 'Ouverts';

  @override
  String get userReportsFilterClosed => 'Fermés';

  @override
  String get userReportsEmpty => 'Aucun signalement envoyé';

  @override
  String get userReportsEmptyDescription =>
      'Vos signalements de relais apparaîtront ici';

  @override
  String get userReportsEmptyFiltered => 'Aucun signalement avec ce filtre';

  @override
  String get userReportsStatusPending => 'En attente';

  @override
  String get userReportsStatusReviewed => 'En cours d\'examen';

  @override
  String get userReportsStatusResolved => 'Résolu';

  @override
  String get userReportsStatusRejected => 'Rejeté';

  @override
  String get userReportsRetryBanner => 'Impossible de mettre à jour la liste';

  @override
  String get userReportsProfileTile => 'Mes signalements';

  @override
  String get userReportsProfileTileSubtitle =>
      'Voir le statut de vos signalements';

  @override
  String get userReportsError => 'Erreur lors du chargement des signalements';

  @override
  String get userReportsCoordinatorResponse => 'Réponse du coordinateur';

  @override
  String get userSubmissionsEmpty => 'Aucun relais proposé';

  @override
  String get userSubmissionsEmptyDescription =>
      'Les relais que vous proposez apparaîtront ici';

  @override
  String get userSubmissionsEmptyFiltered => 'Aucun relais avec ce filtre';

  @override
  String get userSubmissionsStatusPending => 'En attente';

  @override
  String get userSubmissionsStatusApproved => 'Approuvé';

  @override
  String get userSubmissionsStatusRejected => 'Rejeté';

  @override
  String get userSubmissionsCoordinatorResponse => 'Réponse du coordinateur';

  @override
  String get userSubmissionsFrequency => 'Fréquence';

  @override
  String get potaTitle => 'POTA Spots';

  @override
  String get potaSearchHint => 'Rechercher par activateur, parc ou mode…';

  @override
  String get potaNoSpots => 'Aucun spot POTA actif pour le moment.';

  @override
  String get potaLoadError => 'Impossible de charger les spots POTA';

  @override
  String get potaRetry => 'Réessayer';

  @override
  String get potaViewAll => 'Voir tout';

  @override
  String get potaActivator => 'Activateur';

  @override
  String get potaFrequency => 'Fréquence';

  @override
  String get potaMode => 'Mode';

  @override
  String get potaPark => 'Parc';

  @override
  String get potaReference => 'Référence';

  @override
  String get potaSpotter => 'Repéré par';

  @override
  String get potaComments => 'Commentaires';

  @override
  String get potaLastSpotted => 'Dernier repérage';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Impossible d\'ouvrir QRZ.com';

  @override
  String get potaParkWebsite => 'Site du parc';

  @override
  String get potaParkType => 'Type de parc';

  @override
  String get potaLocation => 'Position';

  @override
  String get potaCountry => 'Pays';

  @override
  String get potaFirstActivation => 'Première activation';

  @override
  String get potaBand => 'Bande';

  @override
  String potaDistanceAway(String distance) {
    return 'à $distance';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count spots actifs';
  }

  @override
  String get potaFilterAll => 'Toutes';

  @override
  String get potaFilterBand => 'Bande';

  @override
  String get potaFilterMode => 'Mode';

  @override
  String get potaSortByTime => 'Plus récents';

  @override
  String get potaSortByDistance => 'Plus proches';

  @override
  String get profileLanguage => 'Langue';

  @override
  String get profileUnitSystem => 'Unités';

  @override
  String get profileUnitSystemAuto => 'Automatique';

  @override
  String get profileUnitSystemMetric => 'Métrique';

  @override
  String get profileUnitSystemImperial => 'Impérial';

  @override
  String get profileLanguageSystem => 'Système';

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
  String get onboardingSkip => 'Passer';

  @override
  String get onboardingGetStarted => 'Commencer';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingWelcomeTitle1 => 'Trouvez les relais près de vous';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Découvrez les relais actifs dans votre zone, avec fréquences, tonalités et détails techniques.';

  @override
  String get onboardingWelcomeCredits =>
      'Données des relais fournies par IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtrer par mode';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analogique, DMR, C4FM, D-STAR — trouvez instantanément le relais qui vous convient.';

  @override
  String get onboardingWelcomeTitle3 => 'Spots POTA en temps réel';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Suivez les activations Parks on the Air avec des mises à jour en direct, des filtres par bande et distance.';

  @override
  String get onboardingWelcomeTitle4 => 'Sauvegardez vos favoris';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Gardez à portée de main les relais que vous utilisez le plus pour un accès rapide.';

  @override
  String get onboardingLocationTitle => 'Localisation';

  @override
  String get onboardingLocationSubtitle =>
      'Nous utilisons votre position pour vous montrer les relais et les activations POTA à proximité.';

  @override
  String get onboardingLocationEnable => 'Activer la Localisation';

  @override
  String get onboardingLocationSkip => 'Pas maintenant';

  @override
  String get onboardingDiscoveryTitle => 'Votre premier relais';

  @override
  String get onboardingDiscoverySubtitle =>
      'Voici ce qui se trouve près de vous !';

  @override
  String get onboardingDiscoveryViewDetails => 'Voir Détails';

  @override
  String get onboardingDiscoveryViewSpot => 'Voir Spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Explorer la Carte';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Explorez la carte pour trouver des relais et des activations POTA';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Relais à proximité';

  @override
  String get onboardingDiscoveryLivePota => 'Spot POTA actif';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'Aucun relais trouvé à proximité';

  @override
  String get onboardingTelegramTitle => 'Rejoignez la communauté';

  @override
  String get onboardingTelegramSubtitle =>
      'Rejoignez le groupe Telegram HamQRG pour recevoir des mises à jour, signaler des relais et rencontrer d\'autres radioamateurs.';

  @override
  String get onboardingTelegramJoin => 'Rejoindre le Groupe Telegram';

  @override
  String get onboardingTelegramLater => 'Peut-être plus tard';

  @override
  String get onboardingTelegramAlreadyMember => 'Je suis déjà membre';

  @override
  String get addRepeaterProfileTile => 'Proposer un nouveau relais';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Signaler un relais non encore répertorié';

  @override
  String get addRepeaterTitle => 'Nouveau Relais';

  @override
  String get addRepeaterHeadline => 'Signaler un relais manquant';

  @override
  String get addRepeaterDescription =>
      'Remplissez les données du relais que vous souhaitez ajouter. La soumission sera examinée avant publication.';

  @override
  String get addRepeaterSectionRepeater => 'Données du relais';

  @override
  String get addRepeaterSectionAccesses => 'Accès';

  @override
  String get addRepeaterSectionLocation => 'Emplacement';

  @override
  String get addRepeaterSectionNotes => 'Notes';

  @override
  String get addRepeaterName => 'Nom';

  @override
  String get addRepeaterNameHint => 'Ex. Monte Cimone';

  @override
  String get addRepeaterCallsign => 'Indicatif';

  @override
  String get addRepeaterCallsignHint => 'Ex. IR4AB';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Saisissez au moins un nom ou un indicatif';

  @override
  String get addRepeaterFrequency => 'Fréquence (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Ex. 145.000 ou 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Fréquence obligatoire';

  @override
  String get addRepeaterFrequencyInvalid => 'Fréquence invalide';

  @override
  String get addRepeaterShift => 'Shift (MHz)';

  @override
  String get addRepeaterShiftHint => 'Ex. -0.600 ou -0,600';

  @override
  String get addRepeaterRegion => 'Région';

  @override
  String get addRepeaterRegionHint => 'Ex. Emilia-Romagna';

  @override
  String get addRepeaterProvinceCode => 'Province';

  @override
  String get addRepeaterProvinceCodeHint => 'Ex. MO';

  @override
  String get addRepeaterLocality => 'Localité';

  @override
  String get addRepeaterLocalityHint => 'Ex. Fanano';

  @override
  String get addRepeaterLatitude => 'Latitude';

  @override
  String get addRepeaterLatitudeHint => 'Ex. 44.2100';

  @override
  String get addRepeaterLongitude => 'Longitude';

  @override
  String get addRepeaterLongitudeHint => 'Ex. 10.7900';

  @override
  String get addRepeaterLocator => 'Locator';

  @override
  String get addRepeaterLocatorHint => 'Ex. JN54QF';

  @override
  String get addRepeaterNotes => 'Notes supplémentaires';

  @override
  String get addRepeaterNotesHint =>
      'Informations supplémentaires sur le relais...';

  @override
  String get addRepeaterAddAccess => 'Ajouter un accès';

  @override
  String get addRepeaterRemoveAccess => 'Supprimer';

  @override
  String get addRepeaterAccessMode => 'Mode';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Ex. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Ex. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'Code DCS';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Ex. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'Ex. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Ex. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Ex. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'Ex. 1234';

  @override
  String get addRepeaterAccessNetworkName => 'Nom du réseau';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Ex. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Notes d\'accès';

  @override
  String get addRepeaterAccessNotesHint => 'Notes spécifiques à cet accès...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Je confirme que ces informations sont correctes à ma connaissance.';

  @override
  String get addRepeaterVerifiedTitle => 'Soumission vérifiée';

  @override
  String get addRepeaterVerifiedDescription =>
      'Votre soumission sera examinée par l\'équipe avant d\'être publiée dans la base de données.';

  @override
  String get addRepeaterSubmit => 'Envoyer';

  @override
  String get addRepeaterSuccess => 'Soumission envoyée avec succès !';

  @override
  String get addRepeaterError => 'Erreur lors de l\'envoi de la soumission';

  @override
  String get addRepeaterAtLeastOneAccess => 'Ajoutez au moins un accès';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Accès $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'Spots POTA en temps réel avec carte et détails du parc';

  @override
  String get changelog1017SubmitRepeater =>
      'Proposez un nouveau relais directement depuis l\'app';

  @override
  String get changelog1017MultiLanguage =>
      'App disponible en anglais, espagnol et français';

  @override
  String get changelog1017Onboarding =>
      'Nouvelle expérience de premier lancement';

  @override
  String get changelog1017ReportAnonymous =>
      'Signalements disponibles sans inscription';

  @override
  String get changelog1020ClusterSpots =>
      'Cluster spots en temps réel : voyez qui écoute sur les répéteurs, avec notifications et préférences';

  @override
  String get changelog1020DetailTabs =>
      'Page du répéteur avec onglets Info, Cluster et Communauté';

  @override
  String get changelog1020TabletLayout =>
      'Mise en page optimisée pour tablettes';

  @override
  String get changelog110Coverage =>
      'Carte de couverture des relais : visualisez le signal estimé directement sur la carte (PRO)';

  @override
  String get changelog110Reachable =>
      'Ce que vous atteignez d’ici : découvrez les relais que vous captez depuis votre position, avec signal et profil du terrain (PRO)';

  @override
  String get changelogTitle => 'Nouveautés';

  @override
  String get changelogSubtitle => 'Voici les nouveautés de cette version';

  @override
  String get changelogCategoryAdded => 'Nouveau';

  @override
  String get changelogCategoryImproved => 'Amélioré';

  @override
  String get changelogCategoryFixed => 'Corrigé';

  @override
  String get changelogDismiss => 'Compris !';

  @override
  String get spotCreateTitle => 'Se spotter soi-même';

  @override
  String get spotCreateOtherTitle => 'Spotter un OM';

  @override
  String get spotCreateDuration => 'Durée';

  @override
  String get spotCreateAccess => 'Mode (optionnel)';

  @override
  String get spotCreateCallsign => 'Indicatif de l\'OM entendu';

  @override
  String get spotCreateCallsignHint => 'Ex. F1ABC';

  @override
  String get spotCreateConfirm => 'Confirmer';

  @override
  String get spotCreateSuccessSelf => 'Spot créé !';

  @override
  String get spotCreateSuccessOther => 'OM spotté !';

  @override
  String get spotActiveYou => 'Vous êtes spotté';

  @override
  String get spotActiveClose => 'Fermer le spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'sur $repeaterName';
  }

  @override
  String get spotActiveNone => 'Personne spotté pour le moment';

  @override
  String get spotActiveCta => 'Soyez le premier !';

  @override
  String get spotActiveSection => 'Spots actifs';

  @override
  String get spotHistorySection => 'Historique des spots';

  @override
  String get spotListTitle => 'Derniers spots';

  @override
  String get spotListViewAll => 'Tout voir';

  @override
  String get spotListBadgeActive => 'À l\'écoute';

  @override
  String get spotListBadgeClosed => 'Terminé';

  @override
  String get spotListBadgeReport => 'Signaler';

  @override
  String get spotListEmpty => 'Aucun spot dans les dernières 24 heures';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Signalé par $callsign';
  }

  @override
  String get spotNotificationToggle => 'Notifications cluster';

  @override
  String get spotNotificationDisabled =>
      'Notifications cluster désactivées dans les paramètres du profil';

  @override
  String get spotNotificationPerFavorite => 'Notifications de spots';

  @override
  String get spotPreviousClosed => 'Votre spot précédent n\'est plus actif';

  @override
  String get spotErrorAuthRequired => 'Vous devez être connecté.';

  @override
  String get spotErrorCallsignRequired =>
      'Définissez votre indicatif dans votre profil pour utiliser le cluster.';

  @override
  String get spotErrorInvalidDuration =>
      'La durée doit être comprise entre 5 et 60 minutes.';

  @override
  String get spotErrorRepeaterNotFound => 'Relais introuvable.';

  @override
  String get spotErrorInvalidAccess => 'Mode d\'accès invalide pour ce relais.';

  @override
  String get spotErrorSpotNotFound => 'Spot introuvable.';

  @override
  String get spotErrorForbidden =>
      'Vous ne pouvez pas fermer un spot qui n\'est pas le vôtre.';

  @override
  String get spotErrorAlreadyClosed => 'Le spot est déjà fermé.';

  @override
  String get spotErrorGeneric =>
      'Erreur lors de la création du spot. Veuillez réessayer.';

  @override
  String get spotAccessUnavailable => '(mode plus disponible)';

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
  String get spotsFiltersTitle => 'Filtres';

  @override
  String get spotsFilterBand => 'Bande';

  @override
  String get spotsFilterMode => 'Mode';

  @override
  String get spotsFilterAll => 'Tous';

  @override
  String get spotsFiltersReset => 'Effacer les filtres';

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
      'Impossible de calculer les relais accessibles.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vous atteignez $count relais',
      one: 'Vous atteignez 1 relais',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'Depuis votre position, triés par signal';

  @override
  String get reachSheetEmpty => 'Aucun relais accessible à proximité.';

  @override
  String get reachBadgeTitle => 'Vous l\'atteignez d\'ici ?';

  @override
  String get reachBadgeSubtitle =>
      'Découvrez si ce relais vous couvre et avec quel signal';

  @override
  String get reachDiscoverCta => 'Découvrez-le avec PRO';

  @override
  String get reachReachable => 'Vous l\'atteignez';

  @override
  String get reachOutOfCoverage => 'Hors couverture';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · touchez pour le profil';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance d\'ici';
  }

  @override
  String get reachComputing => 'Calcul de la couverture…';

  @override
  String get reachRepeaterFallback => 'Relais';

  @override
  String get reachMapButton => 'Que captez-vous ?';

  @override
  String get reachUpsellTitle => 'Que captez-vous d\'ici ? 📡';

  @override
  String get reachUpsellBody =>
      'Découvrez en temps réel TOUS les relais que vous captez depuis votre position, avec le signal prévu et le profil du terrain. Combien en atteignez-vous vraiment d\'où vous êtes ?';

  @override
  String get reachUpsellLater => 'Plus tard';

  @override
  String get linkProfileObstructed =>
      'Obstacle sur le trajet (signal par diffraction)';

  @override
  String get linkProfileClear => 'Ligne de vue dégagée';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Profil du terrain et ligne de vue · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Débloquer avec PRO';

  @override
  String get proWelcomeTitle => 'Bienvenue dans PRO ! 🎉';

  @override
  String get proWelcomeBody =>
      'Vous avez débloqué la carte de couverture, les relais que vous atteignez depuis votre position et toutes les fonctions PRO. 📡';

  @override
  String get proWelcomeCta => 'Commencer à explorer';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonOpenSettings => 'Ouvrir les réglages';

  @override
  String get commonFieldRequired => 'Champ obligatoire';

  @override
  String get fieldName => 'Nom';

  @override
  String get fieldAddress => 'Adresse';

  @override
  String get fieldCity => 'Ville';

  @override
  String get fieldDescription => 'Description';

  @override
  String get fieldYear => 'Année';

  @override
  String get fieldSelectDateHint => 'Sélectionnez une date';

  @override
  String get validationInvalidYear => 'Sélectionnez une année valide';

  @override
  String get validationPasswordMinLength =>
      'Le mot de passe doit comporter au moins 6 caractères';

  @override
  String get permissionsMissingTitle => 'Autorisations manquantes !';

  @override
  String get imageUploadError => 'Erreur lors du téléversement de l\'image';

  @override
  String get uploadImageLabel => 'Téléverser une image';

  @override
  String get sourceGallery => 'Galerie';

  @override
  String get sourceCamera => 'Appareil photo';

  @override
  String get changePasswordTitle => 'Changer le mot de passe';

  @override
  String get fieldNewPassword => 'Nouveau mot de passe';

  @override
  String get fieldConfirmNewPassword => 'Confirmer le nouveau mot de passe';

  @override
  String get validationPasswordsNoMatch =>
      'Les mots de passe ne correspondent pas';

  @override
  String get passwordChangedSuccess => 'Mot de passe changé avec succès';

  @override
  String errorWithMessage(String message) {
    return 'Erreur : $message';
  }

  @override
  String get updateRequiredTitle => 'Mise à jour requise';

  @override
  String get updateRequiredAction => 'Mettre à jour maintenant';

  @override
  String get yearPickerTitle => 'Sélectionnez l\'année';

  @override
  String get repeaterTabInfo => 'Infos';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Communauté';

  @override
  String get updateRequiredBody =>
      'Une nouvelle version de l\'app est disponible. Mettez à jour pour continuer à l\'utiliser.';

  @override
  String get errorOpeningStore => 'Erreur lors de l\'ouverture du store';

  @override
  String get deleteConfirmTitle => 'Confirmer la suppression';

  @override
  String get deleteConfirmContent => 'Voulez-vous vraiment supprimer ?';

  @override
  String get cameraPermissionRationale =>
      'Pour prendre une photo, autorisez l\'accès à l\'appareil photo dans les réglages.';

  @override
  String get coverageSearchHint =>
      'Rechercher un lieu ou coller des coordonnées';

  @override
  String get coverageSearchRecentTitle => 'Recherches récentes';

  @override
  String get coverageSearchNoResults => 'Aucun lieu trouvé';

  @override
  String get coverageSearchTip =>
      'Vous pouvez coller des coordonnées (46.4879, 11.8123) ou appuyer longuement sur la carte';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Coordonnées hors limites : latitude ±90, longitude ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Pas de connexion : la recherche de lieux nécessite le réseau';

  @override
  String get coverageSearchErrorFailed => 'Échec de la recherche. Réessayez.';

  @override
  String get coverageSearchClearPoint => 'Supprimer le point';

  @override
  String get coverageSearchPointSemantics => 'Point de recherche sélectionné';

  @override
  String get coverageBreadthTitle => 'Étendue de recherche';

  @override
  String get coverageBreadthQuick => 'Rapide';

  @override
  String get coverageBreadthMedium => 'Moyenne';

  @override
  String get coverageBreadthExtended => 'Étendue';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · réponse la plus rapide';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · équilibrée';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · plus loin, attente plus longue';
  }

  @override
  String get coverageResultSubtitle => 'Depuis le point sélectionné';

  @override
  String get coverageResultEmptyNoReachable =>
      'Aucun relais n\'est accessible depuis ce point';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'Aucun relais répertorié dans cette zone';

  @override
  String get coverageResultClearFilters => 'Effacer les filtres';

  @override
  String get coverageResultError => 'Échec du calcul';

  @override
  String get coverageResultComputing => 'Calcul de la réception…';

  @override
  String get coverageResultCancel => 'Annuler';

  @override
  String coverageResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count relais accessibles',
      one: '1 relais accessible',
    );
    return '$_temp0';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown sur $total accessibles';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count accessibles masqués par les filtres',
      one: '1 accessible masqué par les filtres',
    );
    return '$_temp0';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Que capterez-vous depuis $place ? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Chaque relais capté depuis ce point, avec signal prévu et distance — avant même de partir.';

  @override
  String get coverageTeaserBenefitAnywhere => 'N\'importe quel point du globe';

  @override
  String get coverageTeaserBenefitOffline =>
      'Consultable hors réseau, sur le terrain';

  @override
  String get coverageTeaserBenefitSave =>
      'Enregistrez le poste et retrouvez-le';

  @override
  String get stationSaveCta => 'Enregistrer le poste';

  @override
  String get stationSaveTitle => 'Nom du poste';

  @override
  String get stationRename => 'Renommer';

  @override
  String get stationDelete => 'Supprimer';

  @override
  String get stationRefresh => 'Actualiser';

  @override
  String get stationRefreshAll => 'Tout actualiser';

  @override
  String get stationOfflineNotice => 'Données enregistrées sur l\'appareil';

  @override
  String get stationStaleNotice => 'Ces données peuvent être obsolètes';

  @override
  String get stationMissingEntry => 'Données indisponibles hors ligne';

  @override
  String get stationDuplicateTitle => 'Point déjà enregistré';

  @override
  String stationDuplicateBody(String distance) {
    return 'Un poste existe déjà à moins de $distance. Le mettre à jour ou en créer un autre ?';
  }

  @override
  String get stationDuplicateUpdate => 'La mettre à jour';

  @override
  String get stationDuplicateCreate => 'En créer un autre';

  @override
  String get stationSaveFailed =>
      'Échec de l\'enregistrement : espace insuffisant';

  @override
  String get stationSavedCta => 'Emplacement enregistré';

  @override
  String get stationRemoveCta => 'Supprimer';

  @override
  String get stationRemoveTitle => 'Supprimer l’emplacement ?';

  @override
  String stationRemoveBody(String name) {
    return '« $name » et ses données hors ligne seront supprimés de cet appareil.';
  }

  @override
  String get stationRemovedSnack => 'Emplacement supprimé';

  @override
  String get stationSaveError => 'Échec de l’enregistrement. Réessayez.';

  @override
  String get stationsTitle => 'Mes postes';

  @override
  String get stationsProfileSubtitle =>
      'Les points que vous avez évalués, consultables hors ligne';

  @override
  String get stationsEmptyTitle => 'Aucun poste enregistré';

  @override
  String get stationsEmptyBody =>
      'Un poste est un point de la carte dont vous avez déjà calculé la couverture, enregistré pour le retrouver sans réseau.';

  @override
  String get stationsEmptyStep1 =>
      'Choisissez un point sur la carte : appui long, recherche par nom ou collage des coordonnées.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Touchez « $action » pour voir les relais que vous captez depuis là.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Enregistrez le point : vous le retrouvez ici, même sur le terrain sans réseau.';

  @override
  String get stationsGoToMap => 'Aller à la carte';

  @override
  String get stationsRefreshDone => 'Actualisation terminée';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Mis à jour $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Mise à jour dans $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Mise à jour dans $minutes min';
  }

  @override
  String get spotsUpdating => 'Mise à jour…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Actualisation automatique toutes les $seconds secondes';
  }

  @override
  String get spotsManualRefreshHint => 'Touchez pour actualiser';

  @override
  String coverageResultScope(String km, int count) {
    return 'dans un rayon de $km · $count évalués';
  }

  @override
  String get coverageResultRecalculating => 'Recalcul en cours';

  @override
  String get offlineBannerMessage =>
      'Hors ligne : vous consultez les données enregistrées';

  @override
  String get offlineMapsTitle => 'Cartes hors ligne';

  @override
  String get offlineMapsEntrySubtitle =>
      'Téléchargez des cartes pour une utilisation sans connexion';

  @override
  String get offlineMapsEmpty =>
      'Aucune région téléchargée. Téléchargez une zone pour voir la carte même sans connexion.';

  @override
  String get offlineMapsAddRegion => 'Télécharger une région';

  @override
  String get offlineMapsRegionNameLabel => 'Nom de la région';

  @override
  String get offlineMapsRegionNameHint => 'Ex. Maison, Refuge, Activation SOTA';

  @override
  String get offlineMapsRadiusLabel => 'Rayon';

  @override
  String get offlineMapsDownload => 'Télécharger';

  @override
  String get offlineMapsDownloadingStyle => 'Téléchargement du style de carte…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Téléchargement des cartes… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Taille estimée : $size';
  }

  @override
  String get offlineMapsDownloadError => 'Échec du téléchargement. Réessayez.';

  @override
  String get offlineMapsDeleteError => 'Échec de la suppression. Réessayez.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Supprimer la région ?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '« $name » ne sera plus disponible hors ligne.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Supprimer';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Rayon $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Téléchargement incomplet';

  @override
  String get offlineMapsResume => 'Reprendre';

  @override
  String get offlineMapsCenterInfo =>
      'La région sera centrée sur votre position actuelle.';

  @override
  String get dashboardOfflineTitle => 'Vous êtes hors ligne';

  @override
  String get dashboardOfflineMessage =>
      'Aucune donnée enregistrée pour cette zone. Vos emplacements enregistrés et vos cartes téléchargées restent disponibles.';

  @override
  String get offlineMapsCenterMine => 'Ma position';

  @override
  String get offlineMapsCenterSearch => 'Chercher un lieu';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Cherchez une ville ou un lieu : la région sera centrée dessus.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Centre : $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Mode hors ligne : relais, favoris, profil, couverture et portée consultables même sans réseau (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Cartes hors ligne : téléchargez la zone où vous êtes ou un lieu de votre choix et utilisez-la sans connexion (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Recherche de couverture depuis n\'importe quel point : cherchez un lieu, collez des coordonnées ou appuyez longuement sur la carte pour découvrir ce que vous atteignez de là';

  @override
  String get changelog120SavedStations =>
      'Mes stations : enregistrez les points qui vous intéressent et consultez-les aussi hors ligne (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'Les spots SOTA et POTA se mettent à jour seuls chaque minute, avec des badges colorés par mode (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Sans connexion, l\'app démarre aussitôt, montre ce qui est disponible et désactive les actions qui nécessitent le réseau';

  @override
  String get changelog130ImperialUnits =>
      'Miles et pieds : l\'app suit désormais les unités de votre appareil, et vous pouvez choisir le système dans les Réglages';
}
