// ignore_for_file: camel_case_types

import 'package:units_converter/units_converter.dart';

List<Type> unitTypes = [
  AMOUNT_OF_SUBSTANCE,
  ANGLE,
  AREA,
  DENSITY,
  ENERGY,
  FORCE,
  FUEL_CONSUMPTION,
  LENGTH,
  MOLAR_MASS,
  MASS,
  POWER,
  SPEED,
  TEMPERATURE,
  TIME,
  TORQUE,
  VOLUME,
];

Map<Type, List<String>> unitTypeUnits = {
  AMOUNT_OF_SUBSTANCE: [
    'femtomoles',
    'micromoles',
    'millimoles',
    'moles',
    'nanomoles',
    'picomoles'
  ],
  ANGLE: ['degree', 'minutes', 'radians', 'seconds'],
  AREA: [
    'acres',
    'are',
    'hectares',
    'squareCentimeters',
    'squareFeet',
    'squareInches',
    'squareKilometers',
    'squareMeters',
    'squareMiles',
    'squareMillimeters',
    'squareYard'
  ],
  DENSITY: [
    'gramsPerCubicCentimeter',
    'gramsPerDeciliter',
    'gramsPerLiter',
    'gramsPerMilliliter',
    'kilogramsPerCubicMeter',
    'kilogramsPerLiter',
    'microgramsPerDeciliter',
    'microgramsPerLiter',
    'microgramsPerMilliliter',
    'milligramsPerCubicCentimeter',
    'milligramsPerCubicMeter',
    'milligramsPerDeciliter',
    'milligramsPerLiter',
    'milligramsPerMilliliter',
    'nanogramsPerLiter',
    'nanogramsPerMilliliter',
    'picogramsPerLiter',
    'picogramsPerMilliliter',
  ],
  ENERGY: [
    'calories',
    'electronvolts',
    'energyFootPound',
    'joules',
    'kilocalories',
    'kilojoules',
    'kilowattHours',
  ],
  FORCE: [
    'dyne',
    'kilogramForce',
    'newton',
    'poundForce',
    'poundal',
  ],
  FUEL_CONSUMPTION: [
    'kilometersPerLiter',
    'litersPer100km',
    'milesPerImperialGallon',
    'milesPerUsGallon',
  ],
  LENGTH: [
    'angstroms',
    'astronomicalUnits',
    'centimeters',
    'feet',
    'inches',
    'kilometers',
    'lightYears',
    'meters',
    'micrometers',
    'miles',
    'millimeters',
    'mils',
    'nanometers',
    'nauticalMiles',
    'parsec',
    'picometers',
    'yards',
  ],
  MOLAR_MASS: [
    'gramsPerFemtomole',
    'gramsPerMicromole',
    'gramsPerMillimole',
    'gramsPerMole',
    'gramsPerNanomole',
    'gramsPerPicomole',
    'kilogramsPerMillimole',
    'kilogramsPerMole',
    'milligramsPerFemtomole',
    'milligramsPerMicromole',
    'milligramsPerMillimole',
    'milligramsPerMole',
    'milligramsPerNanomole',
    'milligramsPerPicomole',
  ],
  MASS: [
    'carats',
    'centigrams',
    'decigrams',
    'ettograms',
    'femtograms',
    'grams',
    'kilograms',
    'micrograms',
    'milligrams',
    'nanograms',
    'ounces',
    'pennyweights',
    'picograms',
    'pounds',
    'quintals',
    'stones',
    'tons',
    'troyOunces',
    'uma',
  ],
  POWER: [
    'europeanHorsePower',
    'gigawatt',
    'imperialHorsePower',
    'kilowatt',
    'megawatt',
    'milliwatt',
    'watt',
  ],
  SPEED: [
    'feetsPerSecond',
    'kilometersPerHour',
    'knots',
    'metersPerSecond',
    'milesPerHour',
    'minutesPerKilometer'
  ],
  TEMPERATURE: [
    'celsius',
    'delisle',
    'fahrenheit',
    'kelvin',
    'rankine',
    'reamur',
    'romer'
  ],
  TIME: [
    'centiseconds',
    'centuries',
    'days',
    'decades',
    'deciseconds',
    'hours',
    'lustrum',
    'microseconds',
    'millennium',
    'milliseconds',
    'minutes',
    'nanoseconds',
    'seconds',
    'weeks',
    'years365'
  ],
  TORQUE: [
    'dyneMeter',
    'kilogramForceMeter',
    'newtonMeter',
    'poundForceFeet',
    'poundalMeter'
  ],
  VOLUME: [
    'australianTablespoons',
    'centiliters',
    'cubicCentimeters',
    'cubicFeet',
    'cubicInches',
    'cubicMeters',
    'cubicMillimeters',
    'cups',
    'deciliters',
    'femtoliters',
    'imperialFluidOunces',
    'imperialGallons',
    'imperialGill',
    'imperialPints',
    'liters',
    'microliters',
    'milliliters',
    'nanoliters',
    'picoliters',
    'tablespoonsUs',
    'usFluidOunces',
    'usGallons',
    'usGill',
    'usPints',
    'usQuarts',
  ],
};

