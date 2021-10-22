from django.urls import path
from django.contrib.auth import views as auth_views

from . import views


urlpatterns = [
    
    path("register", views.register, name='register'),
    path('profile', views.ProfileView.as_view(), name='profile'),
    
    #Django Auth
    path('login', views.login, name="login"),
    path('logout', views.logout, name="logout"),
]  