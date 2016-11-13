# hubot-rafiki

**rafiki** is a chat bot built on the [Hubot](http://hubot.github.com) framework. It was
initially generated by [generator-hubot](https://github.com/github/generator-hubot), and configured to be
deployed on [heroku](http://www.heroku.com) to get you up and running as quick as possible.

This README is intended to help get you started with this instance **(hubot-rafiki)**.
Update it, improve it, and talk about your own instance, how to use and deploy it,
what functionality he has, etc!

# Quickstart

There are two ways to get and run rafiki:

- On bare metal
- As a Docker container

## Running on bare metal

1. Set the **web proxy** _(if necessary)_.

    ```
    cd ~
    export http_proxy=[PROXY_HOST]:8080
    export https_proxy=[PROXY_HOST]:8080
    ```

2. Install **NodeSource Node.js**.
    - If **Debian-based** linux:

        ```
        curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
        ```

    - If **RPM-based** linux:

        ```
        curl -sL https://rpm.nodesource.com/setup_4.x | sudo -E bash -
        ```

3. Install supporting **packages**.
    - If **Debian-based** linux:

        ```
        sudo -E apt-get update
        sudo -E apt-get install -y build-essential libexpat1-dev libexpat1 libicu-dev git nodejs node-gyp
        ```

    - If **RPM-based** linux:

        ```
        sudo -E yum groupinstall -y "Development Tools"
        sudo -E yum install -y libexpat1-dev libexpat1 libicu-dev git nodejs node-gyp
        ```

4. Install **npm**:

    ```
    sudo -E npm install npm -g
    ```

5. Decide **where** on your filesystem you would like to run the bot. In this example, we will install the bot to `/opt/hubot-rafiki`:

    ```
    cd /opt
    git clone https://github.com/StPaulThorndale/hubot-rafiki.git
    cd ./hubot-rafiki
    ```

6. **Install** node modules:

    ```
    npm install
    ```

7. Create the main `hubot.env` file from the template:

    ```
    cp ./hubot.env-template ./hubot.env
    ```

8. Update `hubot.env` with actual values.
9. Fix the `scoped-http-client` and `hubot-freshdesk` modules:

    ```
    ./fix-http.sh
    ./fix-freshdesk.sh
    ```

10. **Start** the hubot and tail the logs to ensure the startup is successful:

    ```
    ./start.sh
    tail -f logs/rafiki.log
    ```


## Running as a Docker container

**Prerequisite:** This hubot connects to **Flowdock**. Containers on your docker host must have internet connectivity for the connection to succeed.

***

# How was rafiki originally created?

The steps below were taken on an Ubuntu 14 (trusty) machine to build rafiki and commit the code into this repository:

1. Set the **web proxy** _(if necessary)_.

    ```
    cd ~
    export http_proxy=[PROXY_HOST]:8080
    export https_proxy=[PROXY_HOST]:8080
    ```

2. Install **NodeSource Node.js**.
    - If **Debian-based** linux:

        ```
        curl -sL https://deb.nodesource.com/setup | sudo -E bash -
        ```

    - If **RPM-based** linux:

        ```
        curl -sL https://rpm.nodesource.com/setup | sudo -E bash -
        ```

3. Install supporting **packages**.
    - If **Debian-based** linux:

        ```
        sudo -E apt-get install -y build-essential libexpat1-dev libexpat1 libicu-dev git nodejs node-gyp
        ```

    - If **RPM-based** linux:

        ```
        sudo -E yum install -y nodejs
        ```

4. Install **npm** modules.

    ```
    sudo -E npm install npm -g
    sudo -E npm install -g yo generator-hubot
    ```

5. **Instantiate** the hubot.

    ```
    mkdir hubot-rafiki
    cd hubot-rafiki
    yo hubot
    bin/hubot
    ```

6. **Configure** the hubot.

    ```
    vi hubot.env
    vi start.sh
    chmod +x start.sh
    chmod +x hubot.env
    ```

7. **Start** and **test** the hubot.

    ```
    bash start.sh
    ```

8. Ensure **git** is installed so we can communicate with this GitHub repository.

    ```
    sudo -E apt-get install git
    ```

9. Convert this directory into a **git** repository.

    ```
    git init
    git add .
    git config --global user.email "colossus9@hpe.com"
    git config --global user.name "colossus9"
    ```

10. If you have any code changes, **commit and push** then into GitHub.

    ```
    git commit -m "Initial commit of working rafiki hubot"
    git remote add origin https://github.com/StPaulThorndale/hubot-rafiki.git
    git pull origin master
    git status
    git push -u origin master
    ```

## Installing Redis-Server

The steps below were taken on an Ubuntu 14 (trusty) machine to install `redis-server` for rafiki's brain (instructions taken from http://redis.io/topics/quickstart):

```
cd /tmp
export http_proxy=http://web-proxy.corp.hpecorp.net:8080
export https_proxy=http://web-proxy.corp.hpecorp.net:8080
sudo apt-get install -y tcl8.5
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
make test
sudo make install
```

***

# Original hubot INFO

The information in the below sections are cloned from the original hubot source.

## Running rafiki Locally

You can test your hubot by running the following, however some plugins will not
behave as expected unless the [environment variables](#configuration) they rely
upon have been set.

You can start rafiki locally by running:

    % bin/hubot

You'll see some start up output and a prompt:

    [Sat Feb 28 2015 12:38:27 GMT+0000 (GMT)] INFO Using default redis on localhost:6379
    rafiki>

Then you can interact with rafiki by typing `rafiki help`.

    rafiki> rafiki help
    rafiki animate me <query> - The same thing as `image me`, except adds [snip]
    rafiki help - Displays all of the help commands that rafiki knows about.
    ...

### Configuration

A few scripts (including some installed by default) require environment
variables to be set as a simple form of configuration.

Each script should have a commented header which contains a "Configuration"
section that explains which values it requires to be placed in which variable.
When you have lots of scripts installed this process can be quite labour
intensive. The following shell command can be used as a stop gap until an
easier way to do this has been implemented.

    grep -o 'hubot-[a-z0-9_-]\+' external-scripts.json | \
      xargs -n1 -I {} sh -c 'sed -n "/^# Configuration/,/^#$/ s/^/{} /p" \
          $(find node_modules/{}/ -name "*.coffee")' | \
        awk -F '#' '{ printf "%-25s %s\n", $1, $2 }'

How to set environment variables will be specific to your operating system.
Rather than recreate the various methods and best practices in achieving this,
it's suggested that you search for a dedicated guide focused on your OS.

### Scripting

An example script is included at `scripts/example.coffee`, so check it out to
get started, along with the [Scripting Guide][https://hubot.github.com/docs/scripting/].

For many common tasks, there's a good chance someone has already one to do just
the thing.

[scripting-docs]: https://github.com/github/hubot/blob/master/docs/scripting.md

### external-scripts

There will inevitably be functionality that everyone will want. Instead of
writing it yourself, you can use existing plugins.

Hubot is able to load plugins from third-party `npm` packages. This is the
recommended way to add functionality to your hubot. You can get a list of
available hubot plugins on [npmjs.com][npmjs] or by using `npm search`:

    % npm search hubot-scripts panda
    NAME             DESCRIPTION                        AUTHOR DATE       VERSION KEYWORDS
    hubot-pandapanda a hubot script for panda responses =missu 2014-11-30 0.9.2   hubot hubot-scripts panda
    ...


To use a package, check the package's documentation, but in general it is:

1. Use `npm install --save` to add the package to `package.json` and install it
2. Add the package name to `external-scripts.json` as a double quoted string

You can review `external-scripts.json` to see what is included by default.

##### Advanced Usage

It is also possible to define `external-scripts.json` as an object to
explicitly specify which scripts from a package should be included. The example
below, for example, will only activate two of the six available scripts inside
the `hubot-fun` plugin, but all four of those in `hubot-auto-deploy`.

```json
{
  "hubot-fun": [
    "crazy",
    "thanks"
  ],
  "hubot-auto-deploy": "*"
}
```

**Be aware that not all plugins support this usage and will typically fallback
to including all scripts.**

[npmjs]: https://www.npmjs.com

### hubot-scripts

Before hubot plugin packages were adopted, most plugins were held in the
[hubot-scripts][hubot-scripts] package. Some of these plugins have yet to be
migrated to their own packages. They can still be used but the setup is a bit
different.

To enable scripts from the hubot-scripts package, add the script name with
extension as a double quoted string to the `hubot-scripts.json` file in this
repo.

[hubot-scripts]: https://github.com/github/hubot-scripts

##  Persistence

If you are going to use the `hubot-redis-brain` package (strongly suggested),
you will need to add the Redis to Go addon on Heroku which requires a verified
account or you can create an account at [Redis to Go][redistogo] and manually
set the `REDISTOGO_URL` variable.

    % heroku config:add REDISTOGO_URL="..."

If you don't need any persistence feel free to remove the `hubot-redis-brain`
from `external-scripts.json` and you don't need to worry about redis at all.

[redistogo]: https://redistogo.com/

## Adapters

Adapters are the interface to the service you want your hubot to run on, such
as Campfire or IRC. There are a number of third party adapters that the
community have contributed. Check [Hubot Adapters][hubot-adapters] for the
available ones.

If you would like to run a non-Campfire or shell adapter you will need to add
the adapter package as a dependency to the `package.json` file in the
`dependencies` section.

Once you've added the dependency with `npm install --save` to install it you
can then run hubot with the adapter.

    % bin/hubot -a <adapter>

Where `<adapter>` is the name of your adapter without the `hubot-` prefix.

[hubot-adapters]: https://github.com/github/hubot/blob/master/docs/adapters.md

## Deployment

    % heroku create --stack cedar
    % git push heroku master

If your Heroku account has been verified you can run the following to enable
and add the Redis to Go addon to your app.

    % heroku addons:add redistogo:nano

If you run into any problems, checkout Heroku's [docs][heroku-node-docs].

You'll need to edit the `Procfile` to set the name of your hubot.

More detailed documentation can be found on the [deploying hubot onto
Heroku][deploy-heroku] wiki page.

### Deploying to UNIX or Windows

If you would like to deploy to either a UNIX operating system or Windows.
Please check out the [deploying hubot onto UNIX][deploy-unix] and [deploying
hubot onto Windows][deploy-windows] wiki pages.

[heroku-node-docs]: http://devcenter.heroku.com/articles/node-js
[deploy-heroku]: https://github.com/github/hubot/blob/master/docs/deploying/heroku.md
[deploy-unix]: https://github.com/github/hubot/blob/master/docs/deploying/unix.md
[deploy-windows]: https://github.com/github/hubot/blob/master/docs/deploying/windows.md

## Campfire Variables

If you are using the Campfire adapter you will need to set some environment
variables. If not, refer to your adapter documentation for how to configure it,
links to the adapters can be found on [Hubot Adapters][hubot-adapters].

Create a separate Campfire user for your bot and get their token from the web
UI.

    % heroku config:add HUBOT_CAMPFIRE_TOKEN="..."

Get the numeric IDs of the rooms you want the bot to join, comma delimited. If
you want the bot to connect to `https://mysubdomain.campfirenow.com/room/42`
and `https://mysubdomain.campfirenow.com/room/1024` then you'd add it like
this:

    % heroku config:add HUBOT_CAMPFIRE_ROOMS="42,1024"

Add the subdomain hubot should connect to. If you web URL looks like
`http://mysubdomain.campfirenow.com` then you'd add it like this:

    % heroku config:add HUBOT_CAMPFIRE_ACCOUNT="mysubdomain"

[hubot-adapters]: https://github.com/github/hubot/blob/master/docs/adapters.md

## Restart the bot

You may want to get comfortable with `heroku logs` and `heroku restart` if
you're having issues.

## Aliases

The following are some aliases we have defined for the bot in its **redis** brain:

```
road : what road do i take
gangnam : oppa gangnam style
what do you remember : list remem
hammer time : time
flowdock : what is flowdock
tickets : get tickets
ticket : get tickets
```
