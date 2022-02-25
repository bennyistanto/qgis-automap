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
    <rasterrenderer nodataColor="" alphaBand="-1" type="singlebandpseudocolor" opacity="1" band="1" classificationMin="-8" classificationMax="8">
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
        <colorrampshader classificationMode="2" maximumValue="8" clip="0" colorRampType="INTERPOLATED" minimumValue="-8" labelPrecision="0">
          <colorramp type="gradient" name="[source]">
            <prop v="215,25,28,255" k="color1"/>
            <prop v="43,131,186,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.25;253,174,97,255:0.5;255,255,191,255:0.75;171,221,164,255" k="stops"/>
          </colorramp>
          <item label="&lt; -8 deg" alpha="255" color="#0b2c7a" value="-400"/>
          <item label="-8 to -6 deg" alpha="255" color="#005ce6" value="-300"/>
          <item label="-6 to -4 deg" alpha="255" color="#00c5ff" value="-200"/>
          <item label="-4 to -2 deg" alpha="255" color="#6de5c5" value="-100"/>
          <item label="-2 to +2 deg" alpha="255" color="#feffd5" value="0"/>
          <item label="+2 to +4 deg" alpha="255" color="#fcf003" value="100"/>
          <item label="+4 to +6 deg" alpha="255" color="#f0b411" value="200"/>
          <item label="+6 to +8 deg" alpha="255" color="#db7a25" value="300"/>
          <item label="> +8 deg" alpha="255" color="#c2523c" value="400"/>
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
