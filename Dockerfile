FROM python:3.12-alpine

# Տեղադրել mysqlclient-ի կոմպիլյացիայի համար անհրաժեշտ համակարգային կախվածությունները
RUN apk add --no-cache gcc musl-dev mariadb-connector-c-dev

WORKDIR /app

COPY requirements.txt /app/

RUN python -m pip install --upgrade pip
# Տեղադրել mysqlclient-ը (ենթադրում եմ, որ այն արդեն գրված է requirements.txt-ում, հակառակ դեպքում ավելացրեք այստեղ)
RUN pip install mysqlclient
COPY . /app/

EXPOSE 8000
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]