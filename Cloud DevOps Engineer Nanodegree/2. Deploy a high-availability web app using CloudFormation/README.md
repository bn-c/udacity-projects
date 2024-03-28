# CD12352 - Infrastructure as Code Project Solution
# Nguyen Chi Bach

## Prerequisites
- AWS CLI
- PowerShell

## Spin up instructions
Create/Update the stacks.
```powershell
.\infra.ps1 deploy <stack-name>
```

## Tear down instructions
Removing the stacks.
```powershell
.\infra.ps1 tear-down <stack-name>
```

## Dry-Run
Create with `--no-execute-changeset`.

```powershell
.\infra.ps1 dry-run <stack-name>
```

## Working example
http://test-a-webap-gutigklbkfsn-891735602.ap-northeast-1.elb.amazonaws.com/