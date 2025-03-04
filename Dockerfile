FROM python:3.11-slim-buster as poetry_build

WORKDIR /app

COPY . .

RUN pip install poetry
RUN poetry config virtualenvs.in-project true
RUN poetry install --no-dev

FROM python:3.11-slim-buster

WORKDIR /app

COPY --from=poetry_build /app /app

CMD [ ".venv/bin/python", "main.py" ]