Map<String, AMOUNT_OF_SUBSTANCE> amsTypeMap = {
  'femtomoles': AMOUNT_OF_SUBSTANCE.femtomoles,
  'micromoles': AMOUNT_OF_SUBSTANCE.micromoles,
  'millimoles': AMOUNT_OF_SUBSTANCE.millimoles,
  'moles': AMOUNT_OF_SUBSTANCE.moles,
  'nanomoles': AMOUNT_OF_SUBSTANCE.nanomoles,
  'picomoles': AMOUNT_OF_SUBSTANCE.picomoles,
};

Map<String, ANGLE> angleTypeMap = {
  'degree': ANGLE.degree,
  'minutes': ANGLE.minutes,
  'radians': ANGLE.radians,
  'seconds': ANGLE.seconds,
};

Map<String, AREA> areaTypeMap = {
  'acres': AREA.acres,
  'are': AREA.are,
  'hectares': AREA.hectares,
  'squareCentimeters': AREA.squareCentimeters,
  'squareFeet': AREA.squareFeet,
  'squareInches': AREA.squareInches,
  'squareKilometers': AREA.squareKilometers,
  'squareMeters': AREA.squareMeters,
  'squareMiles': AREA.squareMiles,
  'squareMillimeters': AREA.squareMillimeters,
  'squareYard': AREA.squareYard,
};

Map<String, DENSITY> densityTypeMap = {
  'gramsPerCubicCentimeter': DENSITY.gramsPerCubicCentimeter,
  'gramsPerDeciliter': DENSITY.gramsPerDeciliter,
  'gramsPerLiter': DENSITY.gramsPerLiter,
  'gramsPerMilliliter': DENSITY.gramsPerMilliliter,
  'kilogramsPerCubicMeter': DENSITY.kilogramsPerCubicMeter,
  'kilogramsPerLiter': DENSITY.kilogramsPerLiter,
  'microgramsPerDeciliter': DENSITY.microgramsPerDeciliter,
  'microgramsPerLiter': DENSITY.microgramsPerLiter,
  'microgramsPerMilliliter': DENSITY.microgramsPerMilliliter,
  'milligramsPerCubicCentimeter': DENSITY.milligramsPerCubicCentimeter,
  'milligramsPerCubicMeter': DENSITY.milligramsPerCubicMeter,
  'milligramsPerDeciliter': DENSITY.milligramsPerDeciliter,
  'milligramsPerLiter': DENSITY.milligramsPerLiter,
  'milligramsPerMilliliter': DENSITY.milligramsPerMilliliter,
  'nanogramsPerLiter': DENSITY.nanogramsPerLiter,
  'nanogramsPerMilliliter': DENSITY.nanogramsPerMilliliter,
  'picogramsPerLiter': DENSITY.picogramsPerLiter,
  'picogramsPerMilliliter': DENSITY.picogramsPerMilliliter,
};

Map<String, ENERGY> energyTypeMap = {
  'calories': ENERGY.calories,
  'electronvolts': ENERGY.electronvolts,
  'energyFootPound': ENERGY.energyFootPound,
  'joules': ENERGY.joules,
  'kilocalories': ENERGY.kilocalories,
  'kilojoules': ENERGY.kilojoules,
  'kilowattHours': ENERGY.kilowattHours,
};

