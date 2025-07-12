Arquivos necessários para subir o Znuny LTS na versão 6.5.15 <br><br>

Explicação geral: Container mariadb com banco otrs zerado e usuário otrs com permissões corretas além de outros parâmetros necessários ao Znuny. Senha de root do banco qwe123. Se quiser alterar, edite o Dockerfile e rode novamente o docker build.
Container do znuny com base no rockylinux 8 contendo versão lts 6.5.15 e configuração limpa.
Após primeira execução dos containers, acesse o instalador do znuny (https://<IP docker>/otrs/installer.pl) e selecione para instalar em um banco já existente (banco otrs, usuário otrs, senha qwe123). Se quiser alterar a senha do banco do usuário otrs, acesso o script grant.sql dentro da pasta mariadb/init e altere lá antes da primeira execução dos containers. <br><br>

Após a primeira execução e instalação, a configuração é persistida nas pastas volumes/mysql e volumes/otrs <br><br>

Em uma máquina GNU/Linux (testado no Rocky Linux 8 e 9) com Docker instalado execute como root:

1 - mkdir /opt/docker/znuny <br>
2 - cd /opt/docker/znuny <br>
3 - git clone --branch master https://github.com/alexandre-muzzio/znuny.git <br>
4 - cd /opt/docker/znuny/znuny/ <br>
5 - docker build -t znuny:6.5.15 . <br>
6 - cd mariadb <br>
7 - docker build -t mariadb-znuny:10.1 . <br>
8 - cd /opt/docker/znuny/znuny <br>
9 - docker compose up -d
10 - https://<IP docker>/otrs/installer.pl
