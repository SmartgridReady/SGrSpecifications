<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">


    <!-- Helper templates -->
    <!-- template 'join' accepts valueList and separator -->
    <xsl:template name="join">
        <xsl:param name="valueList" select="''" />
        <xsl:param name="separator" select="','" />
        <xsl:for-each select="$valueList">
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:value-of select="." />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($separator, .) " />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <!-- Units -->
    <xsl:template name="SGrUnits">
        <xsl:param name="value" select="NONE" />
        <xsl:choose>
            <xsl:when test="$value = 'AMPERE_SQUARE_METERS'">A m2</xsl:when>
            <xsl:when test="$value = 'AMPERES'">A</xsl:when>
            <xsl:when test="$value = 'AMPERES_PER_METER'">A/m</xsl:when>
            <xsl:when test="$value = 'AMPERES_PER_SQUARE_METER'">A/m2</xsl:when>
            <xsl:when test="$value = 'BARS'">bar</xsl:when>
            <xsl:when test="$value = 'BTUS'">BTU</xsl:when>
            <xsl:when test="$value = 'BTUS_PER_HOUR'">BTU/h</xsl:when>
            <xsl:when test="$value = 'BTUS_PER_POUND'">BTU/lb</xsl:when>
            <xsl:when test="$value = 'BTUS_PER_POUND_DRY_AIR'">BUT/lb dry air</xsl:when>
            <xsl:when test="$value = 'CANDELAS'">cd</xsl:when>
            <xsl:when test="$value = 'CANDELAS_PER_SQUARE_METER'">cd/m2</xsl:when>
            <xsl:when test="$value = 'CENTIMETERS'">cm</xsl:when>
            <xsl:when test="$value = 'CENTIMETERS_OF_MERCURY'">cmHg</xsl:when>
            <xsl:when test="$value = 'CENTIMETERS_OF_WATER'">cmH2O</xsl:when>
            <xsl:when test="$value = 'CUBIC_FEET'">cu ft</xsl:when>
            <xsl:when test="$value = 'CUBIC_FEET_PER_MINUTE'">cu ft/min</xsl:when>
            <xsl:when test="$value = 'CUBIC_FEET_PER_SECOND'">cu ft/sec</xsl:when>
            <xsl:when test="$value = 'CUBIC_METERS'">m3</xsl:when>
            <xsl:when test="$value = 'CUBIC_METERS_PER_HOUR'">m3/h</xsl:when>
            <xsl:when test="$value = 'CUBIC_METERS_PER_MINUTE'">m2/min</xsl:when>
            <xsl:when test="$value = 'CUBIC_METERS_PER_SECOND'">m3/s</xsl:when>
            <xsl:when test="$value = 'CURRENCY1'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CURRENCY10'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CURRENCY2'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CURRENCY3'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CURRENCY4'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CURRENCY5'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CURRENCY6'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CURRENCY7'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CURRENCY8'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CURRENCY9'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CYCLES_PER_HOUR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'CYCLES_PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DAYS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREE_DAYS_CELSIUS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREE_DAYS_FAHRENHEIT'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_ANGULAR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_CELSIUS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_CELSIUS_PER_HOUR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_CELSIUS_PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_FAHRENHEIT'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_FAHRENHEIT_PER_HOUR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_FAHRENHEIT_PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_KELVIN'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_KELVIN_PER_HOUR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_KELVIN_PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DEGREES_PHASE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DELTA_DEGREES_FAHRENHEIT'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'DELTA_DEGREES_KELVIN'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'FARADS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'FEET'">ft</xsl:when>
            <xsl:when test="$value = 'FEET_PER_MINUTE'">ft/min</xsl:when>
            <xsl:when test="$value = 'FEET_PER_SECOND'">ft/sec</xsl:when>
            <xsl:when test="$value = 'FOOT_CANDLES'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'GIGAJOULES'">GJ</xsl:when>
            <xsl:when test="$value = 'GRAMS_OF_WATER_PER_KILOGRAM_DRY_AIR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'GRAMS_PER_MINUTE'">g/min</xsl:when>
            <xsl:when test="$value = 'GRAMS_PER_SECOND'">g/sec</xsl:when>
            <xsl:when test="$value = 'HECTOPASCALS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'HENRYS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'HERTZ'">Hz</xsl:when>
            <xsl:when test="$value = 'HORSEPOWER'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'HOURS'">h</xsl:when>
            <xsl:when test="$value = 'HUNDREDTHS_SECONDS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'IMPERIAL_GALLONS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'IMPERIAL_GALLONS_PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'INCHES'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'INCHES_OF_MERCURY'">inHg</xsl:when>
            <xsl:when test="$value = 'INCHES_OF_WATER'">inH2O</xsl:when>
            <xsl:when test="$value = 'JOULE_SECONDS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'JOULES'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'JOULES_PER_DEGREE_KELVIN'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'JOULES_PER_KILOGRAM_DEGREE_KELVIN'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'JOULES_PER_KILOGRAM_DRY_AIR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'KILO_BTUS'">kBTU</xsl:when>
            <xsl:when test="$value = 'KILO_BTUS_PER_HOUR'">kBUT/h</xsl:when>
            <xsl:when test="$value = 'KILOGRAMS'">kg</xsl:when>
            <xsl:when test="$value = 'KILOGRAMS_PER_CUBIC_METER'">kg/m3</xsl:when>
            <xsl:when test="$value = 'KILOGRAMS_PER_HOUR'">kg/h</xsl:when>
            <xsl:when test="$value = 'KILOGRAMS_PER_MINUTE'">kg/min</xsl:when>
            <xsl:when test="$value = 'KILOGRAMS_PER_SECOND'">kg/s</xsl:when>
            <xsl:when test="$value = 'KILOHERTZ'">kHz</xsl:when>
            <xsl:when test="$value = 'KILOOHMS'">kOhm</xsl:when>
            <xsl:when test="$value = 'KILOJOULES'">kJ</xsl:when>
            <xsl:when test="$value = 'KILOJOULES_PER_DEGREE_KELVIN'">kJ/K</xsl:when>
            <xsl:when test="$value = 'KILOJOULES_PER_KILOGRAM'">kJ/kg</xsl:when>
            <xsl:when test="$value = 'KILOJOULES_PER_KILOGRAM_DRY_AIR'">kJ/kg dry air</xsl:when>
            <xsl:when test="$value = 'KILOMETERS_PER_HOUR'">km/h</xsl:when>
            <xsl:when test="$value = 'KILOPASCALS'">kPa</xsl:when>
            <xsl:when test="$value = 'KILOVOLT_AMPERES'">kVA</xsl:when>
            <xsl:when test="$value = 'KILOVOLT_AMPERES_REACTIVE'">kVAR</xsl:when>
            <xsl:when test="$value = 'KILOVOLTS'">kV</xsl:when>
            <xsl:when test="$value = 'KILOWATT_HOURS'">kWh</xsl:when>
            <xsl:when test="$value = 'KILOWATTS'">kW</xsl:when>
            <xsl:when test="$value = 'KW_HOURS_PER_SQUARE_FOOT'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'KW_HOURS_PER_SQUARE_METER'">kWh/m2</xsl:when>
            <xsl:when test="$value = 'LITERS'">l</xsl:when>
            <xsl:when test="$value = 'LITERS_PER_HOUR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'LITERS_PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'LITERS_PER_SECOND'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'LUMENS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'LUXES'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'MEGA_BTUS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'MEGAHERTZ'">MHz</xsl:when>
            <xsl:when test="$value = 'MEGAJOULES'">MJ</xsl:when>
            <xsl:when test="$value = 'MEGAJOULES_PER_DEGREE_KELVIN'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'MEGAJOULES_PER_KILOGRAM_DRY_AIR'">MJ/kg dry air</xsl:when>
            <xsl:when test="$value = 'MEGAJOULES_PER_SQUARE_FOOT'">MJ / sq ft</xsl:when>
            <xsl:when test="$value = 'MEGAJOULES_PER_SQUARE_METER'">MJ/m2</xsl:when>
            <xsl:when test="$value = 'MEGAVOLT_AMPERES'">MA</xsl:when>
            <xsl:when test="$value = 'MEGAVOLT_AMPERES_REACTIVE'">MAR</xsl:when>
            <xsl:when test="$value = 'MEGAVOLTS'">MV</xsl:when>
            <xsl:when test="$value = 'MEGAWATT_HOURS'">MWh</xsl:when>
            <xsl:when test="$value = 'MEGAWATTS'">MW</xsl:when>
            <xsl:when test="$value = 'MEGOHMS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'METERS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'METERS_PER_HOUR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'METERS_PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'METERS_PER_SECOND'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'METERS_PER_SECOND_PER_SECOND'">m/s2</xsl:when>
            <xsl:when test="$value = 'MILES_PER_HOUR'">mph</xsl:when>
            <xsl:when test="$value = 'MILLIAMPERES'">mA</xsl:when>
            <xsl:when test="$value = 'MILLIBARS'">mBar</xsl:when>
            <xsl:when test="$value = 'MILLIMETERS'">mm</xsl:when>
            <xsl:when test="$value = 'MILLIMETERS_OF_MERCURY'">mmHg</xsl:when>
            <xsl:when test="$value = 'MILLIMETERS_PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'MILLIMETERS_PER_SECOND'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'MILLIOHMS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'MILLISECONDS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'MILLIVOLTS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'MILLIWATTS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'MINUTES'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'MONTHS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'NEWTON'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'NEWTON_METERS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'NEWTON_SECONDS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'NEWTONS_PER_METER'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'NO_UNITS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'OHM_METERS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'OHMS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'PARTS_PER_BILLION'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'PARTS_PER_MILLION'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'PASCALS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'PER_HOUR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'PER_SECOND'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'PERCENT'">%</xsl:when>
            <xsl:when test="$value = 'PERCENT_OBSCURATION_PER_FOOT'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'PERCENT_OBSCURATION_PER_METER'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'PERCENT_PER_SECOND'">%/s</xsl:when>
            <xsl:when test="$value = 'PERCENT_RELATIVE_HUMIDITY'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'POUNDS_FORCE_PER_SQUARE_INCH'"><xsl:value-of select="$value" />lb/??</xsl:when>
            <xsl:when test="$value = 'POUNDS_MASS'">lb</xsl:when>
            <xsl:when test="$value = 'POUNDS_MASS_PER_HOUR'">lb/h</xsl:when>
            <xsl:when test="$value = 'POUNDS_MASS_PER_MINUTE'">lb/min</xsl:when>
            <xsl:when test="$value = 'POUNDS_MASS_PER_SECOND'">lb/sec</xsl:when>
            <xsl:when test="$value = 'POWER_FACTOR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'PSI_PER_DEGREE_FAHRENHEIT'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'RADIANS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'RADIANS_PER_SECOND'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'REVOLUTIONS_PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'SECONDS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'SIEMENS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'SIEMENS_PER_METER'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'SQUARE_CENTIMETERS'">cm2</xsl:when>
            <xsl:when test="$value = 'SQUARE_FEET'">sq ft</xsl:when>
            <xsl:when test="$value = 'SQUARE_INCHES'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'SQUARE_METERS'">m2</xsl:when>
            <xsl:when test="$value = 'SQUARE_METERS_PER_NEWTON'">m2/N</xsl:when>
            <xsl:when test="$value = 'TESLAS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'THERMS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'TON_HOURS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'TONS'">T</xsl:when>
            <xsl:when test="$value = 'TONS_PER_HOUR'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'TONS_REFRIGERATION'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'US_GALLONS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'US_GALLONS_PER_MINUTE'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'VOLT_AMPERES'">VA</xsl:when>
            <xsl:when test="$value = 'VOLT_AMPERES_REACTIVE'">VAR</xsl:when>
            <xsl:when test="$value = 'VOLTS'">V</xsl:when>
            <xsl:when test="$value = 'VOLTS_PER_DEGREE_KELVIN'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'VOLTS_PER_METER'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'WATT_HOURS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'WATTS'">W</xsl:when>
            <xsl:when test="$value = 'WATTS_PER_METER_PER_DEGREE_KELVIN'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'WATTS_PER_SQUARE_FOOT'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'WATTS_PER_SQUARE_METER'">W/m2</xsl:when>
            <xsl:when test="$value = 'WATTS_PER_SQUARE_METER_DEGREE_KELVIN'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'WEBERS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'WEEKS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'YEARS'"><xsl:value-of select="$value" /></xsl:when>
            <xsl:when test="$value = 'NONE'"></xsl:when>
            <xsl:otherwise><xsl:value-of select="$value" /></xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- VersionNumberType -->
    <xsl:template match="sgr:softwareRevision">
        <xsl:call-template name="VersionNumberType" />
    </xsl:template>
    <xsl:template match="sgr:hardwareRevision">
        <xsl:call-template name="VersionNumberType" />
    </xsl:template>
    <xsl:template match="sgr:versionNumber">
        <xsl:call-template name="VersionNumberType" />
    </xsl:template>
    <xsl:template name="VersionNumberType">
        <xsl:value-of select="sgr:primaryVersionNumber" />.<xsl:value-of select="sgr:secondaryVersionNumber" />.<xsl:value-of select="sgr:subReleaseVersionNumber" />
    </xsl:template>

    <!-- SGrprofileNumber -->
    <xsl:template match="sgr:profileNumber">
        <xsl:param name="separator" select="'.'" />
        <xsl:param name="displayFullLevel" select="''"/>
        <xsl:param name="displayShortLevel" select="''"/>
        <xsl:call-template name="SGrProfileNumber">
            <xsl:with-param name="separator" select="$separator" />
            <xsl:with-param name="displayShortLevel" select="$displayShortLevel" />
            <xsl:with-param name="displayFullLevel" select="$displayFullLevel" />
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="SGrProfileNumber">
        <xsl:param name="separator" select="'.'" />
        <xsl:param name="displayFullLevel" select="''"/>
        <xsl:param name="displayShortLevel" select="''"/>
        <xsl:choose>
            <xsl:when test="sgr:specificationOwnerIdentification = 0">SGr</xsl:when>
            <xsl:otherwise><xsl:value-of select="sgr:specificationOwnerIdentification" /></xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$separator" />

        <xsl:value-of select="sgr:functionalProfileCategory" /><xsl:value-of select="$separator" /><xsl:value-of select="sgr:functionalProfileType" />
        <xsl:if test="$displayShortLevel">
            <xsl:value-of select="$separator" /><xsl:value-of select="sgr:levelOfOperation" />
        </xsl:if>

        <xsl:if test="$displayFullLevel">
            (Level <xsl:value-of select="sgr:levelOfOperation" />)
        </xsl:if>
    </xsl:template>

</xsl:stylesheet> 