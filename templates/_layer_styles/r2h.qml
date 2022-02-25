<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" version="3.16.8-Hannover" styleCategories="AllStyleCategories" minScale="1e+08" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <customproperties>
    <property value="false" key="WMSBackgroundLayer"/>
    <property value="false" key="WMSPublishDataSourceUrl"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="Value" key="identify/format"/>
  </customproperties>
  <pipe>
    <rasterrenderer opacity="1" alphaBand="-1" band="1" classificationMin="-1" classificationMax="inf" type="singlebandpseudocolor">
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
        <colorrampshader colorRampType="DISCRETE" classificationMode="1" clip="0">
          <colorramp name="[source]" type="gradient">
            <prop v="250,250,250,255" k="color1"/>
            <prop v="5,5,5,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
          </colorramp>
          <item alpha="255" value="0" label="0 mm" color="#ffffff"/>
          <item alpha="255" value="20" label="1 - 20 mm" color="#faf3d2"/>
          <item alpha="255" value="40" label="20 - 40 mm" color="#dae3a1"/>
          <item alpha="255" value="60" label="40 - 60 mm" color="#a0c787"/>
          <item alpha="255" value="90" label="60 - 90 mm" color="#68ab79"/>
          <item alpha="255" value="120" label="90 - 120 mm" color="#9beafa"/>
          <item alpha="255" value="150" label="120 - 150 mm" color="#00b1de"/>
          <item alpha="255" value="200" label="150 - 200 mm" color="#005ae6"/>
          <item alpha="255" value="250" label="200 - 250 mm" color="#0000c8"/>
          <item alpha="255" value="300" label="250 - 300 mm" color="#a002fa"/>
          <item alpha="255" value="350" label="300 - 350 mm" color="#fa78fa"/>
          <item alpha="255" value="inf" label="> 350 mm" color="#ffc4ee"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0"/>
    <huesaturation colorizeOn="0" colorizeStrength="100" grayscaleMode="0" colorizeRed="255" colorizeGreen="128" colorizeBlue="128" saturation="0"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
