from datetime import datetime
from tf import elo
from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from tf.models import Match, Player, Elo
from django.db.models import Max, Q
import time

def index(request):
    latest_match_list = Match.objects.order_by('-match_date')[:10]

    #Get the list of players ordered by latest elo. Unusually tricky stuff!
    player_list = Player.objects.order_by('player_name').annotate(max_date=Max('elo__elo_date'))
    f = '%Y-%m-%d %H:%M:%S'
    values = tuple([(int(player.id), time.strftime(f,player.max_date.timetuple())) for player in player_list])
    elos = Elo.objects.extra(where=['(player_id, elo_date) IN %s' % (values,)])
    elo_dict = dict([(e.player.id, e) for e in elos])
    player_list = list(player_list)
    for player in player_list:
        player.elo_cache = elo_dict[player.id]
    player_list.sort(key=lambda x: x.elo_cache.elo, reverse=True)

    #Add player's rank, taking into consideration that two players with the same elo should have equal ranks
    c = 1
    prevElo=-1
    curRank = 1
    prevPlayer = player_list[0]
    for player in player_list:
        if prevElo == player.elo_cache.elo:
            player.rank = '%d=' % curRank
            prevPlayer.rank = player.rank
        else:
            player.rank = '%d' % c
            curRank = c
        prevPlayer = player
        prevElo = player.elo_cache.elo
        c = c + 1

    context = { 'latest_match_list': latest_match_list,
                'player_list': player_list }

    matches = Match.objects.all()
    context['redGoals'] = 0
    context['redMatches'] = 0
    context['blueGoals'] = 0
    context['blueMatches'] = 0
    for match in matches:
        context['redGoals'] += match.scoreRed
        context['blueGoals'] += match.scoreBlue
        if match.scoreRed > match.scoreBlue:
            context['redMatches'] += 1
        elif match.scoreBlue > match.scoreRed:
            context['blueMatches'] += 1

    context['redGoalsPercent'] = 100 * context['redGoals'] / (context['redGoals'] + context['blueGoals'])
    context['blueGoalsPercent'] = 100 * context['blueGoals'] / (context['redGoals'] + context['blueGoals'])
    context['redMatchesPercent'] = 100 * context['redMatches'] / (context['redMatches'] + context['blueMatches'])
    context['blueMatchesPercent'] = 100 * context['blueMatches'] / (context['blueMatches'] + context['redMatches'])

    return render(request, 'tf/index.html', context)

def playerpage(request,player_id):
    player = Player.objects.get(id=player_id)
    #stats that I want to begin with:
    #  - Wins/Losses/Elo by match/Elo by day
    #  - I want to show all of this as a progress bar
    elo_list = Elo.objects.filter(player__id=player_id).order_by('elo_date')

    #I want to get at most two elo objects per date - the first and last on every given date
    curDate = None
    c = 0
    elos = list(elo_list)
    lenelos = len(elos)
    for i in range(lenelos-1,-1,-1):
        if (elos[i].elo_date.date() != curDate):
            curDate = elos[i].elo_date.date()
            for j in range(1,c):
                del elos[i+2]
            c = 0
        else:
            c += 1

    context = { 'player' : player, 'elo_list' : elos}

    redPlays = Match.objects.filter(Q(playerRed1=player_id) | Q(playerRed2=player_id))
    context['redWins'] = 0.0
    context['redDraws'] = 0.0
    context['redPlays'] = 0.0

    for play in redPlays:
        context['redPlays']+=1.0
        if play.scoreRed > play.scoreBlue:
            context['redWins']+=1.0
        if play.scoreBlue == play.scoreRed:
            context['redDraws']+=1.0

    bluePlays = Match.objects.filter(Q(playerBlue1=player_id) | Q(playerBlue2=player_id))
    context['blueWins'] = 0.0
    context['blueDraws'] = 0.0
    context['bluePlays'] = 0.0

    for play in bluePlays:
        context['bluePlays']+=1.0
        if play.scoreBlue > play.scoreRed:
            context['blueWins']+=1.0
        if play.scoreBlue == play.scoreRed:
            context['blueDraws']+=1.0

    context['totalWins'] = (context['redWins'] + context['blueWins'])
    context['totalDraws'] = (context['redDraws'] + context['blueDraws'])

    if context['redPlays'] < 0.9:
        context['redWins'] = 0.0
        context['redDraws'] = 0.0
        context['redPlaysPercent'] = 0.0
    else:
        context['redWins'] /= context['redPlays']/100
        context['redDraws'] /= context['redPlays']/100
        context['redPlaysPercent'] = (100 * context['redPlays']) / (context['bluePlays'] + context['redPlays'])
    context['redLosses'] = 100 - context['redWins']

    if context['bluePlays'] < 0.9:
        context['blueWins'] = 0.0
        context['blueDraws'] = 0.0
        context['bluePlaysPercent'] = 0.0
    else:
        context['blueWins'] /= context['bluePlays']/100
        context['blueDraws'] /= context['bluePlays']/100
        context['bluePlaysPercent'] = (100 * context['bluePlays']) / (context['bluePlays'] + context['redPlays'])
    context['blueLosses'] = 100 - context['blueWins']

    context['totalPlays'] = context['redPlays'] + context['bluePlays']
    if context['totalPlays'] < 0.9:
        context['totalWins'] = 0.0
        context['totalDraws'] = 0.0
    else:
        context['totalWins'] /= context['totalPlays']/100
        context['totalDraws'] /= context['totalPlays']/100
    context['totalLosses'] = 100 - context['totalWins']

    return render(request, 'tf/player.html', context)

def matches(request):
    match_list = Match.objects.order_by('-match_date')
    context = { 'match_list' : match_list }
    return render(request, 'tf/matches.html', context)

def addmatch(request):
    player_list = Player.objects.all().order_by('player_name')
    plist = []
    plist.append(dict(id=-1,player_name='-'))
    for p in player_list:
       plist.append(dict(id=p.id,player_name=p.player_name))
    context = { 'datetime' : datetime.now(),
                'player_list_without_null' : player_list,
                'player_list' : plist }
    return render(request, 'tf/addmatch.html', context)

def removematchsubmit(request,match_id):
    Match.objects.get(id=match_id).delete()
    elo.recalculateElos()
    return HttpResponseRedirect(reverse('tf:index'))

def removematch(request,match_id):
    match_obj = Match.objects.get(id=match_id)
    return render(request, 'tf/removematch.html', {'match' : match_obj})

def addmatchsubmit(request):
    #try:
    atts = dict()
    atts['playerRed1'] = Player.objects.get(id=request.POST['playerRed1'])
    if request.POST['playerRed2'] != '-1':
        atts['playerRed2'] = Player.objects.get(id=request.POST['playerRed2'])
    atts['playerBlue1'] = Player.objects.get(id=request.POST['playerBlue1'])
    if request.POST['playerBlue2'] != '-1':
        atts['playerBlue2'] = Player.objects.get(id=request.POST['playerBlue2'])
    atts['match_date'] = request.POST['match_date']
    atts['scoreRed'] = request.POST['scoreRed']
    atts['scoreBlue'] = request.POST['scoreBlue']
    atts['ordered'] = request.POST.has_key('ordered')
    match = Match(**atts)
    match.save()
    elo.recalculateElos()
    return HttpResponseRedirect(reverse('tf:index'))

def details(request, match_id):
    response = "You're looking at the results of match %s."
    return HttpResponse(response % match_id)

# Create your views here.