Map<String, FORCE> forceTypeMap = {
  'dyne': FORCE.dyne,
  'kilogramForce': FORCE.kilogramForce,
  'newton': FORCE.newton,
  'poundForce': FORCE.poundForce,
  'poundal': FORCE.poundal,
};

Map<String, FUEL_CONSUMPTION> fuelConsumptionTypeMap = {
  'kilometersPerLiter': FUEL_CONSUMPTION.kilometersPerLiter,
  'litersPer100km': FUEL_CONSUMPTION.litersPer100km,
  'milesPerImperialGallon': FUEL_CONSUMPTION.milesPerImperialGallon,
  'milesPerUsGallon': FUEL_CONSUMPTION.milesPerUsGallon,
};

Map<String, LENGTH> lengthTypeMap = {
  'angstroms': LENGTH.angstroms,
  'astronomicalUnits': LENGTH.astronomicalUnits,
  'centimeters': LENGTH.centimeters,
  'feet': LENGTH.feet,
  'inches': LENGTH.inches,
  'kilometers': LENGTH.kilometers,
  'lightYears': LENGTH.lightYears,
  'meters': LENGTH.meters,
  'micrometers': LENGTH.micrometers,
  'miles': LENGTH.miles,
  'millimeters': LENGTH.millimeters,
  'mils': LENGTH.mils,
  'nanometers': LENGTH.nanometers,
  'nauticalMiles': LENGTH.nauticalMiles,
  'parsec': LENGTH.parsec,
  'picometers': LENGTH.picometers,
  'yards': LENGTH.yards,
};

Map<String, MOLAR_MASS> molarMassTypeMap = {
  'gramsPerFemtomole': MOLAR_MASS.gramsPerFemtomole,
  'gramsPerMicromole': MOLAR_MASS.gramsPerMicromole,
  'gramsPerMillimole': MOLAR_MASS.gramsPerMillimole,
  'gramsPerMole': MOLAR_MASS.gramsPerMole,
  'gramsPerNanomole': MOLAR_MASS.gramsPerNanomole,
  'gramsPerPicomole': MOLAR_MASS.gramsPerPicomole,
  'kilogramsPerMillimole': MOLAR_MASS.kilogramsPerMillimole,
  'kilogramsPerMole': MOLAR_MASS.kilogramsPerMole,
  'milligramsPerFemtomole': MOLAR_MASS.milligramsPerFemtomole,
  'milligramsPerMicromole': MOLAR_MASS.milligramsPerMicromole,
  'milligramsPerMillimole': MOLAR_MASS.milligramsPerMillimole,
  'milligramsPerMole': MOLAR_MASS.milligramsPerMole,
  'milligramsPerNanomole': MOLAR_MASS.milligramsPerNanomole,
  'milligramsPerPicomole': MOLAR_MASS.milligramsPerPicomole,
};

Map<String, MASS> massTypeMap = {
  'carats': MASS.carats,
  'centigrams': MASS.centigrams,
  'decigrams': MASS.decigrams,
  'ettograms': MASS.ettograms,
  'femtograms': MASS.femtograms,
  'grams': MASS.grams,
  'kilograms': MASS.kilograms,
  'micrograms': MASS.micrograms,
  'milligrams': MASS.milligrams,
  'nanograms': MASS.nanograms,
  'ounces': MASS.ounces,
  'pennyweights': MASS.pennyweights,
  'picograms': MASS.picograms,
  'pounds': MASS.pounds,
  'quintals': MASS.quintals,
  'stones': MASS.stones,
  'tons': MASS.tons,
  'troyOunces': MASS.troyOunces,
  'uma': MASS.uma,
};

Map<String, POWER> powerTypeMap = {
  'europeanHorsePower': POWER.europeanHorsePower,
  'gigawatt': POWER.gigawatt,
  'imperialHorsePower': POWER.imperialHorsePower,
  'kilowatt': POWER.kilowatt,
  'megawatt': POWER.megawatt,
  'milliwatt': POWER.milliwatt,
  'watt': POWER.watt,
};

Map<String, SPEED> speedTypeMap = {
  'feetsPerSecond': SPEED.feetsPerSecond,
  'kilometersPerHour': SPEED.kilometersPerHour,
  'knots': SPEED.knots,
  'metersPerSecond': SPEED.metersPerSecond,
  'milesPerHour': SPEED.milesPerHour,
  'minutesPerKilometer': SPEED.minutesPerKilometer,
};

