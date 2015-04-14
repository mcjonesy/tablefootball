from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'tablefootball.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^tf/', include('tf.urls', namespace="tf")),
    url(r'^$', include('tf.urls', namespace="tf")),
    url(r'^admin/', include(admin.site.urls)),
)
