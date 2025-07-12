Arquivos necessários para subir o Znuny LTS na versão 6.5.15

Em uma máquina GNU/Linux (testado no Rocky Linux 8 e 9) com Docker instalado execute como root:

1 - mkdir /opt/docker/znuny <br>
2 - cd /opt/docker/znuny <br>
3 - git clone --branch master https://github.com/alexandre-muzzio/znuny.git <br>
4 - cd /opt/docker/znuny/znuny/ <br>
5 - docker build -t znuny:6.5.15 . <br>
6 - cd mariadb <br>
7 - docker build -t mariadb-znuny:10.1 . <br>
8 - cd /opt/docker/znuny <br>
