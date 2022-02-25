import os
import subprocess as sp

# to remove PNG overwritting message
from osgeo import gdal
gdal.PushErrorHandler('CPLQuietErrorHandler')
gdal.SetConfigOption("GDAL_PAM_ENABLED", "NO")


def Map(template_path: str, colorRamp_path: str, products_names: list, export_path: str, products_path: str):


	for i,product_name in enumerate(products_names):

		n = str(len(products_names))

		temps = ['Region1.qgz', 'Region2.qgz', 'Region3.qgz'] 

		for j,t in enumerate(temps):

			template_p = os.path.join(template_path,t)

			sp.run(['python','scripts/produce.py', template_p, colorRamp_path, product_name, export_path, products_path, n, str(i+1), str(j)]) 