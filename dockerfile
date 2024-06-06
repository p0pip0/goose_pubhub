#--------------------------------------------------------------------------------------------------
# Dockerfile to build Docker Image of Nginx running on RedOS
#--------------------------------------------------------------------------------------------------

    FROM ubuntu

    RUN apt-get update \
    # RUN apt-get install -y nginx
        && apt-get install -y python3 \
        && apt-get install -y curl \
        && rm -rf /var/lib/apt/lists/*
    
    WORKDIR /app

    ARG APP_ENV=v.0.1.0
    ENV APP_ENV="${APP_ENV}"

    EXPOSE 8000
    
    # ENTRYPOINT ["sleep"]
    # CMD ["5000"]

    COPY server.py /app

    # CMD ["nginx", "-g", "daemon off;"]
    CMD ["python3", "server.py"]

    # docker container rm -f $(docker ps -a -q) #Удаляем все контейнеры
    # docker rmi ubuntu_nginx #Удаляем нужный образ
    # docker build -f '/home/popi/TestZone/goose-python-project/Dockerfile' -t ubuntu_nginx . #Собираем образ
    # docker run --name ubuntu_nginx -d ubuntu_nginx -p 8080:80

    # docker container rm -f $(docker ps -a -q) && docker rmi ubuntu_nginx && docker build -f '/home/popi/TestZone/goose-python-project/Dockerfile' -t ubuntu_nginx .\
    #   && docker run -p 8080:8000 --name ubuntu_nginx -d ubuntu_nginx