Map<String, TEMPERATURE> temperatureTypeMap = {
  'celsius': TEMPERATURE.celsius,
  'delisle': TEMPERATURE.delisle,
  'fahrenheit': TEMPERATURE.fahrenheit,
  'kelvin': TEMPERATURE.kelvin,
  'rankine': TEMPERATURE.rankine,
  'reamur': TEMPERATURE.reamur,
  'romer': TEMPERATURE.romer,
};

Map<String, TIME> timeTypeMap = {
  'centiseconds': TIME.centiseconds,
  'centuries': TIME.centuries,
  'days': TIME.days,
  'decades': TIME.decades,
  'deciseconds': TIME.deciseconds,
  'hours': TIME.hours,
  'lustrum': TIME.lustrum,
  'microseconds': TIME.microseconds,
  'millennium': TIME.millennium,
  'milliseconds': TIME.milliseconds,
  'minutes': TIME.minutes,
  'nanoseconds': TIME.nanoseconds,
  'seconds': TIME.seconds,
  'weeks': TIME.weeks,
  'years365': TIME.years365,
};

Map<String, TORQUE> torqueTypeMap = {
  'dyneMeter': TORQUE.dyneMeter,
  'kilogramForceMeter': TORQUE.kilogramForceMeter,
  'newtonMeter': TORQUE.newtonMeter,
  'poundForceFeet': TORQUE.poundForceFeet,
  'poundalMeter': TORQUE.poundalMeter,
};

Map<String, VOLUME> volumeTypeMap = {
  'australianTablespoons': VOLUME.australianTablespoons,
  'centiliters': VOLUME.centiliters,
  'cubicCentimeters': VOLUME.cubicCentimeters,
  'cubicFeet': VOLUME.cubicFeet,
  'cubicInches': VOLUME.cubicInches,
  'cubicMeters': VOLUME.cubicMeters,
  'cubicMillimeters': VOLUME.cubicMillimeters,
  'cups': VOLUME.cups,
  'deciliters': VOLUME.deciliters,
  'femtoliters': VOLUME.femtoliters,
  'imperialFluidOunces': VOLUME.imperialFluidOunces,
  'imperialGallons': VOLUME.imperialGallons,
  'imperialGill': VOLUME.imperialGill,
  'imperialPints': VOLUME.imperialPints,
  'liters': VOLUME.liters,
  'microliters': VOLUME.microliters,
  'milliliters': VOLUME.milliliters,
  'nanoliters': VOLUME.nanoliters,
  'picoliters': VOLUME.picoliters,
  'tablespoonsUs': VOLUME.tablespoonsUs,
  'usFluidOunces': VOLUME.usFluidOunces,
  'usGallons': VOLUME.usGallons,
  'usGill': VOLUME.usGill,
  'usPints': VOLUME.usPints,
  'usQuarts': VOLUME.usQuarts,
};

Enum? getUnitType(Type unitType, String unit) {
  switch (unitType) {
    case AMOUNT_OF_SUBSTANCE:
      return amsTypeMap[unit];
    case ANGLE:
      return angleTypeMap[unit];
    case AREA:
      return areaTypeMap[unit];
    case DENSITY:
      return densityTypeMap[unit];
    case ENERGY:
      return energyTypeMap[unit];
    case FORCE:
      return forceTypeMap[unit];
    case FUEL_CONSUMPTION:
      return fuelConsumptionTypeMap[unit];
    case LENGTH:
      return lengthTypeMap[unit];
    case MOLAR_MASS:
      return molarMassTypeMap[unit];
    case MASS:
      return massTypeMap[unit];
    case POWER:
      return powerTypeMap[unit];
    case SPEED:
      return speedTypeMap[unit];
    case TEMPERATURE:
      return temperatureTypeMap[unit];
    case TIME:
      return timeTypeMap[unit];
    case TORQUE:
      return torqueTypeMap[unit];
    case VOLUME:
      return volumeTypeMap[unit];
    default:
      return null;
  }
}

String? getUnitString(Enum unit) {
  return unit.toString().split('.').last;
}
