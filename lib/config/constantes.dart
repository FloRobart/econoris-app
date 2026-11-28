/// Classe de constantes utilisées dans l'application pour centraliser les paramètres et les clés de configuration.
class Constantes {
  /* Séléction des opérations ou des abonnements dans les listes d'accueil. */
  static const bool isOperationSelected = true;
  static const bool isSubscriptionSelected = true;

  /* Seuils et paramètres utilisés pour la détection des salaires dans les opérations. */
  static const int salaryWindowSafetyMarginDays = 4;

  /* The operations are loaded by pages of this number of calendar months, from the most recent ones:
     the application never waits for the whole history to start */
  static const int operationsPageMonthsCount = 3;

  /* Clés utilisées pour la sauvegarde du brouillon de création d'opération dans les SharedPreferences. */
  static const draftOperationAmountKey = 'draft_operation_amount_key';
  static const draftOperationLabelKey = 'draft_operation_label_key';
  static const draftOperationDateKey = 'draft_operation_date_key';
  static const draftOperationCategoryIdKey = 'draft_operation_category_id_key';
  static const draftOperationIsExpenseKey = 'draft_operation_is_expense_key';

  /* Clés utilisées pour la sauvegarde du brouillon de création d'abonnement dans les SharedPreferences. */
  static const draftSubscriptionAmountKey = 'draft_subscription_amount_key';
  static const draftSubscriptionLabelKey = 'draft_subscription_label_key';
  static const draftSubscriptionDateKey = 'draft_subscription_date_key';
  static const draftSubscriptionCategoryIdKey =
      'draft_subscription_category_id_key';
  static const draftSubscriptionIsExpenseKey =
      'draft_subscription_is_expense_key';

  /* Récurrences disponibles pour les abonnements. */
  static const List<String> subscriptionRecurrences = [
    'mensuel',
    'trimestriel',
    'semestriel',
    'annuel',
  ];

  /* Code of the salary category, which starts a financial month (see FinancialDate) */
  static const String salaryCategoryCode = 'income_salary';

  /* Codes of the categories of the money that is moved but not spent: the money management index
     leaves out the expenses of these categories and of their sub-categories */
  static const Set<String> unavailableMoneyManagementCategoryCodes = {
    'income',
    'savings',
    'investment',
    'transfers_internal',
    'transfers_loans_to_relatives',
  };
}
