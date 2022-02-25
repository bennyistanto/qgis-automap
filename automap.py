import os
import pathlib
import sys

import click 
import pandas as pd
from PyQt5.QtWidgets import *
from PyQt5 import QtCore
from qgis.core import QgsRasterLayer, QgsApplication, QgsMessageLogNotifyBlocker
from shutil import copyfile
import warnings

if not sys.warnoptions:
    warnings.simplefilter("ignore")

sys.path.append('scripts/')
import functions
import preProduce
sys.path.append('../')

# to remove PNG overwritting message
from osgeo import gdal
gdal.PushErrorHandler('CPLQuietErrorHandler')
gdal.SetConfigOption("GDAL_PAM_ENABLED", "NO")

#Initialize QGIS Application
qgs = QgsApplication([], False)
qgs.initQgis()

@click.command()
@click.option('--select', is_flag=True, help='Select the products to map')
@click.option('--overwrite', is_flag=True, help='Overwrite existing maps')
@click.option('--input', is_flag=True, help='Select input path')
@click.option('--output', is_flag=True, help='Select output path')
def cli(select: bool,
        overwrite: bool,
        input: bool,
        output: bool):

    """Produces PNG maps from tiff files with QGis

    Args:
        select (bool): Select the products to map
        overwrite (bool): Overwrite existing maps
        input (bool):  Select input path
        output (bool):  Select output path
    """


    # Setting paths
    template_path = "templates/_qgz"
    tab_path = "csv/product_type.csv"
    colorRamp_path = "templates/_layer_styles"



    # Selecting path of input directory
    if input:
        products_path = str(QFileDialog.getExistingDirectory(None, "Select Input directory"))
    else:
        products_path = "products"



    # Selecting path of ouput directory
    if output:
        export_path = str(QFileDialog.getExistingDirectory(None, "Select Output directory"))
    else:
        export_path = "maps"
    template_folder = pathlib.PurePath(template_path).name    
    export_path = os.path.join(export_path, template_folder[:-4])
    if not os.path.exists(export_path):
        os.makedirs(export_path)


    # Getting products to map
    products_names = find_files(products_path, '.tif')

    # reading csv files
    tab = pd.read_csv(tab_path, index_col = 0, header = 0)

    valid_products_names = []
    # check if name correct
    for filename in products_names:

        check = functions.check_name(pathlib.PurePath(filename).name, tab)
        if check:
            valid_products_names.append(filename)
    
    if len(valid_products_names)==0:
        w = QWidget()
        w.resize(400, 100)
        w.setWindowTitle('ERROR')
        vbox = QVBoxLayout(w)
        label = QLabel("No valid products to map !")
        label.setAlignment(QtCore.Qt.AlignCenter)
        vbox.addWidget(label)
        w.show()
        sys.exit(qgs.exec_())

    products_names = valid_products_names


    # Only select new products
    if not overwrite:
        input_names = products_names 
        output_names = [p[:-4]+'.tif' for p in find_files(export_path, '.png')]
        products_names = list(set(input_names).difference(output_names))
        products_names.sort()

        if len(products_names)==0 :
            print('No new products to map !')
            sys.exit()

    products = [QgsRasterLayer(os.path.join(products_path,p), p) for p in products_names]
    all_types = [functions.get_parname(pathlib.PurePath(filename).name, tab) for filename in products_names]
    products_type = list(dict.fromkeys(all_types))
    nb_products_type = [all_types.count(p) for p in products_type]
    

    # Select products to map
    if select:

        w = QWidget()
        w.resize(400, int(w.height()/10))
        w.setWindowTitle('Automap - Select products to map')

        vbox = QVBoxLayout(w)

        # Products checkbox
        bxs = []
        bxs_name = []
        for i,p in enumerate(products_type):
            bxs.append(QCheckBox(p + '\t \t \t(' + str(nb_products_type[i]) + ')'))
            bxs_name.append(p)
            bxs[i].setChecked(True)
            vbox.addWidget(bxs[i])

        # Produce maps button
        hbox = QHBoxLayout()
        btn = QPushButton("Produce maps")
        btn.setFixedSize(QtCore.QSize(200, 30))
        hbox.addWidget(btn)
        vbox.addLayout(hbox)
        btn.clicked.connect(lambda: mapping(w, bxs, bxs_name, 
                                            template_path, colorRamp_path, products_names, 
                                            products_path, export_path, tab))

        w.show()
        sys.exit(qgs.exec_())

    else:
        preProduce.Map(template_path, colorRamp_path, products_names, export_path, products_path)



def mapping(w, bxs, bxs_name, template_path, colorRamp_path, products_names, products_path, export_path, tab):

    w.close()

    bxs_txt = [bxs_name[i] for i,bx in enumerate(bxs) if bx.isChecked()]
    sel_products_names = [filename for filename in products_names if functions.get_parname(pathlib.PurePath(filename).name, tab) in bxs_txt]

    preProduce.Map(template_path, colorRamp_path, sel_products_names, export_path, products_path)



def find_files(path: str, end: str):

    products = []
    for subdir, dirs, files in os.walk(path):
        for file in files:

            if file.endswith(end):
                products.append(file)
                
    return products


if __name__ == '__main__':
    cli()