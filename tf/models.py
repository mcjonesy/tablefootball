from django.db import models

class Player(models.Model):
    player_name = models.CharField("Player Name",max_length=200)
    rank = models.IntegerField("Rank",default=0)
    def __unicode__(self):
        return self.player_name

class Elo(models.Model):   
    player = models.ForeignKey(Player)
    elo_date = models.DateTimeField("Date of Elo") 
    elo = models.IntegerField("Elo",default=1000)
    def __unicode__(self):
        return self.player.__unicode__() + " " + str(self.elo_date)

class Match(models.Model):
    playerRed1 = models.ForeignKey(Player, null=True, related_name=" Red 1")
    playerRed2 = models.ForeignKey(Player, blank=True, null=True, related_name=" Red 2")
    playerBlue1 = models.ForeignKey(Player, null=True, related_name=" Blue 1")
    playerBlue2 = models.ForeignKey(Player, blank=True, null=True, related_name=" Blue 2")
    match_date = models.DateTimeField("Date of Match")
    scoreRed = models.IntegerField("Team Red Score")
    scoreBlue = models.IntegerField("Team Blue Score")
    ordered = models.BooleanField("Ordered",default=False)
    def __unicode__(self):
        return str(self.match_date)
