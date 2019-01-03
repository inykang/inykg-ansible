# How to build Micro CEP docker image
The artifacts in this page might be outdated. If it is the case, then execute following, in another directory.

> git clone http://gitlab.obzen.com:8085/lab/obzen-cep.git<br>
> cd obzen-cep<br>
> cd cep-microservice<br>
> ../gradlew shadowJar<br>
> cd docker-build<br>
> ./update.sh<br>
