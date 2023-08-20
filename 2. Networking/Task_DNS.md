# Networking

## DNS

1. **Register free domain (…pp.ua) https://nic.ua/en/domains**

    Firstly, I registered a new domain:

    ![](images/domain_registered.png)

2. **Activate created domain**

    After that, I activated it:

    ![](images/domain_activated.png)

3. **Register new AWS Account https://portal.aws.amazon.com/billing/signup#/start/email**

    ![](images/sign_up_complete.png)

4. **Create Hosted Zone in Route 53 (name of hosted zone should the name of registered domain on https://nic.ua/en/domains).**

    ![](images/hosted_zone_created.png)

5. **Copy NS records in hosted zone and Change NS-servers setting to ‘Custom name server’ on nic.ua and paste copied NS records**

    ![](images/custom_ns.png)

6. **Check NS records of your domain using dig or nslookup commands (you should see NS records from hosted zone)**

    ![](images/dig_ns.png)

7. **Create A and CNAME records in hosted zone.**

    ![](images/a_and_cname_records.png)

8. **\*Set latency routing policy for two DNS records.**

    ![](images/latency_based.png)

9. **\*Check created dns records using dig or nslookup commands.**

    ![](images/dig_1.png)
    ![](images/dig_2.png)
    ![](images/nslookup_result.png)