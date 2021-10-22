from django.contrib import admin

# Register your models here.
from .models import UserInterest, UserProfile, UserPersona

admin.site.register(UserProfile)
admin.site.register(UserPersona)
admin.site.register(UserInterest)