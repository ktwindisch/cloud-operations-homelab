# AWS Identity Center Authentication

## Overview

Phase 6 uses AWS IAM Identity Center for secure human and CLI access to AWS.

The goal was to avoid using the AWS root account for normal administration and avoid creating long-lived AWS access keys.

No AWS infrastructure resources were created during this step.

## Root Account

The AWS root account was already protected with MFA.

Root access was used only to bootstrap IAM Identity Center and create a non-root administrative identity.

## IAM Identity Center

IAM Identity Center was enabled as a single-Region organization instance in:

```text
us-east-2
US East (Ohio)
```

A single-Region instance was intentionally selected instead of the default multi-Region configuration because the multi-Region option required a customer-managed AWS KMS key and displayed a warning that KMS charges would apply.

This decision supported the Phase 6 requirement that the project remain at $0.00.

## Administrative Identity

The following IAM Identity Center user was created:

```text
kevin-admin
```

The user was protected with:

- A dedicated password
- Multi-factor authentication

The `AdministratorAccess` permission set was created and assigned to the AWS account for initial administrative access.

The account was successfully accessed through the AWS access portal using the `kevin-admin` identity.

## AWS CLI SSO Configuration

The AWS CLI was configured to authenticate through IAM Identity Center.

Configuration:

```text
SSO session: homelab-sso
CLI profile: homelab-admin
Permission set: AdministratorAccess
SSO Region: us-east-2
Default AWS Region: us-east-2
Output format: json
```

No AWS access key or secret access key was created.

## Verification

Authentication was verified with:

```text
aws sts get-caller-identity --profile homelab-admin
```

Safe verification output:

```text
AWS Identity Center authentication verified
```

The configured region was verified with:

```text
aws configure get region --profile homelab-admin
```

Result:

```text
us-east-2
```

Available AWS CLI profiles were verified with:

```text
aws configure list-profiles
```

Profiles:

```text
default
homelab-admin
```

## Troubleshooting

During AWS CLI configuration, the output format was accidentally entered as:

```text
js
```

This caused the AWS CLI to return:

```text
Unknown output type: js
```

The authentication configuration itself was working correctly.

The issue was fixed with:

```text
aws configure set output json --profile homelab-admin
```

After correcting the output format, AWS Identity Center authentication succeeded.

## Security Result

The Phase 6 AWS authentication path is now:

```text
IAM Identity Center user
        ↓
MFA
        ↓
Permission set
        ↓
Temporary role credentials
        ↓
AWS CLI
```

The root account is no longer required for normal project administration.

Long-lived AWS access keys are not being used.

## Default AWS CLI Profile

Git Bash was configured to use the `homelab-admin` profile automatically.

The following environment variable was added to `~/.bashrc`:

```text
export AWS_PROFILE=homelab-admin
```

After reloading the shell configuration, new Git Bash sessions automatically use the `homelab-admin` AWS CLI profile.

This allows the Identity Center session to be started with:

```text
aws sso login
```

instead of repeatedly specifying:

```text
--profile homelab-admin
```

The active AWS profile can be verified with:

```text
echo $AWS_PROFILE
```

Expected result:

```text
homelab-admin
```

## Result

Secure AWS CLI authentication through IAM Identity Center is operational.

No AWS infrastructure resources were created during this step.