FROM centos:7
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*; \
echo 'root' | passwd --stdin root; \
adduser -G wheel --password sac19FwGGTx/A svd; \
yum -y install sudo net-tools iproute telnet nc openssh-server openssh-clients bind-utils;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
# svd pass: x11docker
