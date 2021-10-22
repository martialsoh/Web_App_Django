from django.http import HttpRequest, HttpResponse
from django.shortcuts import render


def index(request):
    return render(request, 'index.html')

   # template = loader.get_template('index.html')           
   # return HttpResponse(template.render({}, request))

def about(request):
    return render(request, 'about.html')

def contact(request):
    return render(request, 'contact.html')