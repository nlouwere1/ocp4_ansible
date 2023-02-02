#!/bin/bash
oc create -f rbac.yaml
oc adm policy add-scc-to-user hostmount-anyuid system:serviceaccount:default:nfs-client-provisioner
oc create -f deployment.yaml
oc create -f class.yaml
oc create -f test-claim.yaml -f test-pod.yaml
