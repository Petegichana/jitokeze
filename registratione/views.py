from django.shortcuts import render
from django.http import HttpResponseRedirect
from .forms import ProfileForm
from .models import Profile, Shelter, Receipt
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
from . import keys
import base64
from datetime import datetime
import requests
from requests.auth import HTTPBasicAuth
from django.http import HttpResponse


# Create your views here.
def landing(request):
    return render(request, 'landing.html')


def map(request):
    return render(request, 'map.html')


def home(request):
    apartments = Shelter.objects.all()

    return render(request, 'home.html', locals())


def apartment(request, id):
    apartments = Shelter.objects.filter(id=id)

    return render(request, 'apartment.html', locals())


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
    return render(request, 'django_registration/registration_form.html', {'form': form})


unformattted_time = datetime.now()
formatted_time = unformattted_time.strftime("%Y%m%d%H%M%S")

data_to_encode = keys.business_lipaonline_shortCode + keys.lipa_na_mpesa_passkey + formatted_time

encoded_string = base64.b64encode(data_to_encode.encode())

decoded_password = encoded_string.decode("utf-8")

consumer_key = "DycoDzpscnfmE8saUVlJVuwdv6t2Cqif"
consumer_secret = "LEIgZaTZio1CChDM"
api_URL = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"

value = requests.get(api_URL, auth=HTTPBasicAuth(consumer_key, consumer_secret))
value = value.json()

my_token = value['access_token']


def access_token(request):
    value = token()

    return HttpResponse(value)


def token():
    consumer_key = "y9zA1fyEgCyfobn9Jo8WCp1uekXCNc7X"
    consumer_secret = "OV3fkyAtYA6U3F0z"
    api_URL = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"

    value = requests.get(api_URL, auth=HTTPBasicAuth(consumer_key, consumer_secret))

    value = value.json()

    return value['access_token']


def lipa_na_mpesa(request):
    if request.method == "POST":
        auth_user = request.user
        name = request.POST.getlist('name')
        phone = request.POST.getlist('phone')
        # amount = request.POST.getlist('amount')
        apartment = request.POST.getlist('apartment')
        date_paid = unformattted_time.strftime("%Y-%m-%d %H:%M:%S")
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
        # for ele in amount:
        #     amount += ele

        amount = 1
        new_access_token = token()
        api_url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"
        headers = {"Authorization": "Bearer %s" % new_access_token}
        request = {
            "BusinessShortCode": keys.business_lipaonline_shortCode,
            "Password": decoded_password,
            "Timestamp": formatted_time,
            "TransactionType": "CustomerPayBillOnline",
            "Amount": amount,
            "PartyA": phone_string,
            "PartyB": keys.business_lipaonline_shortCode,
            "PhoneNumber": phone_string,
            "CallBackURL": "https://cbf69b3c1c6f.ngrok.io/api/payments/lnm/",
            "AccountReference": phone_string,
            "TransactionDesc": "Load Wallet"
        }

        save_receipt = Receipt(
            user=auth_user,
            payer=payer_string,
            phone=phone_string,
            apartment=apartment_name,
            payment_amount=payer_amount,
            payment_id="Unpaid",
            payment_status="Unpaid",
            date_paid=date_paid
        )
        save_receipt.save()

        response = requests.post(api_url, json=request, headers=headers)

        return HttpResponseRedirect('/profile/', response)
