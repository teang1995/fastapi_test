docker build -t test_model ./
docker rm -f test_model
docker run -d -p 1234:5100 --name test_model test_model:latest