Arquivos necessários para subir o Znuny LTS na versão 6.5.15 <br><br>

Explicação geral: Container mariadb como banco otrs zerado e usuario otrs com permissões corretas além de outros parametros necessarios ao Znuny. Senha de root do banco qwe123. Se quiser alterar, edite o Dockerfile
Container do znuny com base no rockylinux 8 contendo versão lts 6.5.15 e configuração limpa.
Após primeira execução dos containers, acesse o instalador do znuny (installer.pl) e selecione para instalar em um banco já criado (banco otrs, usuario otrs, senha qwe123). Se quiser alterar a senha do banco do usuario otrs, acesso o script grant.sql dentro da pasta mariadb e altere lá antes da primeira execução dos containers. <br><br>

Após a primeira executação e instalação, a configuração é persistida nas pastas volumes/mysql e volumes/otrs <br><br>

Em uma máquina GNU/Linux (testado no Rocky Linux 8 e 9) com Docker instalado execute como root:

1 - mkdir /opt/docker/znuny <br>
2 - cd /opt/docker/znuny <br>
3 - git clone --branch master https://github.com/alexandre-muzzio/znuny.git <br>
4 - cd /opt/docker/znuny/znuny/ <br>
5 - docker build -t znuny:6.5.15 . <br>
6 - cd mariadb <br>
7 - docker build -t mariadb-znuny:10.1 . <br>
8 - cd /opt/docker/znuny <br>
