from django.conf.urls import url,include
from django.conf import settings
from django.conf.urls.static import static
from . import views

urlpatterns = [
    url(r'^$',views.landing),
    url(r'^home/',views.home,name='home'),
    url(r'^therapist/',views.therapist,name='therapist'),
    url(r'^shelter/(?P<id>\w+)$',views.apartment,name='apartment'),
    url(r'^profile/$',views.profile,name='profile'),
    url(r'^accounts/edit/', views.edit_profile, name='edit_profile'),
    url('^lipaonline/$', views.lipa_na_mpesa, name='lipa_online'),
    url('^token/$',views.access_token,name='access_token'),
    url('^map/$',views.map,name='map')
]
if settings.DEBUG:
    urlpatterns+= static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)