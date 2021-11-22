###############
## FUNCTIONS ##
###############
logKeyValuePair()
{
    echo "    $1: $2"
}
logWarning()
{
    echo "    WARNING -> $1"
}
logAction()
{
    echo ""
    echo "$1 ..."
}

############
## SCRIPT ##
############
set -e
export AWS_DEFAULT_REGION=$AWS_REGION
export AWS_ACCOUNT_ID=$ACCOUNT_ID_DEV_INFRA
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_TFM
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY_TFM

WKDIR=$PWD
logAction "PLANNING INFRASTRUCTURE"
SERVICE_NAME="proxy-plus-lambda"
logKeyValuePair "service-name" $SERVICE_NAME
cd "$WKDIR/tests/$SERVICE_NAME/terraform"
terraform init
terraform plan
cd "$WKDIR"