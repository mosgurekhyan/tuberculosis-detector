FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    python3-dev \
    gcc \
    g++ \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/

RUN python -m pip install --upgrade pip

RUN pip install mysqlclient==2.2.7

RUN pip install -r requirements.txt

COPY . /app/

EXPOSE 8000
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]