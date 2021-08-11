import yagmail
from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.views.decorators.csrf import csrf_exempt

from .forms import ProfileForm
from .models import Profile, Shelter, Receipt, Booking, ShelterBookingCount
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from .forms import SignupForm
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.core.mail import EmailMessage
import secrets
from . import keys
import base64
from datetime import datetime
import requests
from requests.auth import HTTPBasicAuth
from django.http import HttpResponse
from django.db.models import F
from django.views.generic import FormView
from django.urls import reverse
from paypal.standard.forms import PayPalPaymentsForm

from django.contrib import messages
from django.conf import settings
from decimal import Decimal
# from paypal.standard.forms import PayPalPaymentsForm


# Create your views here.
def landing(request):


    return render(request, 'landing.html')


def map(request):
    return render(request, 'map.html')


def home(request):
    apartments = Shelter.objects.all()

    return render(request, 'home.html',locals())


def apartment(request, id):

    order_id = request.session.get('order_id')
    host = request.get_host()


    apartments = Shelter.objects.filter(id=id)

    return render(request, 'apartment.html', locals())


def therapist(request):
    return render(request, 'therapist.html')


@login_required(login_url='/accounts/login/')
def profile(request):
    profile = Profile.objects.filter(user__username=request.user.username)
    receipt_details = Receipt.objects.filter(user=request.user.username)
    user_profile = User.objects.get(username=request.user)
    try:
        profile_details = Profile.get_by_id(user_profile.id)
    except:
        profile_details = Profile.filter_by_id(user_profile.id)

    return render(request, 'profile.html', locals())


@login_required(login_url='/accounts/login/')
def edit_profile(request):
    title = "Edit"
    profile = User.objects.get(username=request.user)
    try:
        profile_details = Profile.get_by_id(profile.id)
    except:
        profile_details = Profile.filter_by_id(profile.id)

    if request.method == 'POST':
        form = ProfileForm(request.POST, request.FILES, instance=request.user.profile)
        if form.is_valid():
            edit = form.save(commit=False)
            edit.user = request.user
            edit.save()
            return redirect('profile')
    else:
        form = ProfileForm()

    return render(request, 'edit_profile.html', {'form': form, 'profile_details': profile_details})


