# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tf', '0003_auto_20150214_1707'),
    ]

    operations = [
        migrations.AlterField(
            model_name='match',
            name='playerBlue1',
            field=models.ForeignKey(related_name=' Blue 1', to='tf.Player', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='match',
            name='playerRed1',
            field=models.ForeignKey(related_name=' Red 1', to='tf.Player', null=True),
            preserve_default=True,
        ),
    ]
