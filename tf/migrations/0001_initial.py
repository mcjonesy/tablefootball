# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Elo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('elo_date', models.DateTimeField(verbose_name=b'Date of Elo')),
                ('elo', models.IntegerField(default=1000, verbose_name=b'Elo')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Match',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('match_date', models.DateTimeField(verbose_name=b'Date of Match')),
                ('scoreRed', models.IntegerField(verbose_name=b'Team Red Score')),
                ('scoreBlue', models.IntegerField(verbose_name=b'Team Blue Score')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Player',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('player_name', models.CharField(max_length=200, verbose_name=b'Player Name')),
                ('rank', models.IntegerField(default=0, verbose_name=b'Rank')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='match',
            name='playerBlue1',
            field=models.ForeignKey(related_name='Blue1', to='tf.Player', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='match',
            name='playerBlue2',
            field=models.ForeignKey(related_name='Blue2', to='tf.Player', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='match',
            name='playerRed1',
            field=models.ForeignKey(related_name='Red1', to='tf.Player', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='match',
            name='playerRed2',
            field=models.ForeignKey(related_name='Red2', to='tf.Player', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='elo',
            name='player',
            field=models.ForeignKey(to='tf.Player'),
            preserve_default=True,
        ),
    ]
