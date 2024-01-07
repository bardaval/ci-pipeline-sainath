#!/bin/bash
echo "deploy takes place"
cp -rf /opt/zerodowntime.yml /opt/kubeconfig
#git clone  https://git-codecommit.ap-south-1.amazonaws.com/v1/repos/kubeconfig
cd /opt/kubeconfig
git add .
git commit -m "newbuildexecuting"
git push -u origin
