import re
from datetime import datetime, timedelta
import pandas as pd

def is_leap(year):
	
    year = int(year)
    
    if year % 400 == 0: 
        return True
    elif year % 100 == 0:
        return False
    elif year % 4 == 0:
        return True
    else:
        return False

    
def shift_date_N_days(year, month, day, N, direction='forward'):

    old_date = datetime.strptime(year + month + day, '%Y%m%d')

    if direction == 'forward':
        new_date = old_date + timedelta(N)
    elif direction == 'backward':
        new_date = old_date - timedelta(N)
    
    day = '{:%d}'.format(new_date)
    month = '{:%m}'.format(new_date)
    year = '{:%Y}'.format(new_date)
    
    return year, month, day


def dek_to_lastday(dek, month, year):

    if dek == 'D1':
        last_day = '10'
    elif dek == 'D2':
        last_day = '20'
    elif dek == 'D3':
        if month == '02':
            try:
                last_day = '29' if is_leap(year) else '28'
            except:
                last_day = 28 #if _AVG
        elif month in ['04', '06', '09', '11']:
            last_day = '30'
        else:
            last_day = '31'
    
    return last_day



def convert_modis_date(julian_date, year):
    
    dt_date = datetime.strptime(year + julian_date[-3:], '%Y%j')
    return '{:02d}'.format(dt_date.month), '{:02d}'.format(dt_date.day)
    


def get_parname(filename: str, tab: pd.DataFrame):

    filename = filename.upper()
    par = filename[3:6]
    date = filename[6:14]

    pname = tab.loc[par]['Title']

    agg_types = {'MIN': 'Minimum ', 'MAX': 'Maximum ', 'AVG': 'Average ', 'COV': 'Coeff of Variation '}

    if date.startswith('_'):
        agg = agg_types.get(date[1:4])
    else:
        agg = ''

    parname = agg + pname

    return parname



def get_timestamp(filename: str):

    filename = filename.upper()
    
    par = filename[3:6]
    date = filename[6:14]
    year = filename[6:10]
    month = filename[10:12]
    day = filename[12:14]

    if month.startswith('J'): 
        julian_date = month[1:] + day
        month, day = convert_modis_date(julian_date, year)
        new_year, new_month, new_day = shift_date_N_days(year, month, day, 16, direction='forward')
        start_date = '{} {:%b} {}'.format(day, datetime.strptime(month, '%m'), year)
        end_date = '{} {:%b} {}'.format(new_day, datetime.strptime(new_month, '%m'), new_year)
        t_stamp = '{} - {}'.format(start_date, end_date)
        
    else:
        dek = filename[12:14]
        day = dek_to_lastday(dek, month, year)

        duration_code = par[1]
        
        if duration_code == 'F':
            t_legend = 'in the 10 days ending'
        elif duration_code == 'Y':
            t_legend = 'in the year ending'
        elif duration_code == '1':
            t_legend = 'in the 1 month ending'
        elif duration_code.isdigit():
            t_legend = 'in the ' + duration_code + ' months ending'
        elif duration_code == 'L':
            t_legend = 'in the 30 days \n ending'
        else:
            t_legend = 'in the 10 days ending'
        
        if year.startswith('_'):
            year = ''

        t_stamp = '{} {} {:%b} {}'.format(t_legend, day, datetime.strptime(month, '%m'), year)
    
    return t_stamp    


def get_colorRamp(filename: str, tab: pd.DataFrame):

    filename = filename.upper()

    par = str(filename[3:6])

    colorRamp = tab.loc[par]['Color Ramp']

    return colorRamp



def check_name(filename: str, tab: pd.DataFrame):

    filename = filename.upper()
    
    try:
        get_parname(filename, tab)
    except:
        return False

    try:
        get_timestamp(filename)
    except:
        return False


    return True








