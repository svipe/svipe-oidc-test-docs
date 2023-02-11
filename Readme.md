
# Test Documents

Svipe supports the use of test documents to test Oidc integrations, which is documented
[here](https://developer.svipe.com/documentation#/oidc?id=test-documents)

This repo contains a bash script that showcases this using curl, and supports the following command line switches:

* **--scope** one of the supported oidc scopes. See [here](https://developer.svipe.com/documentation#/oidc?id=scopes) for more details. We recommend `document+email+phone` as it returns the maximum set of supported information. Email is a sample email generated from the name. The phone number is random and uses the country code for the issuing country and complies with the format used by that country.

* **--testdoc** One of the supported test docs
  * prado:SWE-AO-05001
  * prado:SWE-AO-04001
  * prado:GBR-AO-06001
  * prado:FRA-AO-03004
  * prado:THA-AO-06001
  * prado:USA-AO-05001
* **--client_id**
* **--client_secret**

Sample usage:

    ./test_authcode_testdoc.bash \
       --scope document+email+phone \
       --testdoc prado:SWE-AO-05001

which results in:

    --- id token
    eyJhbGciOiJSUzI1NiIsImtpZCI6IllUMjZCX05nRWc1cUZZTUlKUUJhdUFybDFsVkdyLUZCTGtTRWxkcmlnTU0iLCJrdHkiOiJSU0EifQ.eyJleHAiOjE2NzYxMTY3NzIsImlhdCI6MTY3NjExMzQ3MiwibmJmIjoxNjc2MTEzNDcyLCJpc3MiOiJodHRwczovL2FwaS5zdmlwZS5jb20vb2lkYy92MSIsImF1ZCI6InN2aXBlLWRlbW8iLCJzaWQiOiJVZ1dCNUNLdUhMNVpvTVNET1BST3ZfbHpkWEZXZldwVzEwa1hlbDBZVTM0S1dMc2NvSnc4cC0tTVhvTmdVTlEwNnBrIiwiYXV0aF90aW1lIjoxNjc2MTEzNDcyLCJzdWIiOiIwZDMyMDI2NzE4M2QxODM1NTRhYTAwYTU0NmQxMzBkZCIsInN2aXBlaWQiOiIwZDMyMDI2NzE4M2QxODM1NTRhYTAwYTU0NmQxMzBkZCIsImF0X2hhc2giOiJVSkI2YlZpenpoZFpLbkgwNmFSdVF3IiwiY19oYXNoIjoia1BGOURNNVY5cExRLXdlaFRXclQ4QSIsInByZWZlcnJlZF91c2VybmFtZSI6InN2ZWEuc3BlY2ltZW5Abm8tc3VjaC1kb21haW4uY29tIiwiY29tLnN2aXBlOm1ldGFfdHJhbnNhY3Rpb25faWQiOiJBWVpBSmVwYS5wVTlkNHlJS19ZNUhzV19jVUxCaFVDenVsSjU2Ym9RRjM4U0daTXBSIiwibm9uY2UiOiI5RDRDOUU5Ni1DMTA4LTQxQ0ItODE2OS01QjBCMUM0RTAwRTcifQ.kSY77AKoFeeyr71zu34pInE1q0eoFG9HQHDqpWHxO69dqhTEEQHGhaAOLF-q0EC_ofqcQKWwOkUkVmJtnNeIUanHZUJqiDa-t6vCmBt8ah6h0E8pqnf44X_4d9y7VIml_lg_xoF1oQuarelwG4tvn8tA5iSYmHGesb8kj6x3mBJXNMX9uNxXzkpp0XWZ4urMCQ4d-YECYC6OMhRft4V9k-z5bCV23p72MQi88068gx5YRMGppYBb6keDCbIcCKN9z_GR-stXC-_A7cHu464LvPysNNRkmUGh7UKIDKFkwId4SDJp5TSfDS7Muz4gESrPSsmVGnTeukSXdJlZbwSsgmhRDvyOEiJiq9JuDdAPNq3xnJpdGzll9WSTfIt3F2075IOxP0Cwg9pMPAG1czrnWgWrw1fgnqz0PQeQOn5hq1234_1IZVFa4Xh0muVWAaU12vbLMx3tZR7zkj6dUF0LPczToAUOpBkenf7CQPKf4HGolsztW-p6mCunPcjpErattM7uhkY5Uh5B8fBi0sYQf7FkVTCdoo9eZOemQvpDlY_-837BF2AmRk7KScQsRKVUJgy_G43VlYpnSJWAG5YllZYnanfCgZaqJkWCXN5ga654v6x5E5aj1_UymyNyiKY1e7TYkCgaV1ULen8XQjYPwZM7ohDf2bM0d_O3bos7LDg

    --- userinfo
    {
        "sub": "0d320267183d183554aa00a546d130dd",
        "name": "Svea Specimen",
        "given_name": "Svea",
        "family_name": "Specimen",
        "gender": "female",
        "birthdate": "1982-08-21",
        "email": "svea.specimen@no-such-domain.com",
        "email_verified": true,
        "phone_number": "+468123456",
        "phone_number_verified": true,
        "svipeid": "0d320267183d183554aa00a546d130dd",
        "com.svipe:document_type_sdn": "PN",
        "com.svipe:document_type_sdn_en": "Passport",
        "com.svipe:document_issuing_country_en": "Sweden",
        "com.svipe:document_nationality_en": "Sweden",
        "com.svipe:svipeid": "0d320267183d183554aa00a546d130dd",
        "com.svipe:document_nationality": "SWE",
        "com.svipe:document_type": "P",
        "com.svipe:document_administrative_number": "198208212384",
        "com.svipe:document_number": "XA0000001",
        "com.svipe:document_issuing_country": "SWE",
        "com.svipe:document_expiry_date": "2027-01-01",
        "com.svipe:meta_transaction_id": "AYZAJepa.pU9d4yIK_Y5HsW_cULBhUCzulJ56boQF38SGZMpR"
    }
