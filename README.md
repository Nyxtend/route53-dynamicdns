# route53-dynamicdns
A container with dependencies installed to roll-your-own route53 dynamic DNS service.

# Example kubernetes batch job
```
apiVersion: batch/v1
kind: CronJob
metadata:
  name: dyndns
spec:
  schedule: "* * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: dyndns
            image: ghcr.io/nyxtend/route53-dynamicdns:latest
            env:
              - name: DNS_FQDN
                value: "your-dns-record.your-domain.com"
              - name: AWS_ZONE_ID
                value: "YOUR_ZONE_ID_HERE"
              - name: AWS_ACCESS_KEY_ID
                value: "YOUR_AWS_ACCESS_KEY_ID_HERE"
              - name: AWS_SECRET_ACCESS_KEY
                value: "YOUR_AWS_SECRET_ACCESS_KEY_HERE"
              - name: AWS_DEFAULT_REGION
                value: "us-east-1"
              - name: DNS_TTL
                value: "30"
          restartPolicy: OnFailure
```
