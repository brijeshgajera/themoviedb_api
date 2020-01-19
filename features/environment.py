from behave import *

def before_scenario(context,scenario):
    context.dict_get_data={}
    context.request_body={}