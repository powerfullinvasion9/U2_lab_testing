FROM python:3.9

RUN mkdir /app

COPY . /app
COPY pyproject.toml /app

WORKDIR /app
ENV PYTHONPATH=${PYTHONPATH}:${PWD}

RUN pip3 install poetry 
RUN poetry config virtualenvs.create false
RUN poetry install 
RUN poetry shell

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]