# Generated by Django 3.2.6 on 2021-08-03 16:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registratione', '0014_shelter_contact'),
    ]

    operations = [
        migrations.CreateModel(
            name='Bookings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=50, null=True)),
                ('phone', models.CharField(blank=True, max_length=50, null=True)),
                ('location', models.CharField(blank=True, max_length=50, null=True)),
            ],
        ),
    ]
