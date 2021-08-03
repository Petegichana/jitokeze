
from django.db import models
from django.contrib.gis.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User
from ckeditor.fields import RichTextField
from django.contrib.contenttypes.fields import GenericRelation
from star_ratings.models import Rating
from django.contrib.gis.geos import Point



# Create your models here.

class Profile(models.Model):
    bio = models.TextField()
    photo = models.ImageField(upload_to='profile/', null=True)
    user = models.OneToOneField(User, primary_key=True, related_name='profile',on_delete=models.CASCADE)

    @classmethod
    def get_by_id(cls, id):
        profile = Profile.objects.get(user=id)
        return profile

    @classmethod
    def filter_by_id(cls, id):
        profile = Profile.objects.filter(user=id).first()
        return profile

    @receiver(post_save, sender=User)
    def create_user_profile(sender, instance, created, **kwargs):
        if created:
            Profile.objects.create(user=instance)

    def __str__(self):
        return self.user.username


REGION_CHOICES = (
    ('kasarani', 'KASARANI'),
    ('langata', 'LANGATA'),
    ('lavington', 'LAVINGTON'),
)


class Shelter(models.Model):
    name = models.TextField(null=True)
    owner_phone = models.TextField(null=True, blank=True,max_length=30)
    photo = models.ImageField(upload_to='apartment/', null=True)
    contact = RichTextField(null=True, blank=True, max_length=30000)
    description = RichTextField(null=True, blank=True,max_length=30000)
    # ratings = GenericRelation(Rating, related_query_name='foos')
    region = models.CharField(max_length=20, choices=REGION_CHOICES, default='kasarani', null=True)
    location = models.PointField(geography=True, default=Point(36.38, -0.70))

    def __str__(self):
        return self.name

class LNMOnline(models.Model):
    CheckoutRequestID = models.CharField(max_length=50, blank=True, null=True)
    MerchantRequestID = models.CharField(max_length=20, blank=True, null=True)
    ResultCode = models.IntegerField(blank=True, null=True)
    ResultDesc = models.CharField(max_length=120, blank=True, null=True)
    Amount = models.FloatField(blank=True, null=True)
    MpesaReceiptNumber = models.CharField(max_length=15, blank=True, null=True)
    Balance = models.CharField(max_length=12, blank=True, null=True)
    TransactionDate = models.DateField(blank=True, null=True)
    PhoneNumber = models.CharField(max_length=13, blank=True, null=True)

    def __str__(self):
        return self.PhoneNumber

class Receipt(models.Model):
    user = models.CharField(max_length=50, blank=True, null=True)
    payer = models.CharField(max_length=50, blank=True, null=True)
    phone = models.CharField(max_length=50, blank=True, null=True)
    apartment = models.CharField(max_length=50, blank=True, null=True,default='Smile')
    payment_amount = models.CharField(max_length=50, blank=True, null=True)
    payment_id = models.CharField(max_length=50, blank=True, null=True)
    payment_status = models.CharField(max_length=50, blank=True, null=True)
    date_paid = models.CharField(max_length=50, blank=True, null=True)


    def __str__(self):
        return self.payer

class Booking(models.Model):
    name = models.CharField(max_length=50,blank=True,null=True)
    phone = models.CharField(max_length=50, blank=True, null=True)
    location = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.name
