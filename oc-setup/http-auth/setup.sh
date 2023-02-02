#!/bin/bash
sudo yum -y install httpd-tools
htpasswd -c -B -b ocp_users.htpasswd user1 user1
htpasswd -Bb ocp_users.htpasswd user2 user2
htpasswd -Bb ocp_users.htpasswd user3 user2
htpasswd -Bb ocp_users.htpasswd admin admin
htpasswd -Bb ocp_users.htpasswd developer developer
oc create secret generic htpass-secret --from-file=htpasswd=./ocp_users.htpasswd -n openshift-config
oc apply -f htpasswd-oauth.yaml
oc adm policy add-cluster-role-to-user cluster-admin admin
oc  get pods -n openshift-authentication -w
