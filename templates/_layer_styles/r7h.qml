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
            <prop v="247,251,255,255" k="color1"/>
            <prop v="8,48,107,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.13;222,235,247,255:0.26;198,219,239,255:0.39;158,202,225,255:0.52;107,174,214,255:0.65;66,146,198,255:0.78;33,113,181,255:0.9;8,81,156,255" k="stops"/>
          </colorramp>
          <item alpha="255" value="0" label="0 mm" color="#ffffff"/>
          <item alpha="255" value="50" label="1 - 50 mm" color="#faf3d2"/>
          <item alpha="255" value="100" label="50 - 100 mm" color="#dae3a1"/>
          <item alpha="255" value="200" label="100 - 200 mm" color="#a0c787"/>
          <item alpha="255" value="300" label="200 - 300 mm" color="#68ab79"/>
          <item alpha="255" value="400" label="300 - 400 mm" color="#9beafa"/>
          <item alpha="255" value="500" label="400 - 500 mm" color="#00b1de"/>
          <item alpha="255" value="600" label="500 - 600 mm" color="#005ae6"/>
          <item alpha="255" value="800" label="600 - 800 mm" color="#0000c8"/>
          <item alpha="255" value="1000" label="800 - 1000 mm" color="#a002fa"/>
          <item alpha="255" value="1500" label="1000 - 1500 mm" color="#fa78fa"/>
          <item alpha="255" value="inf" label="> 1500 mm" color="#ffc4ee"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0"/>
    <huesaturation colorizeOn="0" colorizeStrength="100" grayscaleMode="0" colorizeRed="255" colorizeGreen="128" colorizeBlue="128" saturation="0"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
