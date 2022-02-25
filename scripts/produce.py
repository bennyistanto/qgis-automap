import os
from os import path
import glob
import pathlib

import sys
from shutil import copyfile
import functions
import pandas as pd 
from qgis.core import *


qgs = QgsApplication([], False)
qgs.initQgis()

# to remove PNG overwritting message
from osgeo import gdal
gdal.PushErrorHandler('CPLQuietErrorHandler')
gdal.SetConfigOption("GDAL_PAM_ENABLED", "NO")


template_path = sys.argv[1]
colorRamp_path = sys.argv[2]
product_name = sys.argv[3]
export_path = sys.argv[4]
products_path = sys.argv[5]
n = sys.argv[6]
i = sys.argv[7]
j = sys.argv[8]

if int(j)==0:
	print('Producing map ' + product_name + ' (' + i + ' of ' + n + ')')


# Load template
project = QgsProject.instance()
project.read(template_path)


# Adding product to map
product = QgsRasterLayer(os.path.join(products_path,product_name), product_name)
project.addMapLayer(product, False)
root = project.layerTreeRoot()
node_layer = root.addLayer(product)


# Setting Color scale
tab = pd.read_csv("csv/product_type.csv", index_col = 0, header = 0)
colorRamp = functions.get_colorRamp(pathlib.PurePath(product_name).name, tab)
layer_style = os.path.join(colorRamp_path, colorRamp + '.qml')
product.loadNamedStyle(layer_style)


# Get layout and items
manager = project.layoutManager()
layout = manager.printLayouts()[0]
items = layout.items()


# Change subtitles
sub1 = functions.get_parname(pathlib.PurePath(product_name).name, tab)
sub2 = functions.get_timestamp(pathlib.PurePath(product_name).name)

labels = [x for x in items if isinstance(x, QgsLayoutItemLabel)]

for label in labels:
	if label.text() == 'subtitle1':
		label.setText(sub1)
	elif label.text() == 'subtitle2':
		label.setText(sub2)


# Updating Legend
legend = [x for x in items if isinstance(x, QgsLayoutItemLegend)][0]
par = product_name[3:6] 

#if colorRamp == 'tda' or colorRamp == 'vim' or colorRamp == 'taa':
if colorRamp == 'tda' or colorRamp == 'taa':	
	leg = QgsLayoutItemPicture(layout)
	leg.setPicturePath(os.path.join(colorRamp_path, colorRamp + '_legend.png'))
	leg.attemptMove(legend.positionWithUnits())
	leg.setResizeMode(4)
	layout.addItem(leg)

	group = legend.model().rootGroup()
	group.clear()

else:	
	group = legend.model().rootGroup()
	group.insertChildNode(0, QgsLayerTreeLayer(product))
	group.children()[0].setName('')


# Export map as PNG
exporter = QgsLayoutExporter(layout)
folder_ = os.path.join(export_path, os.path.basename(os.path.normpath(template_path))[:-4])
map_name = os.path.join(folder_, product_name[:-4] + '.png')
folder = os.path.join(folder_, os.path.dirname(product_name))

if not os.path.exists(folder):
    os.makedirs(folder)

image_settings = exporter.ImageExportSettings()
image_settings.exportMetadata = False

exporter.exportToImage(map_name, image_settings)

qgs.exitQgis()


		
