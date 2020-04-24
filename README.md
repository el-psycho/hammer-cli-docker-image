# hammer cli docker image
This is a docker image for the hammer CLI tool which talks to Foreman/Katello.
It has hammer plugins typically installed with Katello.
To use this, you need docker (or podman) installed.

If you have podman installed and want to you it instead of docker, substitute the
word "docker" with "podman" for the instructions below.

### Building
Make sure you're in the directory containing the Dockerfile and run the following
command:
```
docker build -t hammer .
```

### Example usage
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
alias hammer='docker run --rm -v "/path/to/hammer.yml:/etc/hammer/cli.modules.d/foreman.yml" hammer'
```

After adding the alias, you can simply use it like so:
```
hammer os list
...
```

