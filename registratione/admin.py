from django.contrib import admin
from .models import Profile,Shelter,LNMOnline,Receipt,Booking
from django.contrib.gis.admin import OSMGeoAdmin
from django.contrib.gis.db import models
from django import forms
from mapwidgets.widgets import GooglePointFieldWidget, GooglePointFieldInlineWidget, GoogleStaticMapWidget, \
    GoogleStaticOverlayMapWidget
# Register your models here.

from django.forms import ModelForm
from floppyforms.gis import PointWidget,BaseGMapWidget,PointField


class LNMOnlineAdmin(admin.ModelAdmin):
    list_display = ("PhoneNumber","Amount","MpesaReceiptNumber","TransactionDate")


class CustomPointWidget(PointWidget, BaseGMapWidget):
    class Media:
        google_maps_api_key = 'AIzaSyDVcTNwyy3SjCZ6TiEPT1bz8o46Y_lnevo'
        js = ('/images/floppyforms/js/MapWidget.js',)

class ShelterAdminForm(ModelForm):
    class Meta:
        model = Shelter
        fields = ['name','owner_phone','photo','contact','description','region','location']
        widgets = {
            'location': CustomPointWidget()
        }

class ShelterAdmin(admin.ModelAdmin):
    form = ShelterAdminForm

admin.site.register(Shelter,ShelterAdmin)
admin.site.register(Profile)
admin.site.register(LNMOnline,LNMOnlineAdmin)
admin.site.register(Receipt)
admin.site.register(Booking)


