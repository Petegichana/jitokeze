from django.conf.urls import url

from registratione.api.views import LNMCallbackUrlAPIView

urlpatterns=[
    url("lnm/",LNMCallbackUrlAPIView.as_view(),name="lnm-callbackurl"),
]