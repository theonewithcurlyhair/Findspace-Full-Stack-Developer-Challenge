from django.contrib import admin
from django.urls import path, include, re_path
from frontend import views
from django.contrib.sitemaps.views import sitemap
from leads.models import Lead

info_dict = {
    'queryset': Lead.objects.all(),
}

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('leads.urls')),
    re_path(r'^', views.FrontendAppView.as_view()),
]
