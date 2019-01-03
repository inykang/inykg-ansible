# Docker Image Registry
Verify or change the IP address of **prireg** in ```vars/hosts.yaml```.

# Building base systems
```ansible-playbook -i ../hosts create-common-base.yaml```

# Rolling back
```ansible-playbook -i ../hosts destroy-common-base.yaml```
