FROM centos:7.6.1810

RUN true \
  && yum install -y \
    epel-release \
    centos-release-scl \
    https://yum.theforeman.org/releases/1.22/el7/x86_64/foreman-release.rpm \
    https://fedorapeople.org/groups/katello/releases/yum/3.12/katello/el7/x86_64/katello-repos-latest.rpm \
  && yum clean all \
  && rm -vrf /var/cache/yum

RUN true \
  && yum install -y \
    tfm-rubygem-hammer_cli-0.17.1-1.el7 \
    tfm-rubygem-hammer_cli_foreman-0.17.0-1.el7 \
    tfm-rubygem-hammer_cli_katello-0.18.0-1.el7 \
    tfm-rubygem-hammer_cli_foreman_bootdisk-0.1.3-7.el7 \
    tfm-rubygem-hammer_cli_foreman_docker-0.0.4-4.el7 \
    tfm-rubygem-hammer_cli_foreman_tasks-0.0.13-1.fm1_22.el7 \
  && yum clean all \
  && rm -vrf /var/cache/yum

ENTRYPOINT ["/usr/bin/hammer"]
CMD []
