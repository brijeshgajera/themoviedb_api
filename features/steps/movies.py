from behave import *
import requests
from urllib.parse import urljoin
import json


settings = {
        "url": "https://api.themoviedb.org/3"
}


@given(u'A user with "{attribute}" as "{value}"')
def set_api_key(context, attribute, value):
    context.dict_get_data[attribute]=value


@step(u'user wants movies data from "{attribute}" number "{value}"')
def set_page_number(context, attribute, value):
    context.dict_get_data[attribute]= value


@when(u'user submits the request "{query_url}" to get top rated movies')
def execute_request_to_get_movie_data(context, query_url):
    response = requests.get(settings["url"]+query_url, params=context.dict_get_data)
    context.response_body = response.json()
    context.status_code = response.status_code

@then(u'you should receive a "{code}" status code')
def check_status_code(context, code):
    assert context.status_code == int(code)

@step(u'"{attribute}" number "{value}" should be there in response body')
def check_page_number(context, attribute, value):
    assert context.response_body[attribute] == int(value)


@step(u'user wants to rate movie which has movie id as {value}')
def step_impl(context, value):
    context.movie_id= value


@step(u'user provides rating "{attribute}" as "{value}"')
def set_rating(context, attribute, value):
    context.request_body[attribute] = value


@when(u'user submits the request "{attribute}" to provide rating for this movie')
def provide_rating(context, attribute):
    response = requests.post(settings["url"]+attribute.replace("movie_id", context.movie_id), params=context.dict_get_data, json=context.request_body)
    context.response_body = response.json()
    context.status_code = response.status_code


@then(u'"{attribute}" should be "{value}" in response body')
def check_response(context, attribute, value):
    assert value in context.response_body[attribute]

