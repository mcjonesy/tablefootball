from django.conf.urls import patterns, url

from tf import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^(?P<match_id>\d+)/$', views.details, name='match_details'),
    url(r'^matches/$', views.matches, name='matches'),
    url(r'^addmatch/$', views.addmatch, name='addmatch'),
    url(r'^removematch/(?P<match_id>\d+)/$', views.removematch, name='removematch'),
    url(r'^removematchsubmit/(?P<match_id>\d+)/$', views.removematchsubmit, name='removematchsubmit'),
    url(r'^addmatchsubmit/$', views.addmatchsubmit, name='addmatchsubmit'),
    url(r'^player/(?P<player_id>\d+)/$', views.playerpage, name='playerpage'),
)
