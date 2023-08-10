FROM python:3.8-slim
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 3456
ENV NAME HelloApp
CMD ["python", "hello.py"]