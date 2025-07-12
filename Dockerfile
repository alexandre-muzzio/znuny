#OTRS ticketing system docker image.
FROM rockylinux:8
ENV OTRS_VERSION=6.5.15-01

COPY Rocky-PowerTools.repo /etc/yum.repos.d
RUN dnf install -y epel-release
RUN dnf update -y
RUN dnf -y install bzip2 cronie httpd mysql mod_perl perl-Apache-DBI gcc make perl-devel dnf-plugins-core
RUN dnf -y install vim perl-core "perl(Crypt::SSLeay)" "perl(Net::LDAP)" "perl(URI)" "perl(LWP::Protocol::https)"
RUN dnf -y install procmail "perl(Date::Format)" "perl(LWP::UserAgent)" "perl(Net::DNS)" "perl(Data::UUID)" "perl(ModPerl::Util)"
RUN dnf -y install "perl(IO::Socket::SSL)" "perl(XML::Parser)" "perl(Apache2::Reload)" "perl(Crypt::Eksblowfish::Bcrypt)"
RUN dnf -y install "perl(Encode::HanExtra)" "perl(GD)" "perl(GD::Text)" "perl(GD::Graph)" "perl(JSON::XS)" "perl(Mail::IMAPClient)"
RUN dnf -y install "perl(PDF::API2)" "perl(DateTime)" "perl(Text::CSV_XS)" "perl(YAML::XS)" "perl(Text::CSV_XS)" "perl(DBD::mysql)"
RUN dnf -y install perl-Moo "perl(namespace::clean)" "perl(Crypt::Random::Source)" "perl(Exporter::Tiny)" "perl(Math::Random::ISAAC)"
RUN dnf -y install "perl(Math::Random::Secure)" "perl(Module::Find)" "perl(Types::TypeTiny)" rsyslog supervisor tar which cpanminus
RUN dnf -y install "perl(Crypt::JWT)" "perl(Crypt::OpenSSL::X509)" "perl(Hash::Merge)" "perl(Spreadsheet::XLSX)" "perl(PerlIO::gzip)"
RUN cpanm iCal::Parser 
RUN cpanm CPAN::Audit
RUN cpanm CSS::Minifier::XS
RUN dnf install -y https://download.znuny.org/releases/RPMS/rhel/7/znuny-6.5.15-01.noarch.rpm
RUN /opt/otrs/bin/otrs.CheckModules.pl
RUN dnf clean all
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
