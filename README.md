# Scheduled Github to Gitlab Sync

This project provides a docker-compose wrapper for [Github2Gitlab](https://github.com/ubc/github2gitlab) with cron functionality.

The cronjobs-file runs by default every 5 minutes and can be adapted.

```
$ cat cronjobs
*/5 * * * * sh /run_cron.sh
```

It executes the `run.sh`, where your `github2gitlab` can be placed.

```
#!/bin/sh

github2gitlab --gitlab-url http://mygitlab.example.com --gitlab-token XXX --gitlab-repo test/test
```

More info how to use it you can find in the [documentation](https://github.com/ubc/github2gitlab), the [sourcecode](https://github.com/ubc/github2gitlab/blob/master/github2gitlab/main.py) or executing the command with --help:

```
$ github2gitlab --help
  usage: github2gitlab [-h] --gitlab-url GITLAB_URL --gitlab-token GITLAB_TOKEN
                       [--gitlab-repo GITLAB_REPO] [--github-token GITHUB_TOKEN]
                       --github-repo GITHUB_REPO
                       [--ssh-public-key SSH_PUBLIC_KEY] [--branches BRANCHES]
                       [--ignore-closed] [--skip-pull-requests] [--verbose]
                       [--cache]
  
  migrate projects from GitHub to GitLab
  
  optional arguments:
    -h, --help            show this help message and exit
    --gitlab-url GITLAB_URL
                          Gitlab url
    --gitlab-token GITLAB_TOKEN
                          Gitlab authentication token
    --gitlab-repo GITLAB_REPO
                          Gitlab repo (for instance ceph/ceph)
    --github-token GITHUB_TOKEN
                          GitHub authentication token
    --github-repo GITHUB_REPO
                          GitHub repo (for instance ceph/ceph)
    --ssh-public-key SSH_PUBLIC_KEY
                          SSH public key
    --branches BRANCHES   comma separated list of git branches to mirror
                          (defaults to all)
    --ignore-closed       ignore pull requests closed and not merged
    --skip-pull-requests  do not mirror PR to MR
    --verbose             enable verbose (debug) logging
    --cache               cache GitHub pull requests list
```

# Installation

Clone this repository

```
$ git clone https://github.com/rabbl/dockerized-github2gitlab.git github2gitlab
$ cd github2gitlab
```

Adapt the run.sh script with your information.
Build and start the project with docker-compose:

```
$ docker-compose build
$ docker-compose up -d
```

To see if it's working check the logs:

```
$ docker-compose logs -f
```

