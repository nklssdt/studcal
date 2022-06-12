import json, functions_helper
from token import MINEQUAL
from urllib.request import urlopen

# store the URL in url as 
# parameter for urlopen
url = "https://api.mensa.legacymo.de/"
  
# store the response of URL
response = urlopen(url)
  
# storing the JSON response 
# from url in data
data_json = json.loads(response.read())

def load_dish_dates():
    data = {}
    data['day1'] = functions_helper.mensa_date_conv(0)
    data['day2'] = functions_helper.mensa_date_conv(1)
    data['day3'] = functions_helper.mensa_date_conv(2)
    data['day4'] = functions_helper.mensa_date_conv(3)
    data['day5'] = functions_helper.mensa_date_conv(4)

    return data

def view_dishes():
    data = {}
    data['menu_0_0'] = data_json[0]['food'][0]['meal'][0]['name']
    data['menu_p_0_0'] = data_json[0]['food'][0]['meal'][0]['costs']['a']
    data['menu_0_1'] = data_json[0]['food'][1]['meal'][0]['name']
    data['menu_p_0_1'] = data_json[0]['food'][1]['meal'][0]['costs']['a']
    data['menu_0_2'] = data_json[0]['food'][2]['meal'][0]['name']
    data['menu_p_0_2'] = data_json[0]['food'][2]['meal'][0]['costs']['a']

    data['menu_1_0'] =  data_json[1]['food'][0]['meal'][0]['name']
    data['menu_p_1_0'] = data_json[1]['food'][0]['meal'][0]['costs']['a']
    data['menu_1_1'] = data_json[1]['food'][1]['meal'][0]['name']
    data['menu_p_1_1'] = data_json[1]['food'][1]['meal'][0]['costs']['a']
    data['menu_1_2'] = data_json[1]['food'][2]['meal'][0]['name']
    data['menu_p_1_2'] = data_json[1]['food'][2]['meal'][0]['costs']['a']

    data['menu_2_0'] =  data_json[2]['food'][0]['meal'][0]['name']
    data['menu_p_2_0'] = data_json[2]['food'][0]['meal'][0]['costs']['a']
    data['menu_2_1'] = data_json[2]['food'][1]['meal'][0]['name']
    data['menu_p_2_1'] = data_json[2]['food'][1]['meal'][0]['costs']['a']
    data['menu_2_2'] = data_json[2]['food'][2]['meal'][0]['name']
    data['menu_p_2_2'] = data_json[2]['food'][2]['meal'][0]['costs']['a']
    
    data['menu_3_0'] =  data_json[3]['food'][0]['meal'][0]['name']
    data['menu_p_3_0'] = data_json[3]['food'][0]['meal'][0]['costs']['a']
    data['menu_3_1'] = data_json[3]['food'][1]['meal'][0]['name']
    data['menu_p_3_1'] = data_json[3]['food'][1]['meal'][0]['costs']['a']
    data['menu_3_2'] = data_json[3]['food'][2]['meal'][0]['name']
    data['menu_p_3_2'] = data_json[3]['food'][2]['meal'][0]['costs']['a']
    
    data['menu_4_0'] =  data_json[4]['food'][0]['meal'][0]['name']
    data['menu_p_4_0'] = data_json[4]['food'][0]['meal'][0]['costs']['a']
    data['menu_4_1'] = data_json[4]['food'][1]['meal'][0]['name']
    data['menu_p_4_1'] = data_json[4]['food'][1]['meal'][0]['costs']['a']
    data['menu_4_2'] = data_json[4]['food'][2]['meal'][0]['name']
    data['menu_p_4_2'] = data_json[4]['food'][2]['meal'][0]['costs']['a']

    return data