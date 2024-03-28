$command=$args[0]
$stack=$args[1]
switch ($command) {
    "deploy" {
        Write-Output "Deploying networking on stack: $stack-network"
        aws cloudformation deploy --template-file network.yml --parameter-overrides file://network-parameters.json --stack-name $stack-network
        Write-Output "`n"
        Write-Output "Deploying application on stack: $stack-application"
        aws cloudformation deploy --template-file udagram.yml --parameter-overrides file://udagram-parameters.json --capabilities "CAPABILITY_NAMED_IAM"--stack-name test-application
    }
    "tear-down" {
        Write-Output "Tearing down stack: $stack-application"
        aws cloudformation delete-stack --stack-name $stack-application 
        Write-Output "`n"
        Write-Output "Tearing down stack: $stack-network"
        aws cloudformation delete-stack --stack-name $stack-network
    }
    "dry-run" {
        Write-Output "Dry-Running networking on stack: $stack-network"
        aws cloudformation deploy --template-file network.yml --parameter-overrides file://network-parameters.json --stack-name $stack-network --no-execute-changeset
        Write-Output "`n"
        Write-Output "Dry-Running application on stack: $stack-application"
        aws cloudformation deploy --template-file udagram.yml --parameter-overrides file://udagram-parameters.json --capabilities "CAPABILITY_NAMED_IAM" --stack-name test-application --no-execute-changeset
    }
}