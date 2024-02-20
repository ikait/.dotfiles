set-awssession-token() {
    if [ -f ~/.aws/config ]; then
        profile_name=$1
        code=$2

        mfa_device=$(cat ~/.aws/config | grep -A 4 $profile_name | grep mfa-device | cut -f 3 -d " " | head -n 1)
        session_token=$(aws sts get-session-token --serial-number $mfa_device --token-code $code --profile $profile_name)
        export AWS_ACCESS_KEY_ID=$(echo $session_token | jq -r .Credentials.AccessKeyId)
        export AWS_SECRET_ACCESS_KEY=$(echo $session_token | jq -r .Credentials.SecretAccessKey)
        export AWS_SESSION_TOKEN=$(echo $session_token | jq -r .Credentials.SessionToken)
    else
        echo "No ~/.aws/config"
    fi
}

release-awssession-token() {
    export -n AWS_ACCESS_KEY_ID
    export -n AWS_SECRET_ACCESS_KEY
    export -n AWS_SESSION_TOKEN
}