def signup(request):
    if request.method == 'POST':
        form = SignupForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.is_active = False
            user.save()
            current_site = get_current_site(request)
            mail_subject = 'Activate your registratione account.'
            message = render_to_string('acc_active_email.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)).decode(),
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            return HttpResponse('Please confirm your email address to complete the registration')
    else:
        form = SignupForm()
    return render(request, 'django_registration/login.html', {'form': form})


# unformattted_time = datetime.now()
# formatted_time = unformattted_time.strftime("%Y%m%d%H%M%S")
#
# data_to_encode = keys.business_lipaonline_shortCode + keys.lipa_na_mpesa_passkey + formatted_time
#
# encoded_string = base64.b64encode(data_to_encode.encode())
#
# decoded_password = encoded_string.decode("utf-8")
#
# consumer_key = "DycoDzpscnfmE8saUVlJVuwdv6t2Cqif"
# consumer_secret = "LEIgZaTZio1CChDM"
# api_URL = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"
#
# value = requests.get(api_URL, auth=HTTPBasicAuth(consumer_key, consumer_secret))
# value = value.json()
#
# my_token = value['access_token']
#
#
# def access_token(request):
#     value = token()
#
#     return HttpResponse(value)
#
#
# def token():
#     consumer_key = "y9zA1fyEgCyfobn9Jo8WCp1uekXCNc7X"
#     consumer_secret = "OV3fkyAtYA6U3F0z"
#     api_URL = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"
#
#     value = requests.get(api_URL, auth=HTTPBasicAuth(consumer_key, consumer_secret))
#
#     value = value.json()
#
#     return value['access_token']


def make_donation(request):
    if request.method == "POST":
        auth_user = request.user
        name = request.POST.getlist('name')
        phone = request.POST.getlist('phone')
        amount = request.POST.getlist('amount')
        apartment = request.POST.getlist('apartment')

        phone_string = ""
        payer_string = ""
        payer_amount = ""
        apartment_name = ""
        for ele in name:
            payer_string += ele
        for ele in phone:
            phone_string += ele
        for ele in apartment:
            apartment_name += ele
        for ele in amount:
            payer_amount += ele


        save_receipt = Receipt(
            user=auth_user,
            payer=payer_string,
            phone=phone_string,
            apartment=apartment_name,
            payment_amount=payer_amount,
            payment_id="Paid",
            payment_status="Paid",
        )
        save_receipt.save()



        return HttpResponseRedirect('/shelter/process-payment/')


def booking(request):
    if request.method == "POST":
        auth_user = request.user
        name = request.POST.getlist('name')
        phone = request.POST.getlist('phone')
        location = request.POST.getlist('location')
        shelter = request.POST.getlist('shelter')
        phone_string = ""
        user_name = ""
        payer_amount = ""
        location_name = ""
        shelter_name = ""
        for ele in name:
            user_name += ele
        for ele in phone:
            phone_string += ele
        for ele in location:
            location_name += ele
        for ele in shelter:
            shelter_name += ele

        save_booking = Booking(
            name=user_name,
            phone=phone_string,
            location=location_name,
            shelter_name=shelter_name
        )

        save_booking.save()

        ShelterBookingCount.objects.filter(name__name=shelter_name).update(number_of_times=F('number_of_times') + 1)

        receiver = ["briansigilai@gmail.com", "pjgichana@gmail.com", 'qachuka@gmail.com']
        body = user_name + ' of phone number ' + phone_string + ', has booked ' + shelter_name

        yag = yagmail.SMTP('qachuka@gmail.com', 'pppgggjjj')
        yag.send(
            to=receiver,
            subject=shelter_name + ' booked!',
            contents=body,
        )

        return HttpResponseRedirect('/home')


def pie_chart(request):
    labels = []
    data = []

    queryset = ShelterBookingCount.objects.order_by('-number_of_times')[:5]
    for shelter in queryset:
        labels.append(shelter.name.name)
        data.append(shelter.number_of_times)

    return render(request, 'pie_chart.html', {
        'labels': labels,
        'data': data,
    })





def process_payment(request):
    order_id = request.session.get('order_id')
    host = request.get_host()
    print(secrets.token_hex(nbytes=16))
    receipt = Receipt.objects.filter(user=request.user.username).last().payment_amount
    amount = ''
    # for r in receipt:
    #     amount += r.payment_amount

    paypal_dict = {
        'business': settings.PAYPAL_RECEIVER_EMAIL,
        'amount': str(receipt),
        'item_name': 'Order 254',
        'invoice': secrets.token_hex(nbytes=16),
        'currency_code': 'USD',
        'notify_url': 'https://a41d5b6340b5.ngrok.io/paypal/',
        'return_url': 'http://localhost:8000/home',
        'cancel_return': 'https://a41d5b6340b5.ngrok.io/payment-cancelled/',
    }

    form = PayPalPaymentsForm(initial=paypal_dict)

    return render(request, 'paypal/process_payment.html', {'form': form},locals())

# def checkout(request):
#     if request.method == 'POST':
#         form = CheckoutForm(request.POST)
#         if form.is_valid():
#             cleaned_data = form.cleaned_data
#         #...
#         #...
#
#             cart.clear(request)
#
#             request.session['order_id'] = o.id
#             return redirect('process_payment')
#
#
#     else:
#         form = CheckoutForm()
#         return render(request, 'ecommerce_app/checkout.html', locals())

@csrf_exempt
def payment_done(request):
    return render(request, 'paypal/payment_done.html')


@csrf_exempt
def payment_canceled(request):
    return render(request, 'paypal/payment_cancelled.html')
