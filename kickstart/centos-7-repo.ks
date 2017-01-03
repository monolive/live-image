#repo --name=rawhide --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=rawhide&arch=$basearch
repo --name=base --baseurl=http://infra.monolive.org/centos/$releasever/$basearch/base
repo --name=update --baseurl=http://infra.monolive.org/centos/$releasever/$basearch/updates
