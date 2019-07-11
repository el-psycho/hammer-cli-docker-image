# hammer cli docker image
This is a docker image for the hammer CLI tool which talks to Foreman/Katello.
It has hammer plugins typically installed with Katello.
To use this, you need docker (or podman) installed.

### Building using docker
```
docker build -t hammer .
```

### Example usage using docker
In this example, `/path/to/hammer.yml` is your hammer configuration YAML file.
There is a sample configuration file in this repo named `hammer-config-sample.yml`.
Have a look at it for a starting point which should have most of what you need.
```
docker run --rm -v "/path/to/hammer.yml:/etc/hammer/cli.modules.d/foreman.yml" hammer os list

---|-------------------|--------------|--------
ID | TITLE             | RELEASE NAME | FAMILY 
---|-------------------|--------------|--------
3  | CentOS 7          |              | Redhat 
19 | Fedora 29 Live CD |              | Redhat 
---|-------------------|--------------|--------
```

To make the command shorter, create a bash alias (add it to your ~/.bashrc for persistance):
```
alias hammer='docker run --rm -v "/path/to/hammer.yml:/etc/hammer/cli.modules.d/foreman.yml" hammer os list'

hammer os list
...
```

