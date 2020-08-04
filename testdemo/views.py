import json
from django.shortcuts import render
from django.shortcuts import HttpResponse


def test_view(request):

    return render(request, 'about.html')


def test_api(request):

    return HttpResponse(json.dumps({
        "code": 200,
        "message": "success!",
        "data": "测试接口"
    }), content_type="application/json")


