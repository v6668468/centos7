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
yum -y install sudo; \
adduser -G wheel --password sac19FwGGTx/A svd; \
chgrp -R 0 /root && \
chmod -R g=u /root
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
