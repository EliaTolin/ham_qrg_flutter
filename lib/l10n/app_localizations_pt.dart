// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get proSectionTitle => 'Subscrição';

  @override
  String get proCardUpgradeTitle => 'Descobre o que alcanças';

  @override
  String get proCardUpgradeSubtitle => 'Cobertura, repetidores e mapas offline';

  @override
  String get proCardActiveTitle => 'HamQRG Pro ativo';

  @override
  String get proCardActiveSubtitle => 'Obrigado pelo seu apoio!';

  @override
  String proPriceFromMonth(String price) {
    return 'A partir de $price por mês · Cancela quando quiseres';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Experimenta grátis, depois $price por mês · Cancela quando quiseres';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price uma só vez · Para sempre';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'A partir de $price por mês · $total adiantados · Cancela quando quiseres';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Experimenta grátis, depois $price por mês · $total adiantados · Cancela quando quiseres';
  }

  @override
  String get proRestoreSuccess =>
      'Compras restauradas: o HamQRG Pro está ativo';

  @override
  String get proRestoreNone => 'Não há compras para restaurar';

  @override
  String get proManageSubscription => 'Gerir subscrição';

  @override
  String get proLinkAccountTitle => 'Associa a tua conta';

  @override
  String get proLinkAccountBody =>
      'Associa o HamQRG Pro a uma conta para o manteres em todos os dispositivos, mesmo depois de reinstalares.';

  @override
  String get stationsShowcaseTitle => 'Os teus locais, mesmo sem rede';

  @override
  String get stationsShowcaseBody =>
      'Guarda casa, o refúgio, o local de ativação: o que alcanças fica lá mesmo sem rede.';

  @override
  String get offlineMapsUpsellTitle => 'O mapa fica no teu telemóvel 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Descarrega as zonas de que precisas e abre-as onde não há sinal: numa crista, num túnel, no estrangeiro sem dados.';

  @override
  String get offlineMapsBenefitRegions =>
      'És tu que escolhes as zonas a descarregar';

  @override
  String get reachUpsellBenefitSignal => 'Sinal previsto para cada repetidor';

  @override
  String get reachUpsellBenefitTerrain =>
      'Perfil do terreno entre ti e o repetidor';

  @override
  String get proRestoreCta => 'Restaurar compras';

  @override
  String get error => 'Erro';

  @override
  String get error_message => 'Ocorreu um erro ao carregar';

  @override
  String get error_message_retry =>
      'Ocorreu um erro ao carregar. Por favor, tente novamente mais tarde';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get back => 'Voltar';

  @override
  String get loading => 'A carregar';

  @override
  String get details => 'Detalhes';

  @override
  String pages_number(Object number) {
    return '$number páginas para explorar';
  }

  @override
  String get january => 'Janeiro';

  @override
  String get february => 'Fevereiro';

  @override
  String get march => 'Março';

  @override
  String get april => 'Abril';

  @override
  String get may => 'Maio';

  @override
  String get june => 'Junho';

  @override
  String get july => 'Julho';

  @override
  String get august => 'Agosto';

  @override
  String get september => 'Setembro';

  @override
  String get october => 'Outubro';

  @override
  String get november => 'Novembro';

  @override
  String get december => 'Dezembro';

  @override
  String get logout => 'Terminar sessão';

  @override
  String get profile => 'Perfil';

  @override
  String get settings => 'Definições';

  @override
  String get contact_us => 'Contacte-nos';

  @override
  String get error_opening_email => 'Ocorreu um erro ao abrir o e-mail';

  @override
  String get register_now => 'Registar agora';

  @override
  String get tracking_permission_title => 'Apoie a aplicação';

  @override
  String get tracking_permission_message =>
      'Para melhorar a sua experiência e mostrar conteúdo mais relevante, ajude-nos a manter a aplicação gratuita.\n\nToque em Permitir para nos apoiar.';

  @override
  String get tracking_permission_next => 'Seguinte';

  @override
  String get skip => 'Saltar';

  @override
  String get done => 'Concluído';

  @override
  String get next => 'Seguinte';

  @override
  String get joinCommunityTitle => 'Junte-se à nossa comunidade!';

  @override
  String get joinCommunityDescription =>
      'Descubra as vantagens de participar na comunidade Telegram:';

  @override
  String get benefitSupportMembers => 'Apoio dos membros';

  @override
  String get benefitSuggestFeatures => 'Sugerir novas funcionalidades';

  @override
  String get benefitContactDevelopers => 'Contacto com os programadores';

  @override
  String get benefitExclusivePreviews => 'Pré-visualizações e betas exclusivos';

  @override
  String get benefitActiveCommunity => 'Comunidade ativa';

  @override
  String get joinNowButton => 'Aderir agora!';

  @override
  String get alreadyMemberButton => 'Já sou membro';

  @override
  String get laterButton => 'Mais tarde';

  @override
  String get errorOpenTelegram => 'Erro ao abrir o Telegram';

  @override
  String get disclaimerTitle => 'Fonte dos dados';

  @override
  String get disclaimerDescription =>
      'Os dados dos repetidores nesta aplicação provêm de IZ8WNH.\n\nPara informações adicionais, para descarregar ficheiros CSV para programar rádios, ou para consultar dados não disponíveis nesta aplicação, visite o sítio oficial.';

  @override
  String get disclaimerVisitSite => 'Visitar iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Entendido';

  @override
  String get errorOpenDisclaimerSite => 'Erro ao abrir o sítio web';

  @override
  String get repeatersMapTitle => 'Mapa de repetidores';

  @override
  String get repeatersListTitle => 'Lista de repetidores';

  @override
  String get repeatersMapLoading => 'A carregar mapa de repetidores…';

  @override
  String get repeatersMapGenericError =>
      'Não foi possível carregar os repetidores.';

  @override
  String get repeatersMapEmpty => 'Nenhum repetidor encontrado perto de si.';

  @override
  String get repeatersSearchHint =>
      'Pesquisar por nome, indicativo ou frequência MHz…';

  @override
  String get repeatersSearchEmpty => 'Nenhum repetidor encontrado.';

  @override
  String get repeatersSortDistance => 'Distância';

  @override
  String get repeatersSortLikes => 'Gostos';

  @override
  String get repeatersSortFrequency => 'Frequência';

  @override
  String repeatersNearbyCount(int count) {
    return '$count repetidores próximos';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count resultados';
  }

  @override
  String get repeatersMapRetry => 'Tentar novamente';

  @override
  String get repeatersMapOpenSettings => 'Abrir definições';

  @override
  String get repeatersMapPermissionMessage =>
      'Permita o acesso à localização para mostrar repetidores perto de si.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Permissão de localização negada permanentemente. Ative-a nas definições do sistema.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Ative os serviços de localização para encontrar repetidores próximos.';

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
  String get repeaterModeAllmode => 'Todos os modos';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frequência';

  @override
  String get repeaterShift => 'Desvio';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Localização';

  @override
  String get repeaterDistance => 'Distância';

  @override
  String get repeaterViewFullDetails => 'Ver detalhes completos';

  @override
  String get repeatersMapReturnToLocation => 'Voltar à minha localização';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count repetidores nesta localização';
  }

  @override
  String get profileUnlockFeatures => 'Desbloquear todas as funcionalidades';

  @override
  String get profileUnlockFeaturesDescription =>
      'Registe-se para usar avaliações, guardar favoritos e aceder a estatísticas detalhadas.';

  @override
  String get profileSignUpOrLogin => 'Registar ou iniciar sessão';

  @override
  String get profileErrorOpeningEmail => 'Erro ao abrir o e-mail';

  @override
  String get profileJoinTelegramCommunity => 'Aderir à comunidade Telegram';

  @override
  String get profileWelcomeTitle => 'Bem-vindo ao HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Junte-se à nossa comunidade de radioamadores em Itália.';

  @override
  String get profileEditProfile => 'Editar perfil';

  @override
  String get profileChangePhoto => 'Alterar foto';

  @override
  String get profileFirstName => 'Nome';

  @override
  String get profileLastName => 'Apelido';

  @override
  String get profileCallsign => 'Indicativo';

  @override
  String get profileRestartIdentificationTitle =>
      'Precisa de alterar o seu estado? Pode reiniciar o processo de identificação para mudar de Operador Licenciado para Ouvinte SWL.';

  @override
  String get profileRestartIdentificationButton =>
      'Reiniciar processo de identificação';

  @override
  String get profileSaveChanges => 'Guardar alterações';

  @override
  String get profileDangerZone => 'Zona de perigo';

  @override
  String get profileDeleteAccount => 'Eliminar conta';

  @override
  String get profileDeleteAccountConfirmTitle => 'Eliminar conta';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Tem a certeza de que pretende eliminar a sua conta? Esta ação é irreversível.';

  @override
  String get profileDeleteAccountCancel => 'Cancelar';

  @override
  String get profileDeleteAccountConfirm => 'Eliminar';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'Versão da aplicação $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Comunidade e apoio';

  @override
  String get profileSectionSupport => 'Apoio';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Versão: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Versão $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Erro: $error';
  }

  @override
  String get authJoinTitle => 'Junte-se ao HamQRG';

  @override
  String get authUnlockFeatures =>
      'Inicie sessão para desbloquear todas as funcionalidades!';

  @override
  String get authWhatYouGet => 'O que vai obter:';

  @override
  String get authBenefitStatsTitle => 'Estatísticas detalhadas';

  @override
  String get authBenefitStatsDescription =>
      'Acompanhe o seu progresso e melhore';

  @override
  String get authBenefitQuizTitle => 'Vários modos de questionário';

  @override
  String get authBenefitQuizDescription =>
      'Pratique em modo maratona, por temas e outros modos.';

  @override
  String get authBenefitSyncTitle => 'Sincronização';

  @override
  String get authBenefitSyncDescription =>
      'Aceda a partir de qualquer dispositivo';

  @override
  String get authOrSignInWithEmail => 'Ou inicie sessão com e-mail';

  @override
  String get authEnterEmail => 'Introduza o e-mail';

  @override
  String get authEnterPassword => 'Introduza a palavra-passe';

  @override
  String get authForgotPassword => 'Esqueceu a palavra-passe?';

  @override
  String get authSignIn => 'Iniciar sessão';

  @override
  String get authSignUp => 'Registar';

  @override
  String get authPasswordLengthError => 'A palavra-passe deve ser mais longa';

  @override
  String get authDontHaveAccount => 'Não tem conta? Registe-se';

  @override
  String get authHaveAccount => 'Já tem conta? Inicie sessão';

  @override
  String get authBackToSignIn => 'Voltar ao início de sessão';

  @override
  String get authUnexpectedError => 'Erro de autenticação: ';

  @override
  String get authValidEmailError => 'Introduza um e-mail válido';

  @override
  String get authSendPasswordReset => 'Enviar recuperação de palavra-passe';

  @override
  String get authPasswordResetSent => 'Recuperação de palavra-passe enviada';

  @override
  String get authVerifyEmailMessage =>
      'Verifique o seu e-mail para concluir o registo, consulte a sua caixa de entrada.';

  @override
  String get authInvalidCredentials => 'E-mail ou palavra-passe inválidos';

  @override
  String get authEmailNotConfirmed =>
      'Verifique o seu e-mail para iniciar sessão';

  @override
  String get authFirstName => 'Nome';

  @override
  String get authFirstNameRequired => 'O nome é obrigatório';

  @override
  String get authLastName => 'Apelido';

  @override
  String get authLastNameRequired => 'O apelido é obrigatório';

  @override
  String get authContinueAsGuest => 'Continuar como visitante';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Descubra os repetidores à sua volta';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Acesso rápido';

  @override
  String get homeRepeaterList => 'Lista de repetidores';

  @override
  String get homeMyFavorites => 'Os meus favoritos';

  @override
  String get homeNearby => 'Perto de si';

  @override
  String get homeViewAll => 'Ver tudo';

  @override
  String get dashboardTabRepeaters => 'Repetidores';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Nenhum repetidor próximo';

  @override
  String get dashboardViewAllRepeaters => 'Ver todos os repetidores';

  @override
  String get dashboardViewAllPotaSpots => 'Ver todos os spots POTA';

  @override
  String homeStations(int count) {
    return '$count estações';
  }

  @override
  String homeSaved(int count) {
    return '$count guardados';
  }

  @override
  String get homeActive => 'Ativo';

  @override
  String get homeIdle => 'Inativo';

  @override
  String get homeNavHome => 'Início';

  @override
  String get homeNavList => 'Lista';

  @override
  String get homeNavFavorites => 'Favoritos';

  @override
  String get homeNavMap => 'Mapa';

  @override
  String get homeNavProfile => 'Perfil';

  @override
  String get favoritesTitle => 'Os meus favoritos';

  @override
  String get favoritesSearchHint => 'Pesquisar repetidores guardados...';

  @override
  String get favoritesFilterAllSaved => 'Todos os guardados';

  @override
  String get favoritesEmpty => 'Nenhum repetidor guardado';

  @override
  String get favoritesEmptyDescription =>
      'Adicione repetidores aos favoritos para os ver aqui';

  @override
  String favoritesShowing(int showing, int total) {
    return 'A mostrar $showing de $total estações favoritas';
  }

  @override
  String get favoritesRemove => 'Remover dos favoritos';

  @override
  String get favoritesAdd => 'Adicionar aos favoritos';

  @override
  String get repeaterDetailSave => 'Guardar';

  @override
  String get repeaterDetailShare => 'Partilhar';

  @override
  String get repeaterDetailReport => 'Reportar';

  @override
  String get repeaterDetailTotalLikes => 'Total de gostos';

  @override
  String get repeaterDetailReports1Yr => 'Relatórios (1 ano)';

  @override
  String get repeaterDetailHealthScore => 'Índice de saúde';

  @override
  String get repeaterDetailExcellent => 'Excelente';

  @override
  String get repeaterDetailGood => 'Bom';

  @override
  String get repeaterDetailFair => 'Razoável';

  @override
  String get repeaterDetailToVerify => 'A verificar';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Índice calculado a partir de $count relatórios negativos no último ano';
  }

  @override
  String get repeaterDetailLastLike => 'Último gosto';

  @override
  String get repeaterDetailLastDownReport => 'Último relatório negativo';

  @override
  String get repeaterDetailTechnicalData => 'Dados técnicos';

  @override
  String get repeaterDetailFrequency => 'Frequência';

  @override
  String get repeaterDetailShift => 'Desvio';

  @override
  String get repeaterDetailSubtone => 'Subtom (SQL)';

  @override
  String get repeaterDetailMode => 'Modo';

  @override
  String get repeaterDetailLocation => 'Localização';

  @override
  String repeaterDetailAway(String distance) {
    return 'a $distance';
  }

  @override
  String get repeaterDetailCommunityReports => 'Relatórios da comunidade';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Atualizar estado e comentários';

  @override
  String get repeaterDetailEquipment => 'Equipamento';

  @override
  String get repeaterDetailEquipmentRequired => 'Equipamento *';

  @override
  String get repeaterDetailAccessModes => 'Modos de acesso';

  @override
  String get repeaterDetailNetwork => 'Rede';

  @override
  String get repeaterDetailLocationField => 'Localização';

  @override
  String get repeaterDetailLocationRequired => 'Localização *';

  @override
  String get repeaterDetailComment => 'Comentário';

  @override
  String get repeaterDetailCommentOptional => 'Comentário (Opcional)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Qualidade do sinal, relatório de áudio ou comentários gerais...';

  @override
  String get repeaterDetailReportDown => 'Reportar problema';

  @override
  String get repeaterDetailCheckinLike => 'Check-in e gosto';

  @override
  String get repeaterDetailYourFeedback => 'O seu comentário';

  @override
  String get repeaterDetailPostedJustNow => 'Publicado agora mesmo';

  @override
  String get repeaterDetailDeleteEntry => 'Eliminar entrada';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Ver todos os $count relatórios';
  }

  @override
  String get repeaterDetailStationPortable => 'Portátil';

  @override
  String get repeaterDetailStationMobile => 'Móvel';

  @override
  String get repeaterDetailStationFixed => 'Fixa';

  @override
  String get repeaterDetailLike => 'Gosto';

  @override
  String get repeaterDetailReportLabel => 'Relatório';

  @override
  String get repeaterDetailSaved => 'Guardado';

  @override
  String get repeaterDetailShareMessage => 'Veja este repetidor no HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'A funcionalidade de relatórios estará disponível em breve. Poderá reportar informações incorretas ou problemas com este repetidor.';

  @override
  String get commonClose => 'Fechar';

  @override
  String get favorite => 'Favorito';

  @override
  String get accessConfiguration => 'Configuração de acesso';

  @override
  String get noAccessConfiguration => 'Nenhuma configuração disponível';

  @override
  String get repeaterDetailAddFeedback => 'Adicionar comentário';

  @override
  String get repeaterDetailOthersReports => 'Relatórios de outros utilizadores';

  @override
  String get repeaterDetailRemove => 'Remover';

  @override
  String get repeaterDetailSelectAccess => 'Selecionar acesso';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'Deve estar a menos de $distance do repetidor para enviar comentários.';
  }

  @override
  String get repeaterDetailInteractive => 'Interativo';

  @override
  String get repeaterDetailLogYourSignal => 'Registar o seu sinal';

  @override
  String get repeaterDetailUsedEquipment => 'Equipamento utilizado';

  @override
  String get repeaterDetailYourLocation => 'A sua localização';

  @override
  String get repeaterDetailLocationPlaceholder => 'Onde estava? (ex. Lisboa)';

  @override
  String get repeaterDetailLocationSelectHint =>
      'Selecione um local a partir das sugestões';

  @override
  String get feedbackDistanceConfirmTitle => 'Confirmar envio';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'A localização selecionada está a $distance do repetidor. Confirma que pretende enviar este comentário sob a sua responsabilidade?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Confirmar';

  @override
  String get feedbackDistanceConfirmCancel => 'Cancelar';

  @override
  String get repeaterDetailSelectAccessInstance =>
      'Selecionar instância de acesso';

  @override
  String get repeaterDetailSignalObservations => 'Observações do sinal';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Como era a qualidade do áudio?';

  @override
  String get repeaterDetailSendLike => 'Enviar gosto';

  @override
  String get repeaterDetailReportIssue => 'Reportar problema';

  @override
  String get repeaterDetailRecentActivity => 'Atividade recente';

  @override
  String get reportIssueTitle => 'Relatório';

  @override
  String get reportIssueHeadline => 'Ajude-nos a manter os dados precisos';

  @override
  String get reportIssueDescription =>
      'Encontrou algo errado ou em falta neste repetidor? Diga-nos o que precisa de ser alterado e nós verificaremos.';

  @override
  String get reportIssueWhatToCorrect =>
      'O que gostaria de corrigir ou adicionar?';

  @override
  String get reportIssuePlaceholder =>
      'Ex. O tom CTCSS foi alterado para 88.5Hz, ou a localização é ligeiramente mais a norte, o gestor é...';

  @override
  String get reportIssueVerifiedTitle => 'Submissões verificadas';

  @override
  String get reportIssueVerifiedDescription =>
      'O seu relatório será analisado pelo coordenador regional antes de a base de dados pública ser atualizada. Obrigado pela sua contribuição para a comunidade.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Confirmo que esta informação está correta com base na minha observação.';

  @override
  String get reportIssueSubmit => 'Submeter';

  @override
  String get reportIssueMinChars => 'Mínimo de 10 caracteres necessários';

  @override
  String get reportIssueMaxChars => 'Máximo de 2000 caracteres';

  @override
  String get reportIssueSuccess => 'Relatório submetido com sucesso';

  @override
  String get reportIssueError => 'Erro ao submeter o relatório';

  @override
  String get registrationPromptTitle => 'Desbloqueie todo o potencial';

  @override
  String get registrationPromptDescription =>
      'Junte-se à comunidade de radioamadores italiana e leve a sua experiência ao próximo nível.';

  @override
  String get registrationBenefitInteractTitle => 'Interagir';

  @override
  String get registrationBenefitInteractDescription =>
      'Avalie repetidores e deixe comentários para outros.';

  @override
  String get registrationBenefitFavoritesTitle => 'Favoritos';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Guarde as suas frequências e repetidores mais utilizados.';

  @override
  String get registrationBenefitLogbookTitle => 'Livro de estação';

  @override
  String get registrationBenefitLogbookDescription =>
      'Registe os seus QSOs e mantenha um histórico pessoal.';

  @override
  String get registrationSignInApple => 'Iniciar sessão com Apple';

  @override
  String get registrationSignInGoogle => 'Iniciar sessão com Google';

  @override
  String get registrationPromptFooter =>
      'Registo gratuito. Não é necessária licença para consultar dados públicos.';

  @override
  String get postLoginOnboardingWelcome => 'Bem-vindo ao';

  @override
  String get postLoginOnboardingQuestion => 'É um radioamador licenciado?';

  @override
  String get postLoginOnboardingHelpText =>
      'Isto ajuda-nos a personalizar a sua experiência e a mostrar-lhe as frequências corretas.';

  @override
  String get postLoginOnboardingYesLicensed => 'Sim, sou';

  @override
  String get postLoginOnboardingNoListener => 'Não, sou apenas ouvinte';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identifique-se';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Introduza o seu indicativo oficial para aceder às funcionalidades de rede.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Indicativo';

  @override
  String get postLoginOnboardingCallsignHint => 'Ex. CT1XYZ';

  @override
  String get postLoginOnboardingComplete => 'Concluir perfil';

  @override
  String get postLoginOnboardingBack => 'Voltar';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Pode alterar isto mais tarde nas definições.';

  @override
  String get postLoginOnboardingSwlTitle => 'Indicativo SWL';

  @override
  String get postLoginOnboardingSwlQuestion => 'Tem um indicativo SWL oficial?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'Os indicativos de ouvinte de ondas curtas ajudam a identificá-lo na comunidade global de monitorização.';

  @override
  String get postLoginOnboardingSwlYes => 'Sim, tenho um';

  @override
  String get postLoginOnboardingSwlNo => 'Não, não tenho';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Introduzir indicativo';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Ex. CT1-12345-SWL';

  @override
  String get timeAgoJustNow => 'agora mesmo';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count minutos',
      one: 'há 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count horas',
      one: 'há 1 hora',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count dias',
      one: 'há 1 dia',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count semanas',
      one: 'há 1 semana',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count meses',
      one: 'há 1 mês',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count anos',
      one: 'há 1 ano',
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
  String get profileThemeModeDark => 'Escuro';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Seja o primeiro a deixar um comentário sobre este repetidor!';

  @override
  String get repeaterDetailDistanceFromYou => 'Distância até si';

  @override
  String get repeaterDistanceMapNoLocation => 'Localização não disponível';

  @override
  String get repeaterDetailNever => 'Nunca';

  @override
  String get repeaterDetailInfo => 'Informação';

  @override
  String get repeaterDetailSource => 'Fonte';

  @override
  String get repeaterDetailManager => 'Gestor';

  @override
  String get repeaterDetailSuggestManager =>
      'Conhece o gestor do repetidor? Reporte-o!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Mapa de comentários';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Veja onde os gostos e relatórios foram registados';

  @override
  String get repeaterDetailAltimetricProfile => 'Perfil altimétrico';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Veja o perfil do terreno entre si e o repetidor';

  @override
  String get repeaterCoverageTitle => 'Cobertura';

  @override
  String get repeaterCoverageCardTitle => 'Mapa de cobertura';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Estima o sinal do repetidor no território';

  @override
  String get repeaterCoverageLoading => 'A calcular a cobertura…';

  @override
  String get repeaterCoverageError => 'Não foi possível calcular a cobertura';

  @override
  String get repeaterCoverageRetry => 'Tentar novamente';

  @override
  String get repeaterCoverageLegendTitle => 'Sinal estimado (dBm)';

  @override
  String get repeaterCoverageCta => 'Ver cobertura';

  @override
  String get repeaterDetailLosClear =>
      'Linha de vista desimpedida entre si e o repetidor';

  @override
  String get repeaterDetailLosObstructed =>
      'Linha de vista obstruída pelo terreno';

  @override
  String get repeaterDetailTerrainProfile => 'Perfil do terreno';

  @override
  String get repeaterDetailLineOfSight => 'Linha de vista';

  @override
  String get repeaterDetailTotalDistance => 'Distância';

  @override
  String get repeaterDetailRepeaterElevation => 'Elevação do repetidor';

  @override
  String get repeaterDetailYourElevation => 'A sua elevação';

  @override
  String get repeaterDetailYou => 'Você';

  @override
  String get repeaterDetailRepeaterLabel => 'Repetidor';

  @override
  String get repeaterDetailFunFacts => 'Sabia que?';

  @override
  String get repeaterDetailWavelength => 'Comprimento de onda';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'O comprimento de onda deste repetidor é $value';
  }

  @override
  String get repeaterDetailOscillations => 'Oscilações por segundo';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'O sinal oscila $value vezes por segundo';
  }

  @override
  String get repeaterDetailPropagationTime => 'Tempo de propagação';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'O seu sinal demora $value a chegar ao repetidor';
  }

  @override
  String get repeaterDetailWaveCycles => 'Ciclos de onda em trânsito';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'A onda completa $value ciclos inteiros em trânsito';
  }

  @override
  String get userReportsTitle => 'As minhas atividades';

  @override
  String get userReportsTabReports => 'Relatórios';

  @override
  String get userReportsTabSubmissions => 'Novos repetidores';

  @override
  String get userReportsFilterAll => 'Todos';

  @override
  String get userReportsFilterOpen => 'Abertos';

  @override
  String get userReportsFilterClosed => 'Fechados';

  @override
  String get userReportsEmpty => 'Nenhum relatório submetido';

  @override
  String get userReportsEmptyDescription =>
      'Os seus relatórios de repetidores aparecerão aqui';

  @override
  String get userReportsEmptyFiltered => 'Nenhum relatório com este filtro';

  @override
  String get userReportsStatusPending => 'Pendente';

  @override
  String get userReportsStatusReviewed => 'Em análise';

  @override
  String get userReportsStatusResolved => 'Resolvido';

  @override
  String get userReportsStatusRejected => 'Rejeitado';

  @override
  String get userReportsRetryBanner => 'Não foi possível atualizar a lista';

  @override
  String get userReportsProfileTile => 'Os meus relatórios';

  @override
  String get userReportsProfileTileSubtitle =>
      'Ver o estado dos seus relatórios';

  @override
  String get userReportsError => 'Erro ao carregar relatórios';

  @override
  String get userReportsCoordinatorResponse => 'Resposta do coordenador';

  @override
  String get userSubmissionsEmpty => 'Nenhum repetidor proposto';

  @override
  String get userSubmissionsEmptyDescription =>
      'Os repetidores que propuser aparecerão aqui';

  @override
  String get userSubmissionsEmptyFiltered => 'Nenhum repetidor com este filtro';

  @override
  String get userSubmissionsStatusPending => 'Pendente';

  @override
  String get userSubmissionsStatusApproved => 'Aprovado';

  @override
  String get userSubmissionsStatusRejected => 'Rejeitado';

  @override
  String get userSubmissionsCoordinatorResponse => 'Resposta do coordenador';

  @override
  String get userSubmissionsFrequency => 'Frequência';

  @override
  String get potaTitle => 'Spots POTA';

  @override
  String get potaSearchHint => 'Pesquisar por ativador, parque ou modo…';

  @override
  String get potaNoSpots => 'Nenhum spot POTA ativo de momento.';

  @override
  String get potaLoadError => 'Não foi possível carregar os spots POTA';

  @override
  String get potaRetry => 'Tentar novamente';

  @override
  String get potaViewAll => 'Ver tudo';

  @override
  String get potaActivator => 'Ativador';

  @override
  String get potaFrequency => 'Frequência';

  @override
  String get potaMode => 'Modo';

  @override
  String get potaPark => 'Parque';

  @override
  String get potaReference => 'Referência';

  @override
  String get potaSpotter => 'Avistado por';

  @override
  String get potaComments => 'Comentários';

  @override
  String get potaLastSpotted => 'Último avistamento';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Não foi possível abrir o QRZ.com';

  @override
  String get potaParkWebsite => 'Sítio web do parque';

  @override
  String get potaParkType => 'Tipo de parque';

  @override
  String get potaLocation => 'Localização';

  @override
  String get potaCountry => 'País';

  @override
  String get potaFirstActivation => 'Primeira ativação';

  @override
  String get potaBand => 'Banda';

  @override
  String potaDistanceAway(String distance) {
    return 'a $distance';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count spots ativos';
  }

  @override
  String get potaFilterAll => 'Todos';

  @override
  String get potaFilterBand => 'Banda';

  @override
  String get potaFilterMode => 'Modo';

  @override
  String get potaSortByTime => 'Mais recentes';

  @override
  String get potaSortByDistance => 'Mais próximos';

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
  String get onboardingGetStarted => 'Começar';

  @override
  String get onboardingNext => 'Seguinte';

  @override
  String get onboardingWelcomeTitle1 => 'Encontre repetidores perto de si';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Descubra repetidores ativos na sua zona, com frequências, tons e detalhes técnicos.';

  @override
  String get onboardingWelcomeCredits =>
      'Dados de repetidores fornecidos por IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtrar por modo';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analógico, DMR, C4FM, D-STAR — encontre o repetidor certo para si instantaneamente.';

  @override
  String get onboardingWelcomeTitle3 => 'Spots POTA em tempo real';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Acompanhe as ativações Parks on the Air com atualizações em tempo real, filtros de banda e distância.';

  @override
  String get onboardingWelcomeTitle4 => 'Guarde os seus favoritos';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Mantenha os seus repetidores mais utilizados à mão para acesso rápido.';

  @override
  String get onboardingLocationTitle => 'Localização';

  @override
  String get onboardingLocationSubtitle =>
      'Utilizamos a sua localização para lhe mostrar repetidores e ativações POTA próximos.';

  @override
  String get onboardingLocationEnable => 'Ativar localização';

  @override
  String get onboardingLocationSkip => 'Agora não';

  @override
  String get onboardingDiscoveryTitle => 'O seu primeiro repetidor';

  @override
  String get onboardingDiscoverySubtitle => 'Eis o que está perto de si!';

  @override
  String get onboardingDiscoveryViewDetails => 'Ver detalhes';

  @override
  String get onboardingDiscoveryViewSpot => 'Ver spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Explorar o mapa';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Explore o mapa para encontrar repetidores e ativações POTA';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Repetidor próximo';

  @override
  String get onboardingDiscoveryLivePota => 'Spot POTA ao vivo';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'Nenhum repetidor encontrado nas proximidades';

  @override
  String get onboardingTelegramTitle => 'Junte-se à comunidade';

  @override
  String get onboardingTelegramSubtitle =>
      'Junte-se ao grupo Telegram do HamQRG para receber atualizações, reportar repetidores e conhecer outros radioamadores.';

  @override
  String get onboardingTelegramJoin => 'Aderir ao grupo Telegram';

  @override
  String get onboardingTelegramLater => 'Talvez mais tarde';

  @override
  String get onboardingTelegramAlreadyMember => 'Já sou membro';

  @override
  String get addRepeaterProfileTile => 'Sugerir novo repetidor';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Reportar um repetidor ainda não listado';

  @override
  String get addRepeaterTitle => 'Novo repetidor';

  @override
  String get addRepeaterHeadline => 'Reportar um repetidor em falta';

  @override
  String get addRepeaterDescription =>
      'Preencha os dados do repetidor que gostaria de adicionar. A submissão será revista antes da publicação.';

  @override
  String get addRepeaterSectionRepeater => 'Dados do repetidor';

  @override
  String get addRepeaterSectionAccesses => 'Acessos';

  @override
  String get addRepeaterSectionLocation => 'Localização';

  @override
  String get addRepeaterSectionNotes => 'Notas';

  @override
  String get addRepeaterName => 'Nome';

  @override
  String get addRepeaterNameHint => 'Ex. Serra da Estrela';

  @override
  String get addRepeaterCallsign => 'Indicativo';

  @override
  String get addRepeaterCallsignHint => 'Ex. CT0RPI';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Introduza pelo menos um nome ou indicativo';

  @override
  String get addRepeaterFrequency => 'Frequência (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Ex. 145.000 ou 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frequência obrigatória';

  @override
  String get addRepeaterFrequencyInvalid => 'Frequência inválida';

  @override
  String get addRepeaterShift => 'Desvio (MHz)';

  @override
  String get addRepeaterShiftHint => 'Ex. -0.600 ou -0,600';

  @override
  String get addRepeaterRegion => 'Região';

  @override
  String get addRepeaterRegionHint => 'Ex. Centro';

  @override
  String get addRepeaterProvinceCode => 'Distrito';

  @override
  String get addRepeaterProvinceCodeHint => 'Ex. LX';

  @override
  String get addRepeaterLocality => 'Localidade';

  @override
  String get addRepeaterLocalityHint => 'Ex. Guarda';

  @override
  String get addRepeaterLatitude => 'Latitude';

  @override
  String get addRepeaterLatitudeHint => 'Ex. 40.5373';

  @override
  String get addRepeaterLongitude => 'Longitude';

  @override
  String get addRepeaterLongitudeHint => 'Ex. -7.2676';

  @override
  String get addRepeaterLocator => 'Localizador';

  @override
  String get addRepeaterLocatorHint => 'Ex. IN50QN';

  @override
  String get addRepeaterNotes => 'Notas adicionais';

  @override
  String get addRepeaterNotesHint =>
      'Informações adicionais sobre o repetidor...';

  @override
  String get addRepeaterAddAccess => 'Adicionar acesso';

  @override
  String get addRepeaterRemoveAccess => 'Remover';

  @override
  String get addRepeaterAccessMode => 'Modo';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Ex. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Ex. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'Código DCS';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Ex. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'Ex. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Ex. 268801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Ex. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'Ex. 1234';

  @override
  String get addRepeaterAccessNetworkName => 'Nome da rede';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Ex. BM Portugal';

  @override
  String get addRepeaterAccessNotes => 'Notas do acesso';

  @override
  String get addRepeaterAccessNotesHint => 'Notas específicas deste acesso...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Confirmo que esta informação está correta segundo o meu conhecimento.';

  @override
  String get addRepeaterVerifiedTitle => 'Submissão verificada';

  @override
  String get addRepeaterVerifiedDescription =>
      'A sua submissão será revista pela equipa antes de ser publicada na base de dados.';

  @override
  String get addRepeaterSubmit => 'Submeter';

  @override
  String get addRepeaterSuccess => 'Submissão enviada com sucesso!';

  @override
  String get addRepeaterError => 'Erro ao enviar a submissão';

  @override
  String get addRepeaterAtLeastOneAccess => 'Adicione pelo menos um acesso';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Acesso $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'Spots POTA em tempo real com mapa e detalhes do parque';

  @override
  String get changelog1017SubmitRepeater =>
      'Sugira um novo repetidor diretamente da aplicação';

  @override
  String get changelog1017MultiLanguage =>
      'Aplicação disponível em inglês, espanhol e francês';

  @override
  String get changelog1017Onboarding => 'Nova experiência de primeiro arranque';

  @override
  String get changelog1017ReportAnonymous =>
      'Relatórios disponíveis sem registo';

  @override
  String get changelog1020ClusterSpots =>
      'Cluster spots em tempo real: vê quem está à escuta nos repetidores, com notificações e preferências';

  @override
  String get changelog1020DetailTabs =>
      'Página do repetidor com separadores Info, Cluster e Comunidade';

  @override
  String get changelog1020TabletLayout => 'Layout otimizado para tablets';

  @override
  String get changelog110Coverage =>
      'Mapa de cobertura dos repetidores: veja o sinal estimado diretamente no mapa (PRO)';

  @override
  String get changelog110Reachable =>
      'O que alcanças daqui: descobre os repetidores que captas da tua posição, com sinal e perfil do terreno (PRO)';

  @override
  String get changelogTitle => 'Novidades';

  @override
  String get changelogSubtitle => 'Eis o que há de novo nesta versão';

  @override
  String get changelogCategoryAdded => 'Novo';

  @override
  String get changelogCategoryImproved => 'Melhorado';

  @override
  String get changelogCategoryFixed => 'Corrigido';

  @override
  String get changelogDismiss => 'Entendido!';

  @override
  String get spotCreateTitle => 'Spottar-se';

  @override
  String get spotCreateOtherTitle => 'Spottar um OM';

  @override
  String get spotCreateDuration => 'Duração';

  @override
  String get spotCreateAccess => 'Modo (opcional)';

  @override
  String get spotCreateCallsign => 'Indicativo do OM ouvido';

  @override
  String get spotCreateCallsignHint => 'Ex. CT1ABC';

  @override
  String get spotCreateConfirm => 'Confirmar';

  @override
  String get spotCreateSuccessSelf => 'Spot criado!';

  @override
  String get spotCreateSuccessOther => 'OM spottado!';

  @override
  String get spotActiveYou => 'Está spottado';

  @override
  String get spotActiveClose => 'Fechar spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'em $repeaterName';
  }

  @override
  String get spotActiveNone => 'Ninguém spottado de momento';

  @override
  String get spotActiveCta => 'Seja o primeiro!';

  @override
  String get spotActiveSection => 'Spots ativos';

  @override
  String get spotHistorySection => 'Histórico de spots';

  @override
  String get spotListTitle => 'Últimos spots';

  @override
  String get spotListViewAll => 'Ver todos';

  @override
  String get spotListBadgeActive => 'A escutar';

  @override
  String get spotListBadgeClosed => 'Terminado';

  @override
  String get spotListBadgeReport => 'Reportar';

  @override
  String get spotListEmpty => 'Sem spots nas últimas 24 horas';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Reportado por $callsign';
  }

  @override
  String get spotNotificationToggle => 'Notificações do cluster';

  @override
  String get spotNotificationDisabled =>
      'Notificações do cluster desativadas nas definições do perfil';

  @override
  String get spotNotificationPerFavorite => 'Notificações de spots';

  @override
  String get spotPreviousClosed => 'O seu spot anterior já não está ativo';

  @override
  String get spotErrorAuthRequired => 'Tem de ter sessão iniciada.';

  @override
  String get spotErrorCallsignRequired =>
      'Defina o seu indicativo no perfil para usar o cluster.';

  @override
  String get spotErrorInvalidDuration =>
      'A duração deve ser entre 5 e 60 minutos.';

  @override
  String get spotErrorRepeaterNotFound => 'Repetidor não encontrado.';

  @override
  String get spotErrorInvalidAccess =>
      'Modo de acesso inválido para este repetidor.';

  @override
  String get spotErrorSpotNotFound => 'Spot não encontrado.';

  @override
  String get spotErrorForbidden => 'Não pode fechar um spot que não é seu.';

  @override
  String get spotErrorAlreadyClosed => 'O spot já está fechado.';

  @override
  String get spotErrorGeneric => 'Erro ao criar o spot. Tente novamente.';

  @override
  String get spotAccessUnavailable => '(modo já não disponível)';

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
  String get spotsFiltersReset => 'Limpar filtros';

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
      'Não foi possível calcular os repetidores alcançáveis.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alcanças $count repetidores',
      one: 'Alcanças 1 repetidor',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'Da tua localização, ordenados por sinal';

  @override
  String get reachSheetEmpty => 'Nenhum repetidor alcançável por perto.';

  @override
  String get reachBadgeTitle => 'Alcanças a partir daqui?';

  @override
  String get reachBadgeSubtitle =>
      'Descobre se este repetidor te cobre e com que sinal';

  @override
  String get reachDiscoverCta => 'Descobre com PRO';

  @override
  String get reachReachable => 'Alcanças';

  @override
  String get reachOutOfCoverage => 'Fora de cobertura';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · toca para ver o perfil';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance daqui';
  }

  @override
  String get reachComputing => 'A calcular cobertura…';

  @override
  String get reachRepeaterFallback => 'Repetidor';

  @override
  String get reachMapButton => 'O que alcanças?';

  @override
  String get reachUpsellTitle => 'O que alcanças a partir daqui? 📡';

  @override
  String get reachUpsellBody =>
      'Vê em tempo real TODOS os repetidores que captas a partir da tua localização, com sinal previsto e perfil do terreno. Quantos alcanças mesmo de onde estás agora?';

  @override
  String get reachUpsellLater => 'Mais tarde';

  @override
  String get linkProfileObstructed =>
      'Obstáculo no percurso (sinal por difração)';

  @override
  String get linkProfileClear => 'Linha de vista desimpedida';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Perfil do terreno e linha de vista · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Desbloquear com PRO';

  @override
  String get proWelcomeTitle => 'Bem-vindo ao PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Desbloqueaste o mapa de cobertura, os repetidores que alcanças a partir da tua localização e todas as funções PRO. 📡';

  @override
  String get proWelcomeCta => 'Começar a explorar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonOpenSettings => 'Abrir definições';

  @override
  String get commonFieldRequired => 'Campo obrigatório';

  @override
  String get fieldName => 'Nome';

  @override
  String get fieldAddress => 'Morada';

  @override
  String get fieldCity => 'Cidade';

  @override
  String get fieldDescription => 'Descrição';

  @override
  String get fieldYear => 'Ano';

  @override
  String get fieldSelectDateHint => 'Seleciona uma data';

  @override
  String get validationInvalidYear => 'Seleciona um ano válido';

  @override
  String get validationPasswordMinLength =>
      'A palavra-passe deve ter pelo menos 6 caracteres';

  @override
  String get permissionsMissingTitle => 'Faltam permissões!';

  @override
  String get imageUploadError => 'Erro ao carregar a imagem';

  @override
  String get uploadImageLabel => 'Carregar imagem';

  @override
  String get sourceGallery => 'Galeria';

  @override
  String get sourceCamera => 'Câmara';

  @override
  String get changePasswordTitle => 'Alterar palavra-passe';

  @override
  String get fieldNewPassword => 'Nova palavra-passe';

  @override
  String get fieldConfirmNewPassword => 'Confirmar nova palavra-passe';

  @override
  String get validationPasswordsNoMatch => 'As palavras-passe não coincidem';

  @override
  String get passwordChangedSuccess => 'Palavra-passe alterada com sucesso';

  @override
  String errorWithMessage(String message) {
    return 'Erro: $message';
  }

  @override
  String get updateRequiredTitle => 'Atualização necessária';

  @override
  String get updateRequiredAction => 'Atualizar agora';

  @override
  String get yearPickerTitle => 'Seleciona o ano';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Comunidade';

  @override
  String get updateRequiredBody =>
      'Está disponível uma nova versão da app. Atualiza para continuar a usá-la.';

  @override
  String get errorOpeningStore => 'Erro ao abrir a loja';

  @override
  String get deleteConfirmTitle => 'Confirmar eliminação';

  @override
  String get deleteConfirmContent => 'Tens a certeza de que queres eliminar?';

  @override
  String get cameraPermissionRationale =>
      'Para tirar uma foto, permite o acesso à câmara nas definições.';

  @override
  String get coverageSearchHint => 'Pesquisar um local ou colar coordenadas';

  @override
  String get coverageSearchRecentTitle => 'Pesquisas recentes';

  @override
  String get coverageSearchNoResults => 'Nenhum local encontrado';

  @override
  String get coverageSearchTip =>
      'Podes colar coordenadas (46.4879, 11.8123) ou manter premido no mapa';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Coordenadas fora do intervalo: latitude ±90, longitude ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Sem ligação: a pesquisa de locais precisa de rede';

  @override
  String get coverageSearchErrorFailed => 'A pesquisa falhou. Tenta novamente.';

  @override
  String get coverageSearchClearPoint => 'Remover ponto';

  @override
  String get coverageSearchPointSemantics => 'Ponto de pesquisa selecionado';

  @override
  String get coverageBreadthTitle => 'Amplitude da pesquisa';

  @override
  String get coverageBreadthQuick => 'Rápida';

  @override
  String get coverageBreadthMedium => 'Média';

  @override
  String get coverageBreadthExtended => 'Alargada';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · resposta mais rápida';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · equilibrada';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · mais longe, espera maior';
  }

  @override
  String get coverageResultSubtitle => 'A partir do ponto selecionado';

  @override
  String get coverageResultEmptyNoReachable =>
      'Nenhum repetidor é alcançável a partir deste ponto';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'Nenhum repetidor registado nesta área';

  @override
  String get coverageResultClearFilters => 'Limpar filtros';

  @override
  String get coverageResultError => 'O cálculo falhou';

  @override
  String get coverageResultComputing => 'A calcular a receção…';

  @override
  String get coverageResultCancel => 'Cancelar';

  @override
  String coverageResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count repetidores alcançáveis',
      one: '1 repetidor alcançável',
    );
    return '$_temp0';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown de $total alcançáveis';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alcançáveis ocultos pelos filtros',
      one: '1 alcançável oculto pelos filtros',
    );
    return '$_temp0';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'O que alcanças a partir de $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Cada repetidor que alcanças a partir desse ponto, com sinal previsto e distância — antes mesmo de partires.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Qualquer ponto do planeta';

  @override
  String get coverageTeaserBenefitOffline => 'Consultável sem rede, no terreno';

  @override
  String get coverageTeaserBenefitSave =>
      'Guardas o posto e voltas a encontrá-lo';

  @override
  String get stationSaveCta => 'Guardar posto';

  @override
  String get stationSaveTitle => 'Nome do posto';

  @override
  String get stationRename => 'Renomear';

  @override
  String get stationDelete => 'Eliminar';

  @override
  String get stationRefresh => 'Atualizar';

  @override
  String get stationRefreshAll => 'Atualizar todas';

  @override
  String get stationOfflineNotice => 'Dados guardados no dispositivo';

  @override
  String get stationStaleNotice => 'Os dados podem estar desatualizados';

  @override
  String get stationMissingEntry => 'Dados indisponíveis offline';

  @override
  String get stationDuplicateTitle => 'Ponto já guardado';

  @override
  String stationDuplicateBody(String distance) {
    return 'Já existe um posto a menos de $distance. Atualizá-lo ou criar um distinto?';
  }

  @override
  String get stationDuplicateUpdate => 'Atualizar';

  @override
  String get stationDuplicateCreate => 'Criar distinto';

  @override
  String get stationSaveFailed => 'Falha ao guardar: espaço insuficiente';

  @override
  String get stationSavedCta => 'Localização guardada';

  @override
  String get stationRemoveCta => 'Remover';

  @override
  String get stationRemoveTitle => 'Remover a localização?';

  @override
  String stationRemoveBody(String name) {
    return '«$name» e os seus dados offline serão eliminados deste dispositivo.';
  }

  @override
  String get stationRemovedSnack => 'Localização removida';

  @override
  String get stationSaveError => 'Não foi possível guardar. Tente novamente.';

  @override
  String get stationsTitle => 'Os meus postos';

  @override
  String get stationsProfileSubtitle =>
      'Os pontos que avaliaste, disponíveis sem rede';

  @override
  String get stationsEmptyTitle => 'Ainda sem postos guardados';

  @override
  String get stationsEmptyBody =>
      'Uma posição é um ponto do mapa cuja cobertura já calculaste, guardado para o reencontrares sem rede.';

  @override
  String get stationsEmptyStep1 =>
      'Escolhe um ponto no mapa: mantém premido, procura pelo nome ou cola as coordenadas.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Toca em «$action» para veres que repetidores alcanças a partir dali.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Guarda o ponto: encontra-lo aqui, mesmo no campo sem rede.';

  @override
  String get stationsGoToMap => 'Ir para o mapa';

  @override
  String get stationsRefreshDone => 'Atualização concluída';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Atualizado $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Atualização em $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Atualização em $minutes min';
  }

  @override
  String get spotsUpdating => 'A atualizar…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Atualização automática a cada $seconds segundos';
  }

  @override
  String get spotsManualRefreshHint => 'Toque para atualizar';

  @override
  String coverageResultScope(String km, int count) {
    return 'num raio de $km · $count avaliados';
  }

  @override
  String get coverageResultRecalculating => 'A recalcular';

  @override
  String get offlineBannerMessage =>
      'Sem ligação: a consultar os dados guardados';

  @override
  String get offlineMapsTitle => 'Mapas offline';

  @override
  String get offlineMapsEntrySubtitle =>
      'Transfira mapas para usar sem ligação';

  @override
  String get offlineMapsEmpty =>
      'Nenhuma região transferida. Transfira uma zona para ver o mapa mesmo sem ligação.';

  @override
  String get offlineMapsAddRegion => 'Transferir região';

  @override
  String get offlineMapsRegionNameLabel => 'Nome da região';

  @override
  String get offlineMapsRegionNameHint => 'Ex. Casa, Abrigo, Ativação SOTA';

  @override
  String get offlineMapsRadiusLabel => 'Raio';

  @override
  String get offlineMapsDownload => 'Transferir';

  @override
  String get offlineMapsDownloadingStyle => 'A transferir o estilo do mapa…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'A transferir mapas… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Tamanho estimado: $size';
  }

  @override
  String get offlineMapsDownloadError =>
      'Falha na transferência. Tente novamente.';

  @override
  String get offlineMapsDeleteError => 'Falha ao eliminar. Tente novamente.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Eliminar a região?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '“$name” deixará de estar disponível offline.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Eliminar';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Raio $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Transferência incompleta';

  @override
  String get offlineMapsResume => 'Retomar';

  @override
  String get offlineMapsCenterInfo =>
      'A região será centrada na sua localização atual.';

  @override
  String get dashboardOfflineTitle => 'Está offline';

  @override
  String get dashboardOfflineMessage =>
      'Sem dados guardados para esta zona. As suas localizações guardadas e os mapas transferidos continuam disponíveis.';

  @override
  String get offlineMapsCenterMine => 'A minha posição';

  @override
  String get offlineMapsCenterSearch => 'Procurar um local';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Procure uma cidade ou local: a região será centrada aí.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Centro: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Modo offline: repetidores, favoritos, perfil, cobertura e alcance disponíveis mesmo sem rede (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Mapas offline: descarrega a zona onde estás ou um local à tua escolha e usa-a sem ligação (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Pesquisa de cobertura a partir de qualquer ponto: pesquisa uma localidade, cola coordenadas ou mantém premido o mapa para descobrir o que alcanças a partir daí';

  @override
  String get changelog120SavedStations =>
      'As minhas estações: guarda os pontos que te interessam e consulta-os também offline (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'Os spots SOTA e POTA atualizam-se sozinhos a cada minuto, com distintivos coloridos por modo (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Sem ligação a app arranca de imediato, mostra o que está disponível e desativa as ações que precisam de rede';

  @override
  String get changelog130ImperialUnits =>
      'Milhas e pés: a app segue agora as unidades do teu dispositivo, e podes escolher o sistema nas Definições';
}
