<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" version="3.16.8-Hannover" styleCategories="AllStyleCategories" maxScale="0" minScale="1e+08">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal mode="0" enabled="0" fetchMode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <property key="WMSBackgroundLayer" value="false"/>
    <property key="WMSPublishDataSourceUrl" value="false"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="identify/format" value="Value"/>
  </customproperties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" enabled="false"/>
    </provider>
    <rasterrenderer nodataColor="" alphaBand="-1" type="singlebandpseudocolor" opacity="1" band="1" classificationMin="0" classificationMax="10000">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader classificationMode="2" maximumValue="10000" clip="0" colorRampType="INTERPOLATED" minimumValue="0" labelPrecision="0">
          <colorramp type="gradient" name="[source]">
            <prop v="166,97,26,255" k="color1"/>
            <prop v="1,133,113,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.25;223,194,125,255:0.5;245,245,245,255:0.75;128,205,193,255" k="stops"/>
          </colorramp>
          <item label="0" alpha="255" color="#a6611a" value="0"/>
          <item label="1667" alpha="255" color="#cca25c" value="1666.6666666666667"/>
          <item label="3333" alpha="255" color="#e7d3a5" value="3333.3333333333335"/>
          <item label="5000" alpha="255" color="#f5f5f5" value="5000"/>
          <item label="6667" alpha="255" color="#a7dbd3" value="6666.666666666667"/>
          <item label="8333" alpha="255" color="#56b5a6" value="8333.333333333334"/>
          <item label="10000" alpha="255" color="#018571" value="10000"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0" gamma="1"/>
    <huesaturation colorizeBlue="128" colorizeGreen="128" colorizeStrength="100" colorizeOn="0" grayscaleMode="0" saturation="0" colorizeRed="255"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
