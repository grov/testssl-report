##***Modification du script de base afin de ne récupérer que les protocoles SSL/TLS utilisés (TLS, SSL etc ... ).***


# Test SSL
Given a list of urls, run [Dirk Wetter's testssl.sh](https://github.com/drwetter/testssl.sh) 
on each and tabulate failures only into a single spreadheet.

## List of URLS to test
* These should be put in `urls.txt` on separate lines


## Run standalone
```
./cloneRunAndAggregate.sh
```
The file `results/fails.csv` will be generated.

## Example
If `urls.txt` consists of

```
google.com
yahoo.com
microsoft.com
```

`./results/fails.csv` might very well look like:

```
"Application","id","fqdn/ip","port","severity","finding"
google.com,"sslv3","google.com/172.217.3.14","443","NOT ok","SSLv3 is offered (NOT ok)"
google.com,"std_MEDIUM","google.com/172.217.3.14","443","NOT ok","Medium grade encryption offered (NOT ok) - bad"
google.com,"std_3DES","google.com/172.217.3.14","443","NOT ok","Triple DES Ciphers offered (NOT ok) - not too bad"
google.com,"hsts","google.com/172.217.3.14","443","NOT ok","No support for HTTP Strict Transport Security"
google.com,"poodle_ssl","google.com/172.217.3.14","443","NOT ok","POODLE, SSL (CVE-2014-3566) : VULNERABLE (NOT ok), uses SSLv3+CBC (check if TLS_FALLBACK_SCSV mitigation is used)"
google.com,"cbc_ssl3","google.com/172.217.3.14","443","NOT ok","BEAST (CVE-2011-3389) : CBC ciphers for SSL3: DES-CBC3-SHA AES128-SHA AES256-SHA"
google.com,"cbc_tls1","google.com/172.217.3.14","443","NOT ok","BEAST (CVE-2011-3389) : CBC ciphers for TLS1: DES-CBC3-SHA AES128-SHA AES256-SHA ECDHE-RSA-AES128-SHA ECDHE-RSA-AES256-SHA"
google.com,"beast","google.com/172.217.3.14","443","NOT ok","BEAST (CVE-2011-3389) : VULNERABLE -- but also supports higher protocols (possible mitigation): TLSv1.1 TLSv1.2"
google.com,"rc4","google.com/172.217.3.14","443","NOT ok","RC4 (CVE-2013-2566, CVE-2015-2808) : VULNERABLE (NOT ok) Detected ciphers: ECDHE-RSA-RC4-SHA RC4-SHA RC4-MD5 RC4-MD5"
yahoo.com,"std_MEDIUM","yahoo.com/98.139.183.24","443","NOT ok","Medium grade encryption offered (NOT ok) - bad"
yahoo.com,"std_3DES","yahoo.com/98.139.183.24","443","NOT ok","Triple DES Ciphers offered (NOT ok) - not too bad"
yahoo.com,"hsts","yahoo.com/98.139.183.24","443","NOT ok","No support for HTTP Strict Transport Security"
yahoo.com,"cbc_tls1","yahoo.com/98.139.183.24","443","NOT ok","BEAST (CVE-2011-3389) : CBC ciphers for TLS1: DES-CBC3-SHA AES128-SHA AES256-SHA ECDHE-RSA-AES128-SHA ECDHE-RSA-AES256-SHA"

.... etc ....
```

### NOTE:
**This was designed to run on a Jenkins server which freshly 
downloads and runs the project each time.
Consequesntly, it only works *LOCALLY* if you *haven't* 
yet cloned the `testssl.sh` repo.**
If you already cloned this repo (and are happy with its currency) 
just comment out the first line of `cloneRunAndAggregate.sh`

