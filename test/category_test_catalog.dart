import 'package:econoris_app/domain/models/categories/category.dart';
import 'package:econoris_app/domain/models/categories/category_catalog.dart';

/* A small tree of categories, shaped like the one of the API */
const Category salary = Category(
  id: 22,
  code: 'income_salary',
  label: 'Salaire',
  parentId: 1,
);
const Category income = Category(
  id: 1,
  code: 'income',
  label: 'Revenus',
  parentId: null,
  children: [salary],
);

const Category rent = Category(
  id: 35,
  code: 'housing_rent',
  label: 'Loyer',
  parentId: 2,
);
const Category water = Category(
  id: 40,
  code: 'housing_water',
  label: 'Eau',
  parentId: 2,
);
const Category electricity = Category(
  id: 38,
  code: 'housing_electricity',
  label: 'Électricité',
  parentId: 2,
);
const Category housingInsurance = Category(
  id: 41,
  code: 'housing_insurance',
  label: 'Assurance habitation',
  parentId: 2,
);
const Category housing = Category(
  id: 2,
  code: 'housing',
  label: 'Logement',
  parentId: null,
  children: [rent, water, electricity, housingInsurance],
);

const Category fuel = Category(
  id: 58,
  code: 'transport_fuel',
  label: 'Carburant et recharge',
  parentId: 4,
  searchKeywords: ['essence', 'gazole'],
);
const Category vehicleInsurance = Category(
  id: 61,
  code: 'transport_insurance',
  label: 'Assurance véhicule',
  parentId: 4,
  searchKeywords: ['auto', 'moto'],
);
const Category transport = Category(
  id: 4,
  code: 'transport',
  label: 'Transports',
  parentId: null,
  children: [fuel, vehicleInsurance],
);

const Category savingsAccounts = Category(
  id: 140,
  code: 'savings_accounts',
  label: 'Livrets d\'épargne',
  parentId: 17,
);
const Category savings = Category(
  id: 17,
  code: 'savings',
  label: 'Épargne',
  parentId: null,
  children: [savingsAccounts],
);

const Category other = Category(
  id: 21,
  code: 'other',
  label: 'Autres',
  parentId: null,
);

/// Builds a catalog of the test categories, in the alphabetical order of the API.
CategoryCatalog buildTestCategoryCatalog() {
  return CategoryCatalog([other, savings, housing, income, transport]);
}
