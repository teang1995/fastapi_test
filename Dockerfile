# base image 설정
FROM python:3.10

WORKDIR /app
RUN python -m pip install --upgrade pip

# 필요한 라이브러리 설치
COPY requirements.txt ./
RUN pip install -r requirements.txt

RUN apt-get update
COPY . .

# 환경 변수 설정
ENV BASE_DIR=/
ENV TZ=Asia/Seoul

# 컨테이너가 시작될 때 실행할 명령어
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5100"]