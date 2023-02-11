#! /usr/bin/env bash

while [[ $# -gt 0 ]]; do
    case $1 in
        --testdoc)          shift;  testdoc="$1"        ;shift;;
        --scope)            shift;  scope="$1"          ;shift;;
        --client_id)        shift;  client_id="$1"      ;shift;;
        --client_secret)    shift;  client_secret="$1"  ;shift;;
        *)
        echo "unrecognized argument: $1"; exit 1
    esac
done

testdoc=${testdoc:-prado:SWE-AO-05001}
scope=${scope:-document}
client_id=${client_id:-svipe-demo}
client_secret=${client_secret:-svipe-demo-secret}

state=$(uuidgen)
nonce=$(uuidgen)
redirect_uri="http://localhost/auth"

oidc_issuer="https://api.svipe.com/oidc/v1"

idp_config=$(curl -s ${oidc_issuer}/.well-known/openid-configuration)

ep_authorize=$( echo $idp_config | jq -r .authorization_endpoint)
ep_token=$(     echo $idp_config | jq -r .token_endpoint)
ep_userinfo=$(  echo $idp_config | jq -r .userinfo_endpoint)

build_qs ()  { echo -n $* | tr -s ' \n' '&'; }
get_qs_var() { echo "$1" | tr '?&' '\n' | awk -F= "\$1==\"$2\" {print \$2}"; }

response_authorize=$(
    curl -s -w %{redirect_url}\
    ${ep_authorize}?$(build_qs "
            redirect_uri=${redirect_uri}
            response_type=code
            state=${state}
            nonce=${nonce}
            client_id=${client_id}
            scope=${scope}
            login_hint=test:${testdoc}
    ")
)

code=$(get_qs_var $response_authorize code)

response_token=$(
    curl -s -X POST \
        -d $(build_qs "
            code=$code
            grant_type=authorization_code
            redirect_uri=${redirect_uri}
            client_secret=${client_secret}
        ") \
        $ep_token
)

id_token=$(     echo $response_token | jq -r .id_token)
access_token=$( echo $response_token | jq -r .access_token)

response_userinfo=$(
    curl -s -X POST \
        -d $(build_qs "
            access_token=$access_token
        ") \
        $ep_userinfo
)

echo "--- id token"
echo $id_token

echo
echo "--- userinfo"
echo $response_userinfo | jq .

