<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <xsl:import href="SGrGenericDataPointDefinitions.xsl" />
    <xsl:import href="SGrGenericHelpers.xsl" />

    <!-- modbusInterfaceDesc -->
    <xsl:template match="sgr:modbusInterfaceDesc">
        <tr class="genericDetails">
            <td>Interface Type</td>
            <td>
                <xsl:value-of select="sgr:modbusInterfaceSelection" />
            </td>
        </tr>

        <!-- trspSrvModbusTCPoutOfBox (1x opt) -->
        <xsl:if test="sgr:trspSrvModbusTCPoutOfBox">
            <tr class="transportDetails">
                <td>TCP</td>
                <td>
                    <xsl:call-template name="join">
                        <xsl:with-param name="valueList" select="sgr:trspSrvModbusTCPoutOfBox/sgr:address/*" />
                        <xsl:with-param name="separator" select="'.'" />
                    </xsl:call-template>
                    :
                    <xsl:value-of select="sgr:trspSrvModbusTCPoutOfBox/sgr:port" />
                    - SlaveID
                    <xsl:value-of select="sgr:trspSrvModbusTCPoutOfBox/sgr:slaveID" />
                </td>
            </tr>
        </xsl:if>

        <!-- trspSrvModbusRTUoutOfBox (1x opt) -->
        <xsl:if test="sgr:trspSrvModbusRTUoutOfBox">
            <tr class="transportDetails">
                <td>RTU</td>
                <td>
                    Slave Adress:
                    <xsl:value-of select="sgr:trspSrvModbusRTUoutOfBox/sgr:slaveAddr" />
                    <br />
                    Baud Rate:
                    <xsl:value-of select="sgr:trspSrvModbusRTUoutOfBox/sgr:baudRateSelected" />
                    <br />
                    Data Bits:
                    <xsl:value-of select="sgr:trspSrvModbusRTUoutOfBox/sgr:byteLenSelected" />
                    <br />
                    Parity:
                    <xsl:value-of select="sgr:trspSrvModbusRTUoutOfBox/sgr:paritySelected" />
                    <br />
                    Stop Bit:
                    <xsl:value-of select="sgr:trspSrvModbusRTUoutOfBox/sgr:stopBitLenSelected" />
                    <br />

                    <h3>Capabilities</h3>
                    Baud Rate:
                    <xsl:call-template name="join">
                        <xsl:with-param name="valueList" select="sgr:trspSrvModbusRTUoutOfBox/sgr:serialInterfaceCapability/sgr:baudRatesSupported" />
                        <xsl:with-param name="separator" select="','" />
                    </xsl:call-template>
                    <br />
                    Data Bits:
                    <xsl:call-template name="join">
                        <xsl:with-param name="valueList" select="sgr:trspSrvModbusRTUoutOfBox/sgr:serialInterfaceCapability/sgr:byteLenSupported" />
                        <xsl:with-param name="separator" select="','" />
                    </xsl:call-template>
                    <br />
                    Parity:
                    <xsl:call-template name="join">
                        <xsl:with-param name="valueList" select="sgr:trspSrvModbusRTUoutOfBox/sgr:serialInterfaceCapability/sgr:paritySupported" />
                        <xsl:with-param name="separator" select="','" />
                    </xsl:call-template>
                    <br />
                    Stop Bit:
                    <xsl:call-template name="join">
                        <xsl:with-param name="valueList" select="sgr:trspSrvModbusRTUoutOfBox/sgr:serialInterfaceCapability/sgr:stopBitLenSupported" />
                        <xsl:with-param name="separator" select="','" />
                    </xsl:call-template>
                    <br />
                </td>
            </tr>
        </xsl:if>

        <!-- firstRegisterAddressIsOne -->
        <tr class="transportDetails">
            <td>First Register Address</td>
            <td>
                <xsl:choose>
                    <xsl:when test="sgr:firstRegisterAddressIsOne='true'">1 </xsl:when>
                    <xsl:otherwise>0</xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>

        <!-- conversionScheme -->
        <tr class="transportDetails">
            <td>Conversion Scheme</td>
            <td>
                <xsl:call-template name="join">
                    <xsl:with-param name="valueList" select="sgr:conversionScheme" />
                    <xsl:with-param name="separator" select="', '" />
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>

    <!-- Attributes Modbus -->
    <xsl:template match="sgr:modbusAttr">
        <!--scalingByMulPwr-->
        <xsl:if test="sgr:scalingByMulPwr">
            <tr class="transportDetails">
                <td>
                    <img src="/xsl/modbus.png" alt="Modbus" width="60px" />
                    Scaling
                </td>
                <td>
                    <xsl:value-of select="sgr:scalingByMulPwr/sgr:multiplicator" />
                    x 10e
                    <xsl:value-of select="sgr:scalingByMulPwr/sgr:powerof10" />
                </td>
            </tr>
        </xsl:if>

        <!--stepByIncrement-->
        <xsl:if test="sgr:stepByIncrement">
            <tr class="transportDetails">
                <td>
                    <img src="/xsl/modbus.png" alt="Modbus" width="60px" />
                    Step by Increment
                </td>
                <td>
                    <xsl:value-of select="sgr:stepByIncrement" />
                    ms
                </td>
            </tr>
        </xsl:if>

        <!--sunssf-->
        <xsl:if test="sgr:sunssf">
            <tr class="transportDetails">
                <td>
                    <img src="/xsl/modbus.png" alt="Modbus" width="60px" />
                    Sunspec Scale Factor
                </td>
                <td>
                    <xsl:value-of select="sgr:sunssf" />
                    ms
                </td>
            </tr>
        </xsl:if>

        <!--pollLatencyMS-->
        <xsl:if test="sgr:pollLatencyMS">
            <tr class="transportDetails">
                <td>
                    <img src="/xsl/modbus.png" alt="Modbus" width="60px" />
                    Polling Latency
                </td>
                <td>
                    <xsl:value-of select="sgr:pollLatencyMS" />
                    ms
                </td>
            </tr>
        </xsl:if>

        <!--timeSyncBlockNotification-->
        <xsl:if test="sgr:timeSyncBlockNotification">
            <tr class="transportDetails">
                <td>
                    <img src="/xsl/modbus.png" alt="Modbus" width="60px" />
                    Time Sync Block Notification
                </td>
                <td>
                    Block
                    <xsl:value-of select="sgr:timeSyncBlockNotification/sgr:blockNumber" />
                    :
                    <xsl:value-of select="sgr:timeSyncBlockNotification/sgr:timeoutMs" />
                    ms
                </td>
            </tr>
        </xsl:if>

        <!--accessProtection-->
        <xsl:if test="sgr:accessProtection">
            <tr class="transportDetails">
                <td>
                    <img src="/xsl/modbus.png" alt="Modbus" width="60px" />
                    Access Protection
                </td>
                <td>
                    <xsl:choose>
                        <xsl:when test="sgr:accessProtection/@isEnabled">Enabled: </xsl:when>
                        <xsl:otherwise>Disabled: </xsl:otherwise>
                    </xsl:choose>
                    <xsl:for-each select="sgr:accessProtection/sgr:modbusException">
                        <xsl:value-of select="." />
                        &#160;
                    </xsl:for-each>
                </td>
            </tr>
        </xsl:if>

        <!--layer6Deviation-->
        <xsl:if test="sgr:layer6Deviation">
            <tr class="transportDetails">
                <td>
                    <img src="/xsl/modbus.png" alt="Modbus" width="60px" />
                    ISO/OSI Layer 6 Data Type
                </td>
                <td>
                    <xsl:value-of select="sgr:layer6Deviation" />
                </td>
            </tr>
        </xsl:if>

    </xsl:template>

    <xsl:template match="sgr:modbusDataType">
        <xsl:call-template name="SGrModbusDataPointTypeType" />
    </xsl:template>

    <xsl:template name="SGrModbusDataPointTypeType">
        <xsl:choose>
            <xsl:when test="sgr:enum2bitmapIndex">bitmap</xsl:when> <!-- TODO Simon: render the differnet bitmap types -->
            <xsl:when test="sgr:boolean">boolean</xsl:when>
            <xsl:when test="sgr:int8">byte</xsl:when>
            <xsl:when test="sgr:int16">short</xsl:when>
            <xsl:when test="sgr:int32">integer</xsl:when>
            <xsl:when test="sgr:int64">long</xsl:when>
            <xsl:when test="sgr:int8U">unsigned byte</xsl:when>
            <xsl:when test="sgr:int16U">unsigned short</xsl:when>
            <xsl:when test="sgr:int32U">unsigned int</xsl:when>
            <xsl:when test="sgr:int64U">unsigned long</xsl:when>
            <xsl:when test="sgr:float32">float</xsl:when>
            <xsl:when test="sgr:float64">double</xsl:when>
            <xsl:when test="sgr:enum"><xsl:apply-templates select="sgr:enum" /></xsl:when> <!-- TODO Simon: map enum -->
            <xsl:when test="sgr:dateTime">date time</xsl:when>
            <xsl:when test="sgr:string">string</xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>  