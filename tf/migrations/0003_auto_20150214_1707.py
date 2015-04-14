# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tf', '0002_auto_20150214_1705'),
    ]

    operations = [
        migrations.AlterField(
            model_name='match',
            name='playerBlue1',
            field=models.ForeignKey(related_name=' Blue 1', blank=True, to='tf.Player', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='match',
            name='playerBlue2',
            field=models.ForeignKey(related_name=' Blue 2', blank=True, to='tf.Player', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='match',
            name='playerRed1',
            field=models.ForeignKey(related_name=' Red 1', blank=True, to='tf.Player', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='match',
            name='playerRed2',
            field=models.ForeignKey(related_name=' Red 2', blank=True, to='tf.Player', null=True),
            preserve_default=True,
        ),
    ]
