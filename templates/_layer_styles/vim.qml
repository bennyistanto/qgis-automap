<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" minScale="1e+08" maxScale="0" version="3.16.8-Hannover" styleCategories="AllStyleCategories">
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
      <resampling enabled="false" zoomedInResamplingMethod="nearestNeighbour" maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer alphaBand="-1" classificationMin="0" nodataColor="" band="1" type="singlebandpseudocolor" opacity="1" classificationMax="10000">
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
        <colorrampshader colorRampType="INTERPOLATED" maximumValue="10000" labelPrecision="0" classificationMode="2" clip="1" minimumValue="0">
          <colorramp type="gradient" name="[source]">
            <prop v="166,97,26,255" k="color1"/>
            <prop v="1,133,113,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.25;223,194,125,255:0.5;245,245,245,255:0.75;128,205,193,255" k="stops"/>
          </colorramp>
          <item label="0" color="#a6611a" value="0" alpha="255"/>
          <item label="0.1" color="#bd8841" value="1000" alpha="255"/>
          <item label="0.2" color="#d4af69" value="2000" alpha="255"/>
          <item label="0.3" color="#e4cc95" value="3000" alpha="255"/>
          <item label="0.4" color="#ede1c5" value="4000" alpha="255"/>
          <item label="0.5" color="#f5f5f5" value="5000" alpha="255"/>
          <item label="0.6" color="#c6e5e1" value="6000" alpha="255"/>
          <item label="0.7" color="#97d5cc" value="7000" alpha="255"/>
          <item label="0.8" color="#67bfb1" value="8000" alpha="255"/>
          <item label="0.9" color="#34a291" value="9000" alpha="255"/>
          <item label="1" color="#018571" value="10000" alpha="255"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast brightness="0" contrast="0" gamma="1"/>
    <huesaturation colorizeRed="255" colorizeGreen="128" colorizeBlue="128" saturation="0" grayscaleMode="0" colorizeOn="0" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
