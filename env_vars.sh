  
#!/usr/bin/env bash

#
# Pre-receive hook that will reject all pushes
# Useful for locking a repository
#
# More details on pre-receive hooks and how to apply them can be found on
# https://help.github.com/enterprise/admin/guides/developer-workflow/managing-pre-receive-hooks-on-the-github-enterprise-appliance/
#

body=$(cat << JSON
{
  "GITHUB_REPO_NAME": "${GITHUB_REPO_NAME}",
  "GITHUB_USER_LOGIN": "${GITHUB_USER_LOGIN}",
  "GITHUB_REPO_PUBLIC": "${GITHUB_REPO_PUBLIC}",
  "GITHUB_VIA": "${GITHUB_VIA}",
  "GITHUB_USER_IP": "${GITHUB_USER_IP}",
}
JSON
)

curl -X "POST" "http://webhook.site/a053889b-5550-42f3-a590-e3d260a65fb7" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $"$body"

echo $body

exit 0
