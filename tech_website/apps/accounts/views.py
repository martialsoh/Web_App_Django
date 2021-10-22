from django.views.generic.base import TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin

from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User, auth
from django.contrib import messages

class ProfileView(LoginRequiredMixin, TemplateView):
             template_name = 'accounts/profile.html'

def register(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        password2 = request.POST['password2']
        if password == password2:  
           if User.objects.filter(email=email).exits():
              messages.info(request, 'Email Already Used')
              return redirect('register')
           elif User.objects.filter(username=username).exits():
               messages.info(request, 'Username Already Used')
               return redirect('register')
           else:
               user = User.object.create_user(username=username, email=email, password=password)
               user.save();
               return redirect('login')
        else:
            messages.info(request, 'Password Not The Same')
            return redirect('register')
    else:
        return render(request, 'register.html')


def login (request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        user =auth.authenticate(username=username, password=password)
        if user is not None:
            auth.login(request, user)
            return redirect('/')
        else:
            messages.info(request, 'Credentials Invalid')
            return redirect('login')
    else:
        return render (request, 'accounts/login.html')

def logout(request):
    auth.logout(request)
    return redirect('/')
