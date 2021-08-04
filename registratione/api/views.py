from rest_framework.generics import CreateAPIView
from django.http  import HttpResponse
from rest_framework.permissions import AllowAny
import yagmail
from registratione.models import LNMOnline,Receipt
from registratione.api.serializers import LNM0nlineSerializer
import io
from django.http import FileResponse
from reportlab.pdfgen import canvas
from nltk.tag import StanfordNERTagger


class LNMCallbackUrlAPIView(CreateAPIView):
    queryset = LNMOnline.objects.all()
    serializer_class = LNM0nlineSerializer
    permission_classes = [AllowAny]

    def create(self, request, *args, **kwargs):

        print(request.data,"this is request.data")

        '''
        {
        'Body':
             {'stkCallback':
                  {'MerchantRequestID': '10299-129983-1',
                     'CheckoutRequestID': 'ws_CO_DMZ_531894378_28062019092906781',
                     'ResultCode': 0,
                     'ResultDesc': 'The service request is processed successfully.',
                     'CallbackMetadata': 
                           {'Item': [
                            {'Name': 'Amount', 'Value': 1.0},
                            {'Name': 'MpesaReceiptNumber', 'Value': 'NFS0VR9HS8'},
                            {'Name': 'Balance'},
                            {'Name': 'TransactionDate', 'Value': 20190628092921},
                            {'Name': 'PhoneNumber', 'Value': 254792071275}
                            ]
                     }
                  }
             }
             
        } 
                    
        '''

        merchant_request_id = request.data["Body"]["stkCallback"]['MerchantRequestID']
        checkout_request_id = request.data["Body"]["stkCallback"]['MerchantRequestID']
        result_code = request.data["Body"]["stkCallback"]['ResultCode']
        result_description = request.data["Body"]["stkCallback"]['ResultDesc']
        amount = request.data["Body"]["stkCallback"]["CallbackMetadata"]["Item"][0]["Value"]
        mpesa_receipt_number = request.data["Body"]["stkCallback"]["CallbackMetadata"]["Item"][1]["Value"]
        balance = ""
        transaction_date = request.data["Body"]["stkCallback"]["CallbackMetadata"]["Item"][3]["Value"]
        phone_number = request.data["Body"]["stkCallback"]["CallbackMetadata"]["Item"][4]["Value"]

        from datetime import datetime

        str_transaction_date = str(transaction_date)
        transaction_datetime = datetime.strptime(str_transaction_date,"%Y%m%d%H%M%S")

        import pytz
        aware_transaction_datetime = pytz.utc.localize(transaction_datetime)

        from registratione.models import LNMOnline

        our_model = LNMOnline.objects.create(
        CheckoutRequestID=checkout_request_id,
        MerchantRequestID = merchant_request_id,
        ResultCode = result_code,
        ResultDesc = result_description,
        Amount = amount,
        MpesaReceiptNumber = mpesa_receipt_number,
        Balance = balance,
        TransactionDate = aware_transaction_datetime,
        PhoneNumber = phone_number,

        )

        our_model.save()

        buffer = io.BytesIO()

        p = canvas.Canvas(buffer)

        p.drawString(100, 100, "Hello World.")

        p.showPage()
        p.save()

        buffer.seek(0)

        response = FileResponse(buffer, content_type='application/pdf')
        response['Content-Disposition'] = 'attachment; filename="REPORT.pdf"'

        receiver = ["briansigilai@gmail.com","pjgichana@gmail.com",'qachuka@gmail.com']
        body = str(phone_number) + 'Has Paid 20,000'

        yag = yagmail.SMTP('qachuka@gmail.com', 'pppgggjjj')
        yag.send(
            to=receiver,
            subject="Payment Received!",
            contents=body,
        )

        obj = Receipt.objects.filter(phone=phone_number).update(payment_id=mpesa_receipt_number,payment_status='Paid')
        obj.save()
        print(phone_number)
        print(obj)

        return response











from django.views.decorators.csrf import csrf_exempt
from rest_framework.response import Response
from rest_framework.views import APIView



