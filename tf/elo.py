from models import Elo, Player, Match
from datetime import datetime

class eloresult:
    def __init__(self):
        self.eloDelta1 = 0
        self.eloDelta2 = 0

def recalculateElos():
    #Clear the whole Elo table
    Elo.objects.all().delete()

    #For each player, assign a starting Elo of 1000
    elos = dict()
    dt = datetime(2015,2,15,0,0,0)
    for p in Player.objects.all():
        elo = Elo(player=p,elo_date=dt,elo=1000)
        elo.save()
        elos[p.id] = 1000

    #For each match, calculate the new elo and add an elo row for every player involved
    for m in Match.objects.order_by('match_date'):
        redTeamElo = elos[m.playerRed1.id]
        if m.playerRed2 is not None:
            redTeamElo += elos[m.playerRed2.id]
            redTeamElo /= 2.0
        blueTeamElo = elos[m.playerBlue1.id]
        if m.playerBlue2 is not None:
            blueTeamElo += elos[m.playerBlue2.id]
            blueTeamElo /= 2.0
        outcome = 1
        if m.scoreBlue == m.scoreRed:
            outcome = 0.5
        elif m.scoreBlue > m.scoreRed:
            outcome = 0
        newElos = getNewElos(redTeamElo,blueTeamElo,outcome)
        players = [m.playerRed1, m.playerRed2, m.playerBlue1, m.playerBlue2]
        deltas = [newElos.eloDelta1, newElos.eloDelta1, newElos.eloDelta2, newElos.eloDelta2]
        for i in range(0,4):
            if players[i] is not None:
                elos[players[i].id] = elos[players[i].id]+deltas[i]
                elo = Elo(player=players[i],elo_date=m.match_date,elo=int(elos[players[i].id]))
                elo.save()
        

def getNewElos(elo1, elo2, outcome):
    result = eloresult()
    K = 24
    expected1 = 1.0 / (1.0 + 10.0**((elo2-elo1)/400))
    expected2 = 1.0 / (1.0 + 10.0**((elo1-elo2)/400))
    result.eloDelta1 = round(K*(outcome - expected1))
    result.eloDelta2 = round(K*((1-outcome) - expected2))
    return result